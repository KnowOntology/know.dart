// This is free and unencumbered software released into the public domain.

//import '../../language.dart' show L;
import '../property.dart' show Property;
import 'thing.dart' show ThingClass;

/// Property metadata for [Group].
abstract final class GroupClass {
  static final id = ThingClass.id;
  static final name = ThingClass.name;

  // TODO

  static Set<Property> properties() => Set.unmodifiable({});
}
