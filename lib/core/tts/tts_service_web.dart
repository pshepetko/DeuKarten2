// lib/core/tts/tts_service_web.dart
import 'dart:async';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:web/web.dart' as web;

import 'tts_segment.dart';
import 'tts_service.dart';

extension _SpeechVoiceExt on web.SpeechSynthesisVoice {
  bool get isDefault {
    final result = (this as JSObject)['default'];
    return (result as JSBoolean?)?.toDart ?? false;
  }
}

class WebSpeechTtsService implements TtsService {
  List<web.SpeechSynthesisVoice> _voices = [];
  bool _voicesLoaded = false;
  Completer<void>? _voicesCompleter;
  VoiceGender _preferredGender = VoiceGender.female;
  bool _warmedUp = false;

  // ✅ Кеш голосів
  final Map<String, web.SpeechSynthesisVoice?> _voiceCache = {};

  bool get _isSafari {
    final ua = web.window.navigator.userAgent.toLowerCase();
    return ua.contains('safari') &&
        !ua.contains('chrome') &&
        !ua.contains('chromium');
  }

  // ═══════════════════════════════════════════════
  // ✅ NOVELTY / ПОГАНІ голоси — ЗАВЖДИ блокуємо
  // ═══════════════════════════════════════════════
  static const _blockedKeywords = [
    // macOS novelty
    'bubbles', 'bad news', 'good news', 'cellos', 'organ',
    'trinoids', 'whisper', 'zarvox', 'bells', 'boing',
    'hysterical', 'superstar', 'deranged', 'bahh', 'wobble',
    'junior', 'albert', 'jester', 'ralph', 'kathy',
    // Chrome novelty
    'rocko', 'sandy', 'grandma', 'grandpa', 'eddy',
    'flo', 'reed', 'shelley',
    // Linux проблемні
    'espeak', 'speech-dispatcher',
  ];

  // ═══════════════════════════════════════════════
  // ✅ ЯКІСТЬ — ключові слова в назві голосу
  //    Працює для БУДЬ-ЯКОЇ мови!
  // ═══════════════════════════════════════════════
  static const _qualityKeywords = {
    // Найвища якість (+100)
    'premium': 100,
    'high quality': 100,
    'високої якості': 100,    // macOS укр локалізація
    'hohe qualität': 100,     // macOS нім локалізація
    'haute qualité': 100,     // macOS фр локалізація
    'alta calidad': 100,      // macOS ісп локалізація
    'alta qualità': 100,      // macOS іт локалізація

    // Покращений (+70)
    'enhanced': 70,
    'вдосконален': 70,        // macOS укр
    'verbessert': 70,         // macOS нім
    'amélioré': 70,           // macOS фр
    'mejorad': 70,            // macOS ісп
    'migliorat': 70,          // macOS іт

    // Compact — низька якість (-50)
    'compact': -50,
    'компактн': -50,
  };

  // ═══════════════════════════════════════════════
  // ✅ ГЕНДЕР — універсальні ключові слова
  // ═══════════════════════════════════════════════
  static const _femaleKeywords = [
    'female', 'woman', 'frau', 'femme', 'mujer', 'donna',
    // Відомі жіночі імена (міжнародні)
    'anna', 'petra', 'marlene', 'helena', 'katja',
    'vicki', 'hedda', 'sabina', 'elsa', 'fiona',
    'polina', 'oksana', 'natasha', 'lesia', 'lesya', 'леся',
    'zira', 'hazel', 'susan', 'samantha', 'karen',
    'mónica', 'paulina', 'tessa', 'alice', 'amelie',
    'sara', 'laura', 'elena', 'joana', 'ioana',
    'milena', 'daria', 'zosia', 'luciana',
    'google',  // Google TTS зазвичай жіночий
  ];

  static const _maleKeywords = [
    'male', 'man', 'mann', 'homme', 'hombre', 'uomo',
    'hans', 'stefan', 'conrad', 'florian', 'thomas',
    'daniel', 'david', 'martin', 'markus', 'yannick',
    'ostap', 'jorge', 'juan', 'luca', 'andrea',
    'jacques', 'pierre', 'oliver', 'james',
  ];

  WebSpeechTtsService() {
    print('🌐 Browser: ${_isSafari ? "Safari 🍎" : "Chrome/Other"}');
    _initVoices();
  }

  @override
  void setVoiceGender(VoiceGender gender) {
    _preferredGender = gender;
    _voiceCache.clear();
    print('🔊 TTS gender → '
        '${gender == VoiceGender.female ? "👩" : "👨"}');
  }

  // ─── Ініціалізація ─────────────────────────────

  void _initVoices() {
    _loadVoices();
    web.window.speechSynthesis.onvoiceschanged = ((web.Event event) {
      _loadVoices();
    }).toJS;
  }

