// This is free and unencumbered software released into the public domain.

import '../prelude.dart';
import '../inspect.dart' show inspect;
import '../language.dart' show L, LanguageTag;
import 'datatype.dart' show Datatype;

/// A property in the ontology.
///
/// See: https://www.w3.org/TR/rdf12-concepts/#dfn-property
/// See: https://www.w3.org/TR/rdf12-schema/#ch_property
class Property {
  final Symbol domain;
  final Symbol id;
  final Map<LanguageTag, String?> label;
  final Map<LanguageTag, String?> comment;
  final Symbol? range;
  final Set<Symbol> subPropertyOf;
  final Set<Symbol> inverseOf;
  final Set<(Symbol, Symbol)> sameAs;
  final Set<String> seeAlso;

  const Property(
      {this.domain = #Thing,
      required this.id,
      this.label = const {},
      this.comment = const {},
      this.range,
      this.subPropertyOf = const {},
      this.inverseOf = const {},
      this.sameAs = const {},
      this.seeAlso = const {}});

  Datatype? get datatype => range != null ? Datatype.fromSymbol(range!) : null;

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

  Map<String, dynamic> toJson() => <String, dynamic>{
        'domain': domain.asString(),
        'id': id.asString(),
        'label': label.map((k, v) => MapEntry(k.toJson(), v)),
        'comment': comment.map((k, v) => MapEntry(k.toJson(), v)),
        'range': range?.asString(),
        'subPropertyOf': subPropertyOf.map((e) => e.asString()).toList(),
        'inverseOf': inverseOf.map((e) => e.asString()).toList(),
        'sameAs': sameAs.toList(),
        'seeAlso': seeAlso.toList(),
      }.compact();

  String labelForLangCode(final String langCode) =>
      labelForLangTag(LanguageTag.fromString(langCode));

  String labelForLangTag(final LanguageTag langTag) =>
      label[langTag] ?? label[L.en] ?? id.asString();
}
