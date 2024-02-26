// This is free and unencumbered software released into the public domain.

import '../prelude.dart';
import '../relation.dart' show Relation;
import 'event.dart' show Event;
import 'thing.dart' show Thing;

sealed class Person extends Thing {
  Name? get nickname;
  Set<Name> get nicknames;
  Age? get age;
  Date? get birthdate;
  Event? get birth;
  Event? get death;
  Set<Person> get parents;
  Person? get father;
  Person? get mother;
  Set<Relation<Person>> get siblings;
  Person? get spouse;
  Set<Relation<Person>> get spouses;
  Person? get partner;
  Set<Relation<Person>> get partners;
  Set<Relation<Person>> get children;
  Set<Relation<Person>> get colleagues;
  Set<Relation<Person>> get knows;
  Email? get email;
  Set<Email> get emails;
  Phone? get phone;
  Set<Phone> get phones;
  Set<String> get notes;

  Person._() : super.init();

  factory Person({
    String? id,
    Name? name,
    Set<Name> nicknames,
    Event? birth,
    Event? death,
    Person? father,
    Person? mother,
    Set<Relation<Person>> siblings,
    Set<Relation<Person>> spouses,
    Set<Relation<Person>> partners,
    Set<Relation<Person>> children,
    Set<Relation<Person>> colleagues,
    Set<Relation<Person>> knows,
    Set<Email> emails,
    Set<Phone> phones,
    Set<String> notes,
  }) = _Person.of;

  factory Person.fromJson(final Map<String, dynamic> json) = _Person.fromJson;

  @override
  int get hashCode {
    return Object.hash(
        super.hashCode,
        nicknames,
        birth,
        death,
        father,
        mother,
        siblings,
        spouses,
        partners,
        children,
        colleagues,
        knows,
        emails,
        phones,
        notes);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Person) return false;
    return super == other &&
        nicknames == other.nicknames &&
        birth == other.birth &&
        death == other.death &&
        father == other.father &&
        mother == other.mother &&
        siblings == other.siblings &&
        spouses == other.spouses &&
        partners == other.partners &&
        children == other.children &&
        colleagues == other.colleagues &&
        knows == other.knows &&
        emails == other.emails &&
        phones == other.phones &&
        notes == other.notes;
  }

  @override
  String toString() {
    final json = toJson().toString();
    final inner = json.substring(1, json.length - 1);
    return "Person($inner)";
  }

  @override
  Map<String, dynamic> toJson() {
    final result = super.toJson();
    result.addAll({
      "nicknames": nicknames,
      "birth": birth,
      "death": death,
      "father": father,
      "mother": mother,
      "siblings": siblings,
      "spouses": spouses,
      "partners": partners,
      "children": children,
      "colleagues": colleagues,
      "knows": knows,
      "emails": emails,
      "phones": phones,
      "notes": notes,
    });
    return result;
  }
}

final class _Person extends Person {
  @override
  String? id;

  @override
  Name? name;

  @override
  Name? get nickname => nicknames.firstOrNull;

  @override
  Set<Name> nicknames;

  @override
  Age? get age => null; // TODO: calculate from this.birthdate

  @override
  Date? get birthdate => birth?.start;

  @override
  Event? birth;

  @override
  Event? death;

  @override
  Set<Person> get parents => {father, mother}.whereType<Person>().toSet();

  @override
  Person? father;

  @override
  Person? mother;

  @override
  Set<Relation<Person>> siblings;

  @override
  Person? get spouse => spouses.firstOrNull?.object;

  @override
  Set<Relation<Person>> spouses;

  @override
  Person? get partner => partners.firstOrNull?.object;

  @override
  Set<Relation<Person>> partners;

  @override
  Set<Relation<Person>> children;

  @override
  Set<Relation<Person>> colleagues;

  @override
  Set<Relation<Person>> knows;

  @override
  Email? get email => emails.firstOrNull;

  @override
  Set<Email> emails;

  @override
  Phone? get phone => phones.firstOrNull;

  @override
  Set<Phone> phones;

  @override
  Set<String> notes;

  _Person.of({
    this.id,
    this.name,
    this.nicknames = const {},
    this.birth,
    this.death,
    this.father,
    this.mother,
    this.siblings = const {},
    this.spouses = const {},
    this.partners = const {},
    this.children = const {},
    this.colleagues = const {},
    this.knows = const {},
    this.emails = const {},
    this.phones = const {},
    this.notes = const {}
  }) : super._();

  factory _Person() => _Person.of();

  factory _Person.fromJson(final Map<String, dynamic> json) {
    return Function.apply(
        _Person.of, [], json.map((k, v) => MapEntry(Symbol(k), v)));
  }
}
