// This is free and unencumbered software released into the public domain.

import '../../language.dart' show L;
import '../property.dart' show Property;
import 'thing.dart' show ThingClass;

abstract final class FileClass {
  static final id = ThingClass.id;
  static final name = ThingClass.name;

  static final Property size = Property(
    domain: #File,
    id: #size,
    label: {
      L.ar: null,
      L.de: null,
      L.en: "Size",
      L.eo: null,
      L.es: null,
      L.fi: "Koko",
      L.pt: null,
      L.sv: null,
      L.tr: null,
      L.uk: null,
    },
    comment: {},
    range: #nonNegativeInteger,
    subPropertyOf: {},
    inverseOf: {},
    sameAs: {},
    seeAlso: {},
  );

  static Set<Property> properties() => Set.unmodifiable({
        size,
      });
}
