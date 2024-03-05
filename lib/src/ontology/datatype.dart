// This is free and unencumbered software released into the public domain.

import '../prelude.dart';
import '../language.dart' show L, LanguageTag;

// A datatype in the ontology.
//
// See: https://www.w3.org/TR/rdf12-concepts/#section-Datatypes
// See: https://www.w3.org/TR/rdf12-schema/#ch_datatype
enum Datatype {
  /// A text string.
  text(
    id: #text,
    label: {
      L.ar: null,
      L.de: null,
      L.en: "Text",
      L.eo: "Teksto",
      L.es: null,
      L.fi: "Teksti",
      L.pt: null,
      L.sv: null,
      L.tr: null,
      L.uk: null,
    },
    comment: {},
    pattern: null,
    sameAs: {
      (#xsd, #string),
      (#schema, #Text),
    },
    seeAlso: {},
  );

  final Symbol id;
  final Map<LanguageTag, String?> label;
  final Map<LanguageTag, String?> comment;
  final RegExp? pattern;
  final Set<(Symbol, Symbol)> sameAs;
  final Set<String> seeAlso;

  const Datatype(
      {required this.id,
      this.label = const {},
      this.comment = const {},
      this.pattern,
      this.sameAs = const {},
      this.seeAlso = const {}});

  factory Datatype.fromString(final String id) {
    final id_ = Symbol(id);
    for (final datatype in Datatype.values) {
      if (datatype.id == id_) {
        return datatype;
      }
    }
    throw ArgumentError.value(id, "id", "Unknown datatype");
  }

  factory Datatype.fromJson(final String id) = Datatype.fromString;

  String toJson() => id.asString();
}
