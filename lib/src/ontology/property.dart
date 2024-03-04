// This is free and unencumbered software released into the public domain.

import '../language.dart' show LanguageTag;

class Property {
  final Symbol id;
  final Map<LanguageTag, String?> label;
  final Map<LanguageTag, String?> comment;
  final Symbol domain;
  final Set<Symbol> range;
  final Set<Symbol> subPropertyOf;
  final Set<Symbol> inverseOf;
  final Set<String> sameAs;
  final Set<String> seeAlso;

  const Property(
      {required this.id,
      this.label = const {},
      this.comment = const {},
      this.domain = #Thing,
      this.range = const {},
      this.subPropertyOf = const {},
      this.inverseOf = const {},
      this.sameAs = const {},
      this.seeAlso = const {}});
}
