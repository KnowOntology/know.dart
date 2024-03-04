// This is free and unencumbered software released into the public domain.

import '../../language.dart' show L;
import '../property.dart' show Property;
import 'thing.dart' show ThingClass;

abstract final class EventClass {
  static final id = ThingClass.id;
  static final name = ThingClass.name;

  static final Property end = Property(
    id: #end,
    label: {
      L.ar: null,
      L.de: null,
      L.en: "End Date",
      L.eo: null,
      L.es: null,
      L.fi: null,
      L.pt: null,
      L.sv: null,
      L.tr: null,
      L.uk: null,
    },
    comment: {},
    domain: #Event,
    range: {},
    subPropertyOf: {},
    inverseOf: {},
    sameAs: {},
    seeAlso: {},
  );

  static final Property place = Property(
    id: #place,
    label: {
      L.ar: null,
      L.de: null,
      L.en: "Place",
      L.eo: null,
      L.es: null,
      L.fi: null,
      L.pt: null,
      L.sv: null,
      L.tr: null,
      L.uk: null,
    },
    comment: {},
    domain: #Event,
    range: {},
    subPropertyOf: {},
    inverseOf: {},
    sameAs: {},
    seeAlso: {},
  );

  static final Property start = Property(
    id: #start,
    label: {
      L.ar: null,
      L.de: null,
      L.en: "Start Date",
      L.eo: null,
      L.es: null,
      L.fi: null,
      L.pt: null,
      L.sv: null,
      L.tr: null,
      L.uk: null,
    },
    comment: {},
    domain: #Event,
    range: {},
    subPropertyOf: {},
    inverseOf: {},
    sameAs: {},
    seeAlso: {},
  );

  static Set<Property> properties() => Set.unmodifiable({
        start,
        end,
        place,
      });
}
