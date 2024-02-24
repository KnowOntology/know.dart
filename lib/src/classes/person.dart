// This is free and unencumbered software released into the public domain.

import '../prelude.dart';
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
  List<Person> get siblings;
  Person? get spouse;
  List<Person> get spouses;
  Person? get partner;
  List<Person> get partners;
  List<Person> get children;
  List<Person> get colleagues;
  List<Person> get knows;
  Email? get email;
  List<Email> get emails;
  Phone? get phone;
  List<Phone> get phones;

  Person._();

  factory Person() = _Person;

  factory Person.fromJson(final Map<String, dynamic> json) = _Person.fromJson;

  @override
  Map<String, dynamic> toJson() {
    final result = super.toJson();
    result.addAll({
      //"nickname": nickname,
      "nicknames": nicknames,
      //"age": age,
      //"birthdate": birthdate,
      "birth": birth,
      "death": death,
      //"parents": parents,
      "father": father,
      "mother": mother,
      "siblings": siblings,
      "spouses": spouses,
      "partners": partners,
      "children": children,
      "colleagues": colleagues,
      "knows": knows,
      // "email": email,
      "emails": emails,
      // "phone": phone,
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
  Date? get birthdate => birth?.date;

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
  List<Person> siblings;

  @override
  Person? get spouse => spouses.firstOrNull;

  @override
  List<Person> spouses;

  @override
  Person? get partner => partners.firstOrNull;

  @override
  List<Person> partners;

  @override
  List<Person> children;

  @override
  List<Person> colleagues;

  @override
  List<Person> knows;

  @override
  Email? get email => emails.firstOrNull;

  @override
  List<Email> emails;

  @override
  Phone? get phone => phones.firstOrNull;

  @override
  List<Phone> phones;

  _Person._({
    this.id,
    this.name,
    this.nicknames = const [],
    //this.age,
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

  factory _Person() => _Person._();

  factory _Person.fromJson(final Map<String, dynamic> json) {
    return _Person._(
      id: json["id"],
      name: json["name"],
      nicknames: json["nicknames"],
      birth: json["birth"],
      death: json["death"],
      father: json["father"],
      mother: json["mother"],
      siblings: json["siblings"],
      spouses: json["spouses"],
      partners: json["partners"],
      children: json["children"],
      colleagues: json["colleagues"],
      knows: json["knows"],
      emails: json["emails"],
      phones: json["phones"],
    );
  }
}
