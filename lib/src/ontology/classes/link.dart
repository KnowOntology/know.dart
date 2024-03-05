// This is free and unencumbered software released into the public domain.

import '../../language.dart' show L;
import '../property.dart' show Property;
import 'thing.dart' show ThingClass;

abstract final class LinkClass {
  static final id = ThingClass.id;
  static final name = ThingClass.name;

  static final Property url = Property(
    domain: #Link,
    id: #url,
    label: {
      L.ar: "محدد موقع الموارد الموحد",
      L.de: "URL",
      L.en: "URL",
      L.eo: "URL",
      L.es: "LRU",
      L.fi: "URL",
      L.pt: "URL",
      L.sv: "URL",
      L.tr: "URL",
      L.uk: "URL-адреси",
    },
    comment: {},
    range: #iri,
    subPropertyOf: {},
    inverseOf: {},
    sameAs: {},
    seeAlso: {},
  );

  static Set<Property> properties() => Set.unmodifiable({
        url,
      });
}
