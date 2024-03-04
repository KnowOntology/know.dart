// This is free and unencumbered software released into the public domain.

import '../prelude.dart';
import '../inspect.dart' show inspect;
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

  @override
  int get hashCode => Object.hash(domain, id);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Property) return false;
    return domain == other.domain && id == other.id;
  }

  @override
  String toString() => inspect("Property", toJson());

  Map<String, dynamic> toJson() => {
        'id': id.asString(),
        'label': label.map((k, v) => MapEntry(k.toJson(), v)),
        'comment': comment.map((k, v) => MapEntry(k.toJson(), v)),
        'domain': domain.asString(),
        'range': range.map((e) => e.asString()).toList(),
        'subPropertyOf': subPropertyOf.map((e) => e.asString()).toList(),
        'inverseOf': inverseOf.map((e) => e.asString()).toList(),
        'sameAs': sameAs.toList(),
        'seeAlso': seeAlso.toList(),
      }.compact();
}