  void _loadVoices() {
    final jsVoices = web.window.speechSynthesis.getVoices();
    _voices = jsVoices.toDart;

    if (_voices.isNotEmpty) {
      _voicesLoaded = true;
      _voiceCache.clear();

      if (_voicesCompleter != null && !_voicesCompleter!.isCompleted) {
        _voicesCompleter!.complete();
      }
      print('🔊 TTS: ${_voices.length} голосів завантажено');

      // Логуємо де/ук голоси для дебагу
      for (final v in _voices) {
        final p = v.lang.toLowerCase();
        if (p.startsWith('de') || p.startsWith('uk')) {
          final score = _voiceScore(v);
          final blocked = _isBlocked(v);
          print('   ${blocked ? "❌" : "📋"} ${v.name} [${v.lang}] '
              'score=$score '
              '${v.localService ? "(local)" : "(remote)"}'
              '${blocked ? " BLOCKED" : ""}');
        }
      }
    }
  }

  Future<void> _ensureVoicesLoaded() async {
    if (_voicesLoaded) return;
    _voicesCompleter ??= Completer<void>();
    await Future.any([
      _voicesCompleter!.future,
      Future.delayed(const Duration(seconds: 2)),
    ]);
  }

  // ═══════════════════════════════════════════════
  // ✅ SCORING СИСТЕМА
  // ═══════════════════════════════════════════════

  /// Чи голос заблокований (novelty/проблемний)
  bool _isBlocked(web.SpeechSynthesisVoice v) {
    final n = v.name.toLowerCase();
    return _blockedKeywords.any((kw) => n.contains(kw));
  }

  /// Рахуємо "якість" голосу за назвою
  int _voiceScore(web.SpeechSynthesisVoice v) {
    if (_isBlocked(v)) return -999;

    final n = v.name.toLowerCase();
    int score = 0;

    // ✅ Якість за ключовими словами в назві
    for (final entry in _qualityKeywords.entries) {
      if (n.contains(entry.key)) {
        score += entry.value;
        break; // одна категорія на голос
      }
    }

    // ✅ Google голоси — завжди добра якість
    if (n.contains('google')) {
      score += 90;
    }

    // ✅ Default голос — невеликий бонус
    if (v.isDefault) {
      score += 10;
    }

    // ✅ Гендер — бонус якщо збігається
    if (_matchesGender(v)) {
      score += 30;
    }

    return score;
  }

  /// Чи голос відповідає бажаному гендеру
  bool _matchesGender(web.SpeechSynthesisVoice v) {
    final n = v.name.toLowerCase();
    final keywords = _preferredGender == VoiceGender.female
        ? _femaleKeywords
        : _maleKeywords;
    return keywords.any((kw) => n.contains(kw));
  }

  // ═══════════════════════════════════════════════
  // ✅ ПОШУК ГОЛОСУ — універсальний для будь-якої мови
  // ═══════════════════════════════════════════════

  String _normalizePrefix(String locale) {
    return locale.split(RegExp(r'[-_]')).first.toLowerCase();
  }

  web.SpeechSynthesisVoice? _findVoiceInternal(String locale) {
    final lower = locale.toLowerCase().replaceAll('_', '-');
    final prefix = _normalizePrefix(locale);

    // Збираємо всі голоси для мови
    final allMatching = <web.SpeechSynthesisVoice>[];

    // Точний match (de-de)
    for (final v in _voices) {
      if (v.lang.toLowerCase().replaceAll('_', '-') == lower) {
        allMatching.add(v);
      }
    }

    // Prefix match (de)
    if (allMatching.isEmpty) {
      for (final v in _voices) {
        if (_normalizePrefix(v.lang) == prefix) {
          allMatching.add(v);
        }
      }
    }

    if (allMatching.isEmpty) {
      print('⚠️ Жодного голосу для "$locale"');
      return null;
    }

    // Фільтруємо заблоковані
    final clean = allMatching.where((v) => !_isBlocked(v)).toList();
    final candidates = clean.isNotEmpty ? clean : allMatching;

    if (candidates.length == 1) {
      print('🗣️ Єдиний для $locale: "${candidates.first.name}"');
      return candidates.first;
    }

    // ✅ Сортуємо за score — найкращий зверху
    candidates.sort((a, b) => _voiceScore(b).compareTo(_voiceScore(a)));

    // Логуємо топ-3 для дебагу
    final top = candidates.take(3).toList();
    for (final v in top) {
      print('   🏆 ${v.name} score=${_voiceScore(v)}');
    }

    final best = candidates.first;
    print('🗣️ BEST for $locale: "${best.name}" '
        'score=${_voiceScore(best)}');
    return best;
  }

  /// Публічний пошук з кешем
  web.SpeechSynthesisVoice? _findVoice(String locale) {
    if (_voiceCache.containsKey(locale)) {
      return _voiceCache[locale];
    }
    final voice = _findVoiceInternal(locale);
    _voiceCache[locale] = voice;
    return voice;
  }

