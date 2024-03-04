// This is free and unencumbered software released into the public domain.

//import '../../language.dart' show L;
import '../property.dart' show Property;
import 'thing.dart' show ThingClass;

abstract final class PlaceClass {
  static final id = ThingClass.id;
  static final name = ThingClass.name;

  // TODO

  static Set<Property> properties() => Set.unmodifiable({});
}
