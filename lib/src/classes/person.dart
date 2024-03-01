// This is free and unencumbered software released into the public domain.

import '../prelude.dart';
import '../language.dart' show LanguageTag;
import '../relation.dart' show Relation;
import 'event.dart' show Event;
import 'thing.dart' show Thing;

/// A person.
sealed class Person extends Thing {
  /// The honorific title of this person, if known.
  ///
  /// See: https://en.wikipedia.org/wiki/Honorific
  String? get honorific;

  /// An alias or nickname of this person, if known.
  Name? get alias;

  /// A set of aliases or nicknames of this person, if known.
  ///
  /// ```dart
  /// for (var alias in person.aliases) {
  ///   print("${person.name} aka $alias");
  /// }
  /// ```
  Set<Name> get aliases;

  /// A photograph of this person, if any.
  IRI? get photo;

  /// Whether this person is known to be male.
  bool? get isMale => sex != null ? sex == Sex.male : null;

  /// Whether this person is known to be female.
  bool? get isFemale => sex != null ? sex == Sex.female : null;

  /// The sex of this person, if known.
  Sex? get sex;

  /// Whether this person is known to be a child (under 18 years of age).
  bool? get isChild => age != null ? age! < 18 : null;

  /// Whether this person is known to be an adult (over 18 years of age).
  bool? get isAdult => age != null ? age! >= 18 : null;

  /// The age of this person, if known.
  Age? get age;

  /// The birth date of this person, if known.
  Date? get birthdate;

  /// The birth date/place of this person, if known.
  Event? get birth;

  /// The death date/place of this person, if known.
  Event? get death;

  /// The parents of this person, if known.
  ///
  /// ```dart
  /// for (var parent in person.parents) {
  ///   print(parent);
  /// }
  /// ```
  Set<Person> get parents;

  /// The father of this person, if known.
  Person? get father;

  /// The mother of this person, if known.
  Person? get mother;

  // TODO: #brothers, #sisters as filters of #siblings

  /// Whether this person is known to have any siblings.
  bool get hasSiblings => siblings.isNotEmpty;

  /// The known siblings of this person.
  ///
  /// ```dart
  /// for (var relation in person.siblings) {
  ///   var sibling = relation.object;
  ///   print(sibling);
  /// }
  /// ```
  Set<Relation<Person>> get siblings;

  // TODO: #husband, #wife as filters of #spouses

  /// Whether this person is known to have a spouse.
  bool get hasSpouse => spouses.isNotEmpty;

  /// The current spouse of this person, if known.
  Person? get spouse;

  /// The known current/former spouses of this person.
  ///
  /// ```dart
  /// for (var relation in person.spouses) {
  ///   var spouse = relation.object;
  ///   print(spouse);
  /// }
  /// ```
  Set<Relation<Person>> get spouses;

  /// Whether this person is known to have a partner.
  bool get hasPartner => partners.isNotEmpty;

  /// The current partner of this person, if known.
  Person? get partner;

  /// The known current/former partners of this person.
  ///
  /// ```dart
  /// for (var relation in person.partners) {
  ///   var partner = relation.object;
  ///   print(partner);
  /// }
  /// ```
  Set<Relation<Person>> get partners;

  // TODO: #sons, #daughters as filters of #children

  /// Whether this person is known to have children.
  bool get hasChildren => children.isNotEmpty;

  /// The known children of this person.
  ///
  /// ```dart
  /// for (var relation in person.children) {
  ///   var child = relation.object;
  ///   print(child);
  /// }
  /// ```
  Set<Relation<Person>> get children;

  /// Whether this person is known to have colleagues.
  bool get hasColleagues => colleagues.isNotEmpty;

  /// The people known to work with this person.
  ///
  /// ```dart
  /// for (var relation in person.colleagues) {
  ///   var colleague = relation.object;
  ///   print(colleague);
  /// }
  /// ```
  Set<Relation<Person>> get colleagues;

  /// Any people known to this person.
  ///
  /// ```dart
  /// for (var relation in person.knows) {
  ///   var contact = relation.object;
  ///   print(contact);
  /// }
  /// ```
  Set<Relation<Person>> get knows;

  /// Whether this person is known to speak English.
  bool? get speaksEnglish =>
      speaks.isNotEmpty ? speaks.contains(LanguageTag.en) : null;

  /// The known languages spoken by this person.
  ///
  /// ```dart
  /// for (var languageTag in person.speaks) {
  ///   print(languageTag);
  /// }
  /// ```
  Set<LanguageTag> get speaks;

  /// The original nationality of this person, if known.
  CountryCode? get nationality;

  /// The known nationalities of this person.
  ///
  /// ```dart
  /// for (var countryCode in person.nationalities) {
  ///   print(countryCode);
  /// }
  /// ```
  Set<CountryCode> get nationalities;

  /// The primary email address of this person, if known.
  Email? get email;

  /// The known email addresses of this person.
  ///
  /// ```dart
  /// for (var email in person.emails) {
  ///   print(email);
  /// }
  /// ```
  Set<Email> get emails;

  /// The primary phone number of this person, if known.
  Phone? get phone;

  /// The known phone numbers of this person.
  ///
  /// ```dart
  /// for (var phone in person.phones) {
  ///   print(phone);
  /// }
  /// ```
  Set<Phone> get phones;

  /// The primary website or social media profile of this person, if known.
  IRI? get link;

  /// The known websites or social media profiles of this person.
  ///
  /// ```dart
  /// for (var link in person.links) {
  ///   print(link);
  /// }
  /// ```
  Set<IRI> get links;

  /// Any supplementary notes about this person.
  ///
  /// ```dart
  /// for (var note in person.notes) {
  ///   print(note);
  /// }
  /// ```
  Set<String> get notes;

  Person._() : super.init();

  factory Person({
    String? id,
    Name? name,
    String? honorific,
    Set<Name> aliases,
    IRI? photo,
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
        photo,
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
        photo == other.photo &&
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
      "photo": photo?.toString(),
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
  IRI? photo;

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
      this.photo,
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
