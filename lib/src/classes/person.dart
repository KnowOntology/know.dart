// This is free and unencumbered software released into the public domain.

import '../prelude.dart';
import '../relation.dart' show Relation;
import 'event.dart' show Event;
import 'thing.dart' show Thing;

sealed class Person extends Thing {
  Name? get nickname;
  List<Name> get nicknames;
  Age? get age;
  Date? get birthdate;
  Event? get birth;
  Event? get death;
  List<Person> get parents;
  Person? get father;
  Person? get mother;
  List<Relation<Person>> get siblings;
  Person? get spouse;
  List<Relation<Person>> get spouses;
  Person? get partner;
  List<Relation<Person>> get partners;
  List<Relation<Person>> get children;
  List<Relation<Person>> get colleagues;
  List<Relation<Person>> get knows;
  Email? get email;
  List<Email> get emails;
  Phone? get phone;
  List<Phone> get phones;

  Person._() : super.init();

  factory Person({
    String? id,
    Name? name,
    List<Name> nicknames,
    Event? birth,
    Event? death,
    Person? father,
    Person? mother,
    List<Relation<Person>> siblings,
    List<Relation<Person>> spouses,
    List<Relation<Person>> partners,
    List<Relation<Person>> children,
    List<Relation<Person>> colleagues,
    List<Relation<Person>> knows,
    List<Email> emails,
    List<Phone> phones,
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
        phones);
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
        phones == other.phones;
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
  List<Name> nicknames;

  @override
  Age? get age => null; // TODO: calculate from this.birthdate

  @override
  Date? get birthdate => birth?.start;

  @override
  Event? birth;

  @override
  Event? death;

  @override
  List<Person> get parents => [father, mother].whereType<Person>().toList();

  @override
  Person? father;

  @override
  Person? mother;

  @override
  List<Relation<Person>> siblings;

  @override
  Person? get spouse => spouses.firstOrNull?.object;

  @override
  List<Relation<Person>> spouses;

  @override
  Person? get partner => partners.firstOrNull?.object;

  @override
  List<Relation<Person>> partners;

  @override
  List<Relation<Person>> children;

  @override
  List<Relation<Person>> colleagues;

  @override
  List<Relation<Person>> knows;

  @override
  Email? get email => emails.firstOrNull;

  @override
  List<Email> emails;

  @override
  Phone? get phone => phones.firstOrNull;

  @override
  List<Phone> phones;

  _Person.of({
    this.id,
    this.name,
    this.nicknames = const [],
    this.birth,
    this.death,
    this.father,
    this.mother,
    this.siblings = const [],
    this.spouses = const [],
    this.partners = const [],
    this.children = const [],
    this.colleagues = const [],
    this.knows = const [],
    this.emails = const [],
    this.phones = const [],
  }) : super._();

  factory _Person() => _Person.of();

  factory _Person.fromJson(final Map<String, dynamic> json) {
    return Function.apply(
        _Person.of, [], json.map((k, v) => MapEntry(Symbol(k), v)));
  }
}
