// This is free and unencumbered software released into the public domain.

import 'package:collection/collection.dart';
import 'package:knf/knf.dart' show Fact, Property, Term;

import '../prelude.dart';
import '../inspect.dart' show inspect;
import '../language.dart' show LanguageTag;
import '../relation.dart' show Relation;
import 'event.dart' show Event;
import 'thing.dart' show Thing;

/// A relationship between two people.
typedef PersonRelation = Relation<Person, Person>;

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
  Set<PersonRelation> get siblings;

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
  Set<PersonRelation> get partners;

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
  Set<PersonRelation> get spouses;

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
  Set<PersonRelation> get children;

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
  Set<PersonRelation> get colleagues;

  /// Any people known to this person.
  ///
  /// ```dart
  /// for (var relation in person.knows) {
  ///   var contact = relation.object;
  ///   print(contact);
  /// }
  /// ```
  Set<PersonRelation> get knows;

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
  String? get note => notes.isNotEmpty ? notes.join("\n") : null;

  /// Any supplementary notes about this person.
  ///
  /// ```dart
  /// for (var note in person.notes) {
  ///   print(note);
  /// }
  /// ```
  Set<String> get notes;

  const Person._() : super.init();

  factory Person({
    Term? key,
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
    Set<PersonRelation> siblings,
    Set<PersonRelation> partners,
    Set<PersonRelation> spouses,
    Set<PersonRelation> children,
    Set<PersonRelation> colleagues,
    Set<PersonRelation> knows,
    Set<LanguageTag> speaks,
    Set<CountryCode> nationalities,
    Set<Email> emails,
    Set<Phone> phones,
    Set<IRI> links,
    Set<String> notes,
  }) = _Person.of;

  factory Person.fromFacts(final Iterable<Fact> facts) = _Person.fromFacts;

  factory Person.fromJson(final Map<String, dynamic> json) = _Person.fromJson;

  @override
  int get hashCode => Object.hashAll([
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
        partners,
        spouses,
        children,
        colleagues,
        knows,
        speaks,
        nationalities,
        emails,
        phones,
        links,
        notes,
      ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Person) return false;
    final setEquality = const SetEquality();
    return super == other &&
        honorific == other.honorific &&
        setEquality.equals(aliases, other.aliases) &&
        photo == other.photo &&
        sex == other.sex &&
        birth == other.birth &&
        death == other.death &&
        father == other.father &&
        mother == other.mother &&
        setEquality.equals(siblings, other.siblings) &&
        setEquality.equals(partners, other.partners) &&
        setEquality.equals(spouses, other.spouses) &&
        setEquality.equals(children, other.children) &&
        setEquality.equals(colleagues, other.colleagues) &&
        setEquality.equals(knows, other.knows) &&
        setEquality.equals(speaks, other.speaks) &&
        setEquality.equals(nationalities, other.nationalities) &&
        setEquality.equals(emails, other.emails) &&
        setEquality.equals(phones, other.phones) &&
        setEquality.equals(links, other.links) &&
        setEquality.equals(notes, other.notes);
  }

  @override
  dynamic operator [](final Symbol propertyID) => switch (propertyID) {
        #honorific => honorific,
        #alias => alias,
        #aliases => aliases,
        #photo => photo,
        #isMale => isMale,
        #isFemale => isFemale,
        #sex => sex,
        #isChild => isChild,
        #isAdult => isAdult,
        #age => age,
        #birthdate => birthdate,
        #birth => birth,
        #death => death,
        #parents => parents,
        #father => father,
        #mother => mother,
        #hasSiblings => hasSiblings,
        #siblings => siblings,
        #hasPartner => hasPartner,
        #partner => partner,
        #partners => partners,
        #hasSpouse => hasSpouse,
        #spouse => spouse,
        #spouses => spouses,
        #hasChildren => hasChildren,
        #children => children,
        #hasColleagues => hasColleagues,
        #colleagues => colleagues,
        #knows => knows,
        #speaksEnglish => speaksEnglish,
        #speaks => speaks,
        #nationality => nationality,
        #nationalities => nationalities,
        #email => email,
        #emails => emails,
        #phone => phone,
        #phones => phones,
        #link => link,
        #links => links,
        #note => note,
        #notes => notes,
        _ => super[propertyID],
      };

  @override
  String toString() => inspect("Person", toJson());

  @override
  Set<Fact> toFacts() => super.toFacts()..addAll(<Fact?>[
        key != null && id != null ? Fact.spo(key!, #id, id!) : null,
        key != null && name != null ? Fact.spo(key!, #name, name!) : null,
        // TODO
      ].toFacts());

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll(<String, dynamic>{
      "honorific": honorific,
      "aliases": aliases.toList(),
      "photo": photo?.toString(),
      "sex": sex?.name,
      "birth": birth?.toJson(),
      "death": death?.toJson(),
      "father": father?.toJson(),
      "mother": mother?.toJson(),
      "siblings": siblings.map((r) => r.object?.toJson()).toList(),
      "partners": partners.map((r) => r.object?.toJson()).toList(),
      "spouses": spouses.map((r) => r.object?.toJson()).toList(),
      "children": children.map((r) => r.object?.toJson()).toList(),
      "colleagues": colleagues.map((r) => r.object?.toJson()).toList(),
      "knows": knows.map((r) => r.object?.toJson()).toList(),
      "speaks": speaks.map((e) => e.toJson()).toList(),
      "nationalities": nationalities.map((e) => e.toString()).toList(),
      "emails": emails.map((e) => e.toString()).toList(),
      "phones": phones.map((e) => e.toString()).toList(),
      "links": links.map((e) => e.toString()).toList(),
      "notes": notes.map((e) => e.toString()).toList(),
    })
    ..compact();

  /// Creates a new [Person] from this one by updating individual properties.
  @override
  Person copyWith({
    Term? key,
    String? id,
    Name? name,
    String? honorific,
    Set<Name>? aliases,
    IRI? photo,
    Sex? sex,
    Event? birth,
    Event? death,
    Person? father,
    Person? mother,
    Set<PersonRelation>? siblings,
    Set<PersonRelation>? partners,
    Set<PersonRelation>? spouses,
    Set<PersonRelation>? children,
    Set<PersonRelation>? colleagues,
    Set<PersonRelation>? knows,
    Set<LanguageTag>? speaks,
    Set<CountryCode>? nationalities,
    Set<Email>? emails,
    Set<Phone>? phones,
    Set<IRI>? links,
    Set<String>? notes,
  }) =>
      Person(
        key: key ?? this.key,
        id: id ?? this.id,
        name: name ?? this.name,
        honorific: honorific ?? this.honorific,
        aliases: aliases ?? this.aliases,
        photo: photo ?? this.photo,
        sex: sex ?? this.sex,
        birth: birth ?? this.birth,
        death: death ?? this.death,
        father: father ?? this.father,
        mother: mother ?? this.mother,
        siblings: siblings ?? this.siblings,
        partners: partners ?? this.partners,
        spouses: spouses ?? this.spouses,
        children: children ?? this.children,
        colleagues: colleagues ?? this.colleagues,
        knows: knows ?? this.knows,
        speaks: speaks ?? this.speaks,
        nationalities: nationalities ?? this.nationalities,
        emails: emails ?? this.emails,
        phones: phones ?? this.phones,
        links: links ?? this.links,
        notes: notes ?? this.notes,
      );
}

final class _Person extends Person {
  @override
  final Term key;

  @override
  final String? id;

  @override
  final Name? name;

  @override
  final String? honorific;

  @override
  Name? get alias => aliases.firstOrNull;

  @override
  final Set<Name> aliases;

  @override
  final IRI? photo;

  @override
  final Sex? sex;

  @override
  Age? get age => null; // TODO: calculate from this.birthdate

  @override
  Date? get birthdate => birth?.start;

  @override
  final Event? birth;

  @override
  final Event? death;

  @override
  Set<Person> get parents => {father, mother}.whereType<Person>().toSet();

  @override
  final Person? father;

  @override
  final Person? mother;

  @override
  final Set<PersonRelation> siblings;

  @override
  Person? get partner => partners.firstOrNull?.object;

  @override
  final Set<PersonRelation> partners;

  @override
  Person? get spouse => spouses.firstOrNull?.object;

  @override
  final Set<PersonRelation> spouses;

  @override
  final Set<PersonRelation> children;

  @override
  final Set<PersonRelation> colleagues;

  @override
  final Set<PersonRelation> knows;

  @override
  final Set<LanguageTag> speaks;

  @override
  CountryCode? get nationality => nationalities.firstOrNull;

  @override
  final Set<CountryCode> nationalities;

  @override
  Email? get email => emails.firstOrNull;

  @override
  final Set<Email> emails;

  @override
  Phone? get phone => phones.firstOrNull;

  @override
  final Set<Phone> phones;

  @override
  IRI? get link => links.firstOrNull;

  @override
  final Set<IRI> links;

  @override
  final Set<String> notes;

  _Person.of(
      {Term? key,
      this.id,
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
      this.partners = const {},
      this.spouses = const {},
      this.children = const {},
      this.colleagues = const {},
      this.knows = const {},
      this.speaks = const {},
      this.nationalities = const {},
      this.emails = const {},
      this.phones = const {},
      this.links = const {},
      this.notes = const {}})
      : key = key ?? Term.genid(),
        super._();

  factory _Person() = _Person.of;

  factory _Person.fromFacts(final Iterable<Fact> facts) {
    final Map<Symbol, dynamic> props = {};
    Set<T> add<T>(final Symbol id, final T value) {
      final values = props[id] ?? <T>{};
      values.add(value);
      return values;
    }

    for (final fact in facts.where((f) => f.predicate.isProperty)) {
      final predicate = fact.predicate as Property;
      final object = fact.object;
      final _ = switch (predicate.id) {
        #id => props[#id] = object.valueAsString,
        #name => props[#name] = object.valueAsString,
        #honorific => props[#honorific] = object.valueAsString,
        #alias => add(#aliases, object.valueAsString),
        #photo => props[#photo] = object.valueAsString,
        // TODO: #sex,
        // TODO: #birth,
        // TODO: #death,
        // TODO: #father,
        // TODO: #mother,
        // TODO: #siblings = const {},
        // TODO: #partners = const {},
        // TODO: #spouses = const {},
        // TODO: #children = const {},
        // TODO: #colleagues = const {},
        // TODO: #knows = const {},
        // TODO: #speaks = const {},
        // TODO: #nationalities = const {},
        // TODO: #emails = const {},
        // TODO: #phones = const {},
        // TODO: #links = const {},
        // TODO: #notes = const {}})
        _ => {},
      };
    }
    return Function.apply(_Person.of, [], props);
  }

  factory _Person.fromJson(final Map<String, dynamic> json) {
    return Function.apply(_Person.of, [], json.map((k, v) {
      final key = Symbol(k);
      final val = switch (key) {
        #key => Term.parse(v),
        #aliases => (v as List<dynamic>).cast<Name>().toSet(),
        #sex => Sex.values.firstWhereOrNull((e) => e.name == v),
        #birth => v != null ? Event.fromJson(v) : null,
        #death => v != null ? Event.fromJson(v) : null,
        #father => v != null ? Person.fromJson(v) : null,
        #mother => v != null ? Person.fromJson(v) : null,
        #siblings => _parseRelations(
            #sibling, (v as List<dynamic>).cast<Map<String, dynamic>>()),
        #partners => _parseRelations(
            #partner, (v as List<dynamic>).cast<Map<String, dynamic>>()),
        #spouses => _parseRelations(
            #spouse, (v as List<dynamic>).cast<Map<String, dynamic>>()),
        #children => _parseRelations(
            #child, (v as List<dynamic>).cast<Map<String, dynamic>>()),
        #colleagues => _parseRelations(
            #colleague, (v as List<dynamic>).cast<Map<String, dynamic>>()),
        #knows => _parseRelations(
            #knows, (v as List<dynamic>).cast<Map<String, dynamic>>()),
        #speaks =>
          (v as List<dynamic>).map((e) => LanguageTag.fromJson(e)).toSet(),
        #nationalities => (v as List<dynamic>).cast<CountryCode>().toSet(),
        #emails => (v as List<dynamic>).cast<Email>().toSet(),
        #phones => (v as List<dynamic>).cast<Phone>().toSet(),
        #links => (v as List<dynamic>).cast<IRI>().toSet(),
        #notes => (v as List<dynamic>).cast<String>().toSet(),
        _ => v
      };
      return MapEntry(key, val);
    }));
  }
}

Set<PersonRelation> _parseRelations(
    Symbol predicate, List<Map<String, dynamic>> input) {
  return input.map((e) {
    final p = Person.fromJson(e);
    return PersonRelation(predicate, null, p);
  }).toSet();
}
