/// This is free and unencumbered software released into the public domain.

import '../../language.dart' show L;
import '../property.dart' show Property;

abstract final class ThingClass {
  static final Property id = Property(
    domain: #Thing,
    id: #id,
    label: {
      L.ar: "معرف",
      L.de: "Identifikator",
      L.en: "Identifier",
      L.eo: "Identilo",
      L.es: "Identificador",
      L.fi: "Tunniste",
      L.pt: "Identificador",
      L.sv: "Identifierare",
      L.tr: "Kimlik",
      L.uk: "Ідентифікатор",
    },
    comment: {},
    syntax: null,
    range: {#Literal},
    subPropertyOf: {},
    inverseOf: {},
    sameAs: {
      "dc:identifier",
    },
    seeAlso: {
      "https://en.wiktionary.org/wiki/identifier",
      "https://en.wikipedia.org/wiki/Identifier",
    },
  );

  static final Property name = Property(
    domain: #Thing,
    id: #name,
    label: {
      L.ar: "اسم",
      L.de: "Name",
      L.en: "Name",
      L.eo: "Nomo",
      L.es: "Nombre",
      L.fi: "Nimi",
      L.pt: "Nome",
      L.sv: "Namn",
      L.tr: "Ad",
      L.uk: "Назва",
    },
    comment: {},
    syntax: null,
    range: {#Literal},
    subPropertyOf: {},
    inverseOf: {},
    sameAs: {
      "foaf:name",
      "schema:name",
    },
    seeAlso: {
      "https://en.wiktionary.org/wiki/name",
      "https://en.wikipedia.org/wiki/Name",
    },
  );

  static Set<Property> properties() => Set.unmodifiable({
        id,
        name,
      });
}
