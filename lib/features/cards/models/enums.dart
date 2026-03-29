enum DifficultyLevel { a1, a2, b1, b2, c1 }

enum CardType { noun, verb, adjective, adverb, pronoun, numeral, preposition, conjunction, phrase, article, sentence }

enum SessionStatus { inProgress, completed, paused }

enum CardStatus { new_card, learning, review, mastered }

/// Парсить будь-який текст з бази в CardType
CardType parseCardType(dynamic raw) {
  final text = '$raw'.toLowerCase().trim();
  if (text.isEmpty) return CardType.noun;

  final prefix = text.length >= 3 ? text.substring(0, 3) : text;

  switch (prefix) {
    case 'ver':
      return CardType.verb;
    case 'adj':
      return CardType.adjective;
    case 'adv':
      return CardType.adverb;
    case 'pro':
      return CardType.pronoun;
    case 'num':
      return CardType.numeral;
    case 'prä':
    case 'pra':
    case 'pre':
      return CardType.preposition;
    case 'kon':
    case 'con':
      return CardType.conjunction;
    case 'phr':
    case 'red':
      return CardType.phrase;
    case 'art':
      return CardType.article;
    case 'sat':
    case 'sen':
      return CardType.sentence;
    case 'nom':
    case 'nou':
    case 'sub':
      return CardType.noun;
    default:
      return CardType.noun;
  }
}
/// Повертає німецьку назву для відображення на картці
String cardTypeToGerman(CardType type) {
  switch (type) {
    case CardType.noun:
      return 'Nomen';
    case CardType.verb:
      return 'Verb';
    case CardType.adjective:
      return 'Adjektiv';
    case CardType.adverb:
      return 'Adverb';
    case CardType.pronoun:
      return 'Pronomen';
    case CardType.numeral:
      return 'Numerale';
    case CardType.preposition:
      return 'Präposition';
    case CardType.conjunction:
      return 'Konjunktion';
    case CardType.phrase:
      return 'Phrase';
    case CardType.article:
      return 'Artikel';
    case CardType.sentence:
      return 'Satz';
  }
}