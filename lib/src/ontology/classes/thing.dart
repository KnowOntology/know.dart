/// This is free and unencumbered software released into the public domain.

import '../../language.dart' show L;
import '../property.dart' show Property;

abstract final class ThingClass {
  static final Property id = Property(
    id: #id,
    label: {
      L.ar: null,
      L.de: null,
      L.en: "Identifier",
      L.eo: null,
      L.es: null,
      L.fi: "Tunniste",
      L.pt: null,
      L.sv: null,
      L.tr: null,
      L.uk: "Ідентифікатор",
    },
    comment: {},
    domain: #Thing,
    range: {},
    subPropertyOf: {},
    inverseOf: {},
    sameAs: {},
    seeAlso: {
      "https://en.wiktionary.org/wiki/identifier",
      "https://en.wikipedia.org/wiki/Identifier",
    },
  );

  static final Property name = Property(
    id: #name,
    label: {
      L.ar: null,
      L.de: null,
      L.en: "Name",
      L.eo: null,
      L.es: null,
      L.fi: "Nimi",
      L.pt: null,
      L.sv: null,
      L.tr: null,
      L.uk: "Назва",
    },
    comment: {},
    domain: #Thing,
    range: {},
    subPropertyOf: {},
    inverseOf: {},
    sameAs: {},
    seeAlso: {
      "https://en.wiktionary.org/wiki/name",
      "https://en.wikipedia.org/wiki/Name",
    },
  );

  static Set<Property> properties() {
    return Set.unmodifiable({
      id,
      name,
    });
  }
}