  // ─── Прогрів Safari ────────────────────────────

  Future<void> _warmUp() async {
    if (_warmedUp) return;
    _warmedUp = true;
    if (!_isSafari) return;

    try {
      await _ensureVoicesLoaded();

      final utterance = web.SpeechSynthesisUtterance('.');
      utterance.volume = 0.01;
      utterance.rate = 10.0;

      final c = Completer<void>();
      utterance.onend = ((web.Event e) {
        if (!c.isCompleted) c.complete();
      }).toJS;
      utterance.onerror = ((web.Event e) {
        if (!c.isCompleted) c.complete();
      }).toJS;

      web.window.speechSynthesis.speak(utterance);
      await Future.any([
        c.future,
        Future.delayed(const Duration(milliseconds: 500)),
      ]);

      web.window.speechSynthesis.cancel();
      await Future.delayed(const Duration(milliseconds: 200));
      print('🔊 Safari warm-up ✅');
    } catch (e) {
      print('⚠️ Warm-up error: $e');
    }
  }

  // ─── Озвучення ─────────────────────────────────

  Future<void> _speakOne(TtsSegment segment) async {
    final text = segment.text.trim();
    if (text.isEmpty) return;

    await _ensureVoicesLoaded();

    final voice = _findVoice(segment.locale);
    if (voice == null) {
      print('⚠️ Skip "$text" — no voice for ${segment.locale}');
      return;
    }

    final utterance = web.SpeechSynthesisUtterance(text);
    utterance.lang = segment.locale;
    utterance.rate = segment.rate;
    utterance.volume = 1.0;
    utterance.pitch = 1.0;
    utterance.voice = voice;

    print('🗣️ "$text" → ${voice.name}');

    final completer = Completer<void>();

    utterance.onend = ((web.Event e) {
      if (!completer.isCompleted) completer.complete();
    }).toJS;

    utterance.onerror = ((web.Event e) {
      print('❌ TTS error: "$text"');
      if (!completer.isCompleted) completer.complete();
    }).toJS;

    web.window.speechSynthesis.speak(utterance);

    // Safari fix
    Timer? safariTimer;
    if (_isSafari) {
      safariTimer = Timer.periodic(
        const Duration(milliseconds: 5000),
            (_) {
          if (!completer.isCompleted) {
            web.window.speechSynthesis.pause();
            web.window.speechSynthesis.resume();
          }
        },
      );
    }

    await Future.any([
      completer.future,
      Future.delayed(
        Duration(milliseconds: (text.length * 200 + 5000).toInt()),
      ),
    ]);

    safariTimer?.cancel();
  }

  // ─── API ───────────────────────────────────────

  @override
  Future<void> speakSegments(
      List<TtsSegment> segments, {
        bool cancelPrevious = true,
        bool skipIfVoiceUnavailable = true,
      }) async {
    await _warmUp();

    if (cancelPrevious) {
      web.window.speechSynthesis.cancel();
      await Future.delayed(
        Duration(milliseconds: _isSafari ? 300 : 50),
      );
    }

    for (int i = 0; i < segments.length; i++) {
      await _speakOne(segments[i]);
      if (i < segments.length - 1) {
        await Future.delayed(
          Duration(milliseconds: _isSafari ? 250 : 100),
        );
      }
    }
  }

  @override
  Future<void> speak(
      String text, {
        String locale = 'de-DE',
        double rate = 1.0,
      }) {
    return speakSegments([
      TtsSegment(text: text, locale: locale, rate: rate),
    ]);
  }

  @override
  Future<void> stop() async {
    web.window.speechSynthesis.cancel();
  }

  @override
  Future<bool> isLanguageAvailable(String locale) async {
    await _ensureVoicesLoaded();
    return _findVoice(locale) != null;
  }

  @override
  Future<List<String>> getAvailableLanguages() async {
    await _ensureVoicesLoaded();
    return _voices.map((v) => v.lang).toSet().toList()..sort();
  }

  @override
  Future<Map<String, dynamic>> diagnose() async {
    await _ensureVoicesLoaded();

    final voiceMap = <String, List<Map<String, dynamic>>>{};
    for (final v in _voices) {
      voiceMap.putIfAbsent(v.lang, () => []);
      voiceMap[v.lang]!.add({
        'name': v.name,
        'score': _voiceScore(v),
        'local': v.localService,
        'blocked': _isBlocked(v),
      });
    }

    return {
      'browser': _isSafari ? 'Safari' : 'Chrome/Other',
      'totalVoices': _voices.length,
      'voices': voiceMap,
      'germanVoice': _findVoice('de-DE')?.name ?? 'NOT FOUND',
      'nativeVoice': _findVoice('uk-UA')?.name ?? 'NOT FOUND',
    };
  }
}

TtsService createPlatformTtsService() => WebSpeechTtsService();