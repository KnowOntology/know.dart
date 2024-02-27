// This is free and unencumbered software released into the public domain.

import '../prelude.dart';
import '../language.dart' show LanguageTag;
import '../relation.dart' show Relation;
import 'event.dart' show Event;
import 'thing.dart' show Thing;

sealed class Person extends Thing {
  String? get honorific;

  Name? get alias;
  Set<Name> get aliases;

  bool? get isMale => sex != null ? sex == Sex.male : null;
  bool? get isFemale => sex != null ? sex == Sex.female : null;
  Sex? get sex;

  bool? get isChild => age != null ? age! < 18 : null;
  bool? get isAdult => age != null ? age! >= 18 : null;
  Age? get age;
  Date? get birthdate;

  Event? get birth;
  Event? get death;

  Set<Person> get parents;
  Person? get father;
  Person? get mother;

  // TODO: #brothers, #sisters as filters of #siblings

  bool get hasSiblings => siblings.isNotEmpty;
  Set<Relation<Person>> get siblings;

  // TODO: #husband, #wife as filters of #spouses

  bool get hasSpouse => spouses.isNotEmpty;
  Person? get spouse;
  Set<Relation<Person>> get spouses;

  bool get hasPartner => partners.isNotEmpty;
  Person? get partner;
  Set<Relation<Person>> get partners;

  // TODO: #sons, #daughters as filters of #children

  bool get hasChildren => children.isNotEmpty;
  Set<Relation<Person>> get children;

  bool get hasColleagues => colleagues.isNotEmpty;
  Set<Relation<Person>> get colleagues;

  Set<Relation<Person>> get knows;

  bool? get speaksEnglish =>
      speaks.isNotEmpty ? speaks.contains(LanguageTag.en) : null;
  Set<LanguageTag> get speaks;

  CountryCode? get nationality;
  Set<CountryCode> get nationalities;

  Email? get email;
  Set<Email> get emails;

  Phone? get phone;
  Set<Phone> get phones;

  IRI? get link;
  Set<IRI> get links;

  Set<String> get notes;

  Person._() : super.init();

  factory Person({
    String? id,
    Name? name,
    String? honorific,
    Set<Name> aliases,
    Sex? sex,
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
    Set<LanguageTag> speaks,
    Set<CountryCode> nationalities,
    Set<Email> emails,
    Set<Phone> phones,
    Set<IRI> links,
    Set<String> notes,
  }) = _Person.of;

  factory Person.fromJson(final Map<String, dynamic> json) = _Person.fromJson;

  @override
  int get hashCode {
    return Object.hash(
        super.hashCode,
        honorific,
        aliases,
        sex,
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
        speaks,
        nationalities,
        emails,
        phones,
        links,
        notes);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Person) return false;
    return super == other &&
        honorific == other.honorific &&
        aliases == other.aliases &&
        sex == other.sex &&
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
        speaks == other.speaks &&
        nationalities == other.nationalities &&
        emails == other.emails &&
        phones == other.phones &&
        links == other.links &&
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
      "honorific": honorific,
      "aliases": aliases,
      "sex": sex,
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
      "speaks": speaks,
      "nationalities": nationalities,
      "emails": emails,
      "phones": phones,
      "links": links,
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
  String? honorific;

  @override
  Name? get alias => aliases.firstOrNull;

  @override
  Set<Name> aliases;

  @override
  Sex? sex;

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
  Set<LanguageTag> speaks;

  @override
  CountryCode? get nationality => nationalities.firstOrNull;

  @override
  Set<CountryCode> nationalities;

  @override
  Email? get email => emails.firstOrNull;

  @override
  Set<Email> emails;

  @override
  Phone? get phone => phones.firstOrNull;

  @override
  Set<Phone> phones;

  @override
  IRI? get link => links.firstOrNull;

  @override
  Set<IRI> links;

  @override
  Set<String> notes;

  _Person.of(
      {this.id,
      this.name,
      this.honorific,
      this.aliases = const {},
      this.sex,
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
      this.speaks = const {},
      this.nationalities = const {},
      this.emails = const {},
      this.phones = const {},
      this.links = const {},
      this.notes = const {}})
      : super._();

  factory _Person() => _Person.of();

  factory _Person.fromJson(final Map<String, dynamic> json) {
    return Function.apply(
        _Person.of, [], json.map((k, v) => MapEntry(Symbol(k), v)));
  }
}
