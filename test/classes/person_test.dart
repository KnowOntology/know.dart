// This is free and unencumbered software released into the public domain.

import 'package:know/know.dart';
import 'package:test/test.dart';

void main() {
  final person = Person(
    id: "123",
    name: "Person #123",
  );
  final personJson = {
    "id": "123",
    "name": "Person #123",
  };
  group('Person', () {
    test('.fromJson', () {
      expect(Person.fromJson(personJson), isA<Person>());
      expect(Person.fromJson(personJson), equals(person));
    });
    test('#toJson', () {
      //expect(person.toJson(), equals(personJson)); // FIXME
    });
  });
}
