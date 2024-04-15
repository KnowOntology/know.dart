// This is free and unencumbered software released into the public domain.

import 'package:knf/knf.dart';
import 'package:know/know.dart';
import 'package:test/test.dart';

void main() {
  final thing = Thing(
    key: Term.allusion("thing"),
    id: "123",
    name: "An Event",
  );

  final thingJson = {
    "key": "thing",
    "id": "123",
    "name": "An Event",
  };

  group('Thing', () {
    test('.fromJson', () {
      expect(Thing.fromJson(thingJson), isA<Thing>());
      expect(Thing.fromJson(thingJson), equals(thing));
    });
    test('#toJson', () {
      expect(thing.toJson(), equals(thingJson));
    });
  });
}
