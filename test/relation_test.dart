// This is free and unencumbered software released into the public domain.

import 'package:collection/collection.dart';
import 'package:knf/knf.dart';
import 'package:know/know.dart';
import 'package:test/test.dart';

void main() {
  group('Relation', () {
    final key1 = Term.allusion("key1");
    final key2 = Term.allusion("key2");
    test('can be constructed', () {
      final relation = Relation(#knows, Person(), Person());
      expect(relation, isA<Relation<Person, Person>>());
    });
    test('is equal when identical (incomplete)', () {
      final relation = Relation(#knows);
      expect(relation, equals(relation));
    });
    test('is equal when identical (complete)', () {
      final relation = Relation(#knows, Person(), Person());
      expect(relation, equals(relation));
    });
    test('is equal when equivalent (incomplete)', () {
      final relation1 = Relation(#knows);
      final relation2 = Relation(#knows);
      expect(relation1, equals(relation2));
    });
    test('is not equal when not equivalent (incomplete)', () {
      final relation1 = Relation(#knows1);
      final relation2 = Relation(#knows2);
      expect(relation1, isNot(equals(relation2)));
    });
    test('is equal when equivalent (complete)', () {
      final relation1 = Relation(#knows, Person(key: key1, id: '1'), Person(key: key2, id: '2'));
      final relation2 = Relation(#knows, Person(key: key1, id: '1'), Person(key: key2, id: '2'));
      expect(relation1, equals(relation2));
    });
    test('is not equal when not equivalent (complete)', () {
      final relation1 = Relation(#knows, Person(id: '1'), Person(id: '2'));
      final relation2 =
          Relation(#knows, Person(id: '1'), Person(id: '3')); // NB
      expect(relation1, isNot(equals(relation2)));
    });
  });

  group('Set<Relation>', () {
    test('is equal using the built-in equals matcher', () {
      final Set<PersonRelation> set1 = {PersonRelation(#knows)};
      final Set<PersonRelation> set2 = {PersonRelation(#knows)};
      expect(set1, equals(set2));
    });
    test('is equal using the SetEquality implementation', () {
      final Set<PersonRelation> set1 = {PersonRelation(#knows)};
      final Set<PersonRelation> set2 = {PersonRelation(#knows)};
      final setEquality = const SetEquality(DefaultEquality<PersonRelation>());
      expect(setEquality.equals(set1, set2), isTrue);
    });
  });
}
