// lib/screens/welcome_login_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:deu_karten/core/database/drift_database.dart';
import 'package:deu_karten/features/profile/providers/providers.dart';
import 'package:drift/drift.dart' as drift;

class WelcomeLoginScreen extends ConsumerStatefulWidget {
  const WelcomeLoginScreen({super.key});

  @override
  ConsumerState<WelcomeLoginScreen> createState() =>
      _WelcomeLoginScreenState();
}

class _WelcomeLoginScreenState extends ConsumerState<WelcomeLoginScreen> {
  bool _showLoginForm = false;

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;
  bool _obscurePassword = true;
  String? _errorText;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(_onUsernameChanged);
  }

  void _onUsernameChanged() {
    final username = _usernameController.text.trim().toLowerCase();
    if (username.isNotEmpty) {
      _emailController.text = '$username@deukarten.de';
    } else {
      _emailController.text = '';
    }
  }

  @override
  void dispose() {
    _usernameController.removeListener(_onUsernameChanged);
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _continueAsGuest() => context.go('/home');
  void _continueOhneAnmeldung() => context.go('/home');

  void _openLoginForm() {
    setState(() {
      _showLoginForm = true;
      _errorText = null;
    });
  }

  void _backToWelcome() {
    setState(() {
      _showLoginForm = false;
      _errorText = null;
    });
  }

  Future<void> _ensureUserProfile(User firebaseUser) async {
    final db = AppDatabase.instance;
    final uid = firebaseUser.uid;
    final username = firebaseUser.displayName ??
        _usernameController.text.trim();
    final email = firebaseUser.email ??
        '${_usernameController.text.trim().toLowerCase()}@deukarten.de';

    debugPrint('👤 ensureUserProfile: uid=$uid, name=$username');

    await db.into(db.userProfiles).insertOnConflictUpdate(
      UserProfilesCompanion.insert(
        id: uid,
        userId: uid,
        name: username,
        email: drift.Value(email),
        joinedDate: DateTime.now(),
        settings: '{"darkMode":false,"language":"de",'
            '"soundEffects":true,"hapticFeedback":true,'
            '"dailyReminder":true,"reminderTime":"09:00"}',
        learningPrefs: '{"dailyGoal":20,"currentLevel":"A1",'
            '"nativeLanguage":"uk","autoPlayAudio":true}',
      ),
    );

    await db.into(db.userProfiles).insertOnConflictUpdate(
      UserProfilesCompanion.insert(
        id: 'local_user',
        userId: 'local_user',
        name: username,
        email: drift.Value(email),
        joinedDate: DateTime.now(),
        settings: '{"darkMode":false,"language":"de",'
            '"soundEffects":true,"hapticFeedback":true,'
            '"dailyReminder":true,"reminderTime":"09:00"}',
        learningPrefs: '{"dailyGoal":20,"currentLevel":"A1",'
            '"nativeLanguage":"uk","autoPlayAudio":true}',
      ),
    );

    debugPrint('✅ Профіль збережено: $username (uid=$uid + local_user)');
  }

  Future<void> _handleLogin() async {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      setState(() {
        _errorText = 'Bitte Benutzername und Passwort eingeben.';
      });
      return;
    }

    final email = '$username@deukarten.de';

    setState(() {
      _isLoading = true;
      _errorText = null;
    });

    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (!mounted) return;

      if (credential.user != null) {
        await _ensureUserProfile(credential.user!);
      }

      if (!mounted) return;

      // ✅ refresh ЗАМІСТЬ invalidate — перечитує одразу
      await ref.read(userProfileProvider.notifier).reload();

      debugPrint('🔄 userProfileProvider refreshed, username=$username');

      context.go('/home');
    } on FirebaseAuthException catch (e) {
      setState(() => _errorText = _mapFirebaseError(e.code));
    } catch (e) {
      setState(
              () => _errorText = 'Ein unbekannter Fehler ist aufgetreten: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _handleRegister() async {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      setState(() {
        _errorText = 'Bitte Benutzername und Passwort eingeben.';
      });
      return;
    }

    if (password.length < 6) {
      setState(() {
        _errorText = 'Das Passwort muss mindestens 6 Zeichen lang sein.';
      });
      return;
    }

    final email = '$username@deukarten.de';

    setState(() {
      _isLoading = true;
      _errorText = null;
    });

    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await credential.user?.updateDisplayName(username);

      if (credential.user != null) {
        await _ensureUserProfile(credential.user!);
      }

      if (!mounted) return;

      // ✅ refresh ЗАМІСТЬ invalidate — перечитує одразу
      await ref.read(userProfileProvider.notifier).reload();

      debugPrint('🔄 userProfileProvider refreshed, username=$username');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Willkommen, $username! 🎉'),
          backgroundColor: Colors.green,
        ),
      );

      context.go('/home');
    } on FirebaseAuthException catch (e) {
      setState(() => _errorText = _mapFirebaseError(e.code));
    } catch (e) {
      setState(() => _errorText = 'Fehler: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _handleResetPassword() async {
    final username = _usernameController.text.trim();

    if (username.isEmpty) {
      setState(() {
        _errorText = 'Bitte gib zuerst deinen Benutzernamen ein.';
      });
      return;
    }

    final email = '$username@deukarten.de';

    setState(() {
      _isLoading = true;
      _errorText = null;
    });

    try {
      await _auth.sendPasswordResetEmail(email: email);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('E-Mail an $email gesendet.'),
        ),
      );
    } on FirebaseAuthException catch (e) {
      setState(() => _errorText = _mapFirebaseError(e.code));
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  String _mapFirebaseError(String code) {
    switch (code) {
      case 'invalid-email':
        return 'Die E-Mail-Adresse ist ungültig.';
      case 'user-disabled':
        return 'Dieses Konto wurde deaktiviert.';
      case 'user-not-found':
        return 'Kein Konto mit diesem Benutzernamen gefunden.';
      case 'wrong-password':
        return 'Das Passwort ist falsch.';
      case 'invalid-credential':
        return 'Benutzername oder Passwort ist falsch.';
      case 'email-already-in-use':
        return 'Dieser Benutzername ist bereits vergeben.';
      case 'weak-password':
        return 'Das Passwort ist zu schwach (min. 6 Zeichen).';
      case 'too-many-requests':
        return 'Zu viele Versuche. Bitte später erneut versuchen.';
      case 'network-request-failed':
        return 'Netzwerkfehler. Prüfe deine Internetverbindung.';
      default:
        return 'Fehler: $code';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: _showLoginForm ? _buildLoginForm() : _buildWelcome(),
        ),
      ),
    );
  }

  Widget _buildWelcome() {
    return Padding(
      key: const ValueKey('welcome_view'),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        children: [
          const Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              'assets/images/logo.png',
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Willkommen bei DeuKarten',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Lerne Deutsch mit Karten, Übungen und thematischen '
                'Wortschätzen aus Schritte Neu.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              height: 1.4,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Melde dich an, um fertige Decks aus der Cloud zu laden, '
                'oder starte sofort als Gast.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              height: 1.4,
              color: Colors.black54,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _isLoading ? null : _openLoginForm,
              child: const Text('Anmelden'),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: _isLoading ? null : _continueOhneAnmeldung,
              child: const Text('Ohne Anmeldung fortfahren'),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Du kannst dich später jederzeit anmelden.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.black45),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildLoginForm() {
    return SingleChildScrollView(
      key: const ValueKey('login_view'),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height - 32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: _isLoading ? null : _backToWelcome,
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Anmelden oder registrieren',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _usernameController,
              enabled: !_isLoading,
              textInputAction: TextInputAction.next,
              autocorrect: false,
              decoration: const InputDecoration(
                labelText: 'Benutzername',
                prefixIcon: Icon(Icons.person_outline),
                border: OutlineInputBorder(),
                hintText: 'z.B. peter',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              enabled: false,
              decoration: InputDecoration(
                labelText: 'E-Mail',
                prefixIcon: const Icon(Icons.email_outlined),
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey.shade100,
                hintText: 'Wird automatisch ausgefüllt',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              enabled: !_isLoading,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _handleLogin(),
              decoration: InputDecoration(
                labelText: 'Passwort',
                prefixIcon: const Icon(Icons.lock_outline),
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() => _obscurePassword = !_obscurePassword);
                  },
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: _isLoading ? null : _handleResetPassword,
                child: const Text(
                  'Passwort vergessen?',
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ),
            if (_errorText != null) ...[
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.red.shade200),
                ),
                child: Row(
                  children: [
                    Icon(Icons.error_outline,
                        color: Colors.red.shade700, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        _errorText!,
                        style: TextStyle(
                          color: Colors.red.shade700,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _isLoading ? null : _handleLogin,
              child: _isLoading
                  ? const SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
                  : const Text('Login'),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: _isLoading ? null : _handleRegister,
              child: const Text('Registrieren'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: _isLoading ? null : _continueAsGuest,
              child: const Text('Als Gast fortfahren'),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}