// lib/core/utils/text_utils.dart

/// Нормалізує артикль: DER → Der, DAS → Das, DIE → Die
String normalizeArticle(String? raw) {
  final article = (raw ?? '').trim();
  if (article.isEmpty) return '';
  return article[0].toUpperCase() + article.substring(1).toLowerCase();
}

/// Збирає "артикль + слово" для TTS
String buildGermanTtsText(String? article, String? word) {
  final art = normalizeArticle(article);
  final w = (word ?? '').trim();
  if (art.isEmpty) return w;
  return '$art $w';
}