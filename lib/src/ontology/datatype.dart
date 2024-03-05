// This is free and unencumbered software released into the public domain.

import '../prelude.dart';
import '../language.dart' show L, LanguageTag;

// A datatype in the ontology.
//
// See: https://www.w3.org/TR/rdf12-concepts/#section-Datatypes
// See: https://www.w3.org/TR/rdf12-schema/#ch_datatype
enum Datatype {
  /// A country code (ISO 3166-1 alpha-2).
  ///
  /// See: https://know.dev/country
  country(
    id: #country,
    label: {
      L.ar: null,
      L.de: null,
      L.en: "Country",
      L.eo: null,
      L.es: null,
      L.fi: "Maa",
      L.pt: null,
      L.sv: null,
      L.tr: null,
      L.uk: null,
    },
    comment: {},
    pattern: null, // TODO
    sameAs: {
      (#gs1, #countryCode),
    },
    seeAlso: {
      'https://www.wikidata.org/wiki/Property:P300',
    },
  ),

  /// A date & time denoting an instant of time.
  ///
  /// See: https://know.dev/dateTime
  dateTime(
    id: #dateTime,
    label: {
      L.ar: null,
      L.de: null,
      L.en: "Date & Time",
      L.eo: null,
      L.es: null,
      L.fi: null,
      L.pt: null,
      L.sv: null,
      L.tr: null,
      L.uk: null,
    },
    comment: {},
    pattern:
        // See: https://www.w3.org/TR/xmlschema11-2/#nt-dateTimeRep
        r"-?([1-9][0-9]{3,}|0[0-9]{3})-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])T(([01][0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9](\.[0-9]+)?|(24:00:00(\.0+)?))(Z|(\+|-)((0[0-9]|1[0-3]):[0-5][0-9]|14:00))?",
    sameAs: {
      (#xsd, #dateTime),
      (#schema, #DateTime),
    },
    seeAlso: {},
  ),

  /// An email address.
  ///
  /// See: https://know.dev/email
  email(
    id: #email,
    label: {
      L.ar: null,
      L.de: null,
      L.en: "Email",
      L.eo: null,
      L.es: null,
      L.fi: null,
      L.pt: null,
      L.sv: null,
      L.tr: null,
      L.uk: null,
    },
    comment: {},
    pattern:
        // See: https://html.spec.whatwg.org/multipage/input.html#email-state-(type=email)
        r"^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$",
    sameAs: {},
    seeAlso: {},
  ),

  /// An Internationalized Resource Identifier (IRI).
  ///
  /// See: https://know.dev/iri
  iri(
    id: #iri,
    label: {
      L.ar: null,
      L.de: null,
      L.en: "IRI",
      L.eo: null,
      L.es: null,
      L.fi: null,
      L.pt: null,
      L.sv: null,
      L.tr: null,
      L.uk: null,
    },
    comment: {},
    pattern:
        // See: https://datatracker.ietf.org/doc/html/rfc3986#appendix-B
        r"^(([^:/?#]+):)?(//([^/?#]*))?([^?#]*)(\?([^#]*))?(#(.*))?",
    sameAs: {
      (#xsd, #anyURI),
    },
    seeAlso: {},
  ),

  /// A language tag (IETF BCP 47).
  ///
  /// See: https://know.dev/language
  language(
    id: #language,
    label: {
      L.ar: null,
      L.de: null,
      L.en: "Language",
      L.eo: null,
      L.es: null,
      L.fi: null,
      L.pt: null,
      L.sv: null,
      L.tr: null,
      L.uk: null,
    },
    comment: {},
    pattern: null, // TODO
    sameAs: {},
    seeAlso: {
      'https://www.wikidata.org/wiki/Property:P305',
    },
  ),

  /// A non-negative integer.
  ///
  /// See: https://know.dev/nonNegativeInteger
  nonNegativeInteger(
    id: #nonNegativeInteger,
    label: {
      L.ar: null,
      L.de: null,
      L.en: "Non-Negative Integer",
      L.eo: null,
      L.es: null,
      L.fi: null,
      L.pt: null,
      L.sv: null,
      L.tr: null,
      L.uk: null,
    },
    comment: {},
    pattern: r'^\d+$',
    sameAs: {
      (#xsd, #nonNegativeInteger),
    },
    seeAlso: {},
  ),

  /// An SS7 international phone number.
  ///
  /// See: https://know.dev/phone
  phone(
    id: #phone,
    label: {
      L.ar: null,
      L.de: null,
      L.en: "Phone",
      L.eo: null,
      L.es: null,
      L.fi: null,
      L.pt: null,
      L.sv: null,
      L.tr: null,
      L.uk: null,
    },
    comment: {},
    pattern:
        // See: https://ihateregex.io/expr/phone/
        r"^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$",
    sameAs: {},
    seeAlso: {},
  ),

  /// A biological sex for sexually dimorphic species.
  ///
  /// See: https://know.dev/sex
  sex(
    id: #sex,
    label: {
      L.ar: null,
      L.de: null,
      L.en: "Sex",
      L.eo: null,
      L.es: null,
      L.fi: null,
      L.pt: null,
      L.sv: null,
      L.tr: null,
      L.uk: null,
    },
    comment: {},
    pattern: 'male|female',
    sameAs: {},
    seeAlso: {},
  ),

  /// A freeform text string.
  ///
  /// See: https://know.dev/text
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
  final String? pattern;
  final Set<(Symbol, Symbol)> sameAs;
  final Set<String> seeAlso;

  const Datatype(
      {required this.id,
      this.label = const {},
      this.comment = const {},
      this.pattern,
      this.sameAs = const {},
      this.seeAlso = const {}});

  factory Datatype.fromSymbol(final Symbol id) {
    for (final datatype in Datatype.values) {
      if (datatype.id == id) {
        return datatype;
      }
    }
    throw ArgumentError.value(id, "id", "Unknown datatype");
  }

  factory Datatype.fromString(final String id) =>
      Datatype.fromSymbol(Symbol(id));

  factory Datatype.fromJson(final String id) = Datatype.fromString;

  String toJson() => id.asString();

  String labelForLangCode(final String langCode) =>
      labelForLangTag(LanguageTag.fromString(langCode));

  String labelForLangTag(final LanguageTag langTag) =>
      label[langTag] ?? label[L.en] ?? id.asString();
}
