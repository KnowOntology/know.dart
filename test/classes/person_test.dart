// This is free and unencumbered software released into the public domain.

import 'package:know/know.dart';
import 'package:test/test.dart';

void main() {
  final person = Person(
    id: "1",
    name: "Thomas Anderson",
    honorific: "Mr.",
    aliases: {"Neo"},
    photo:
        "https://static.wikia.nocookie.net/matrix/images/3/32/Neo.jpg/revision/latest/smart/width/100/height/100",
    sex: Sex.male,
    birth: Event(start: "1962-03-11"),
    death: null,
    father: Person(name: "John Anderson"),
    mother: Person(name: "Michelle McGahey"),
    // TODO: siblings, spouses, partners, children, colleagues, knows
    speaks: {LanguageTag.en},
    nationalities: {"us"},
    emails: {"thomas.anderson@metacortex.com"},
    phones: {"+13125550101"},
    links: {"https://matrix.fandom.com/wiki/Neo"},
    notes: {"Neo loves Trinity."},
  );
  final personJson = {
    "id": "1",
    "name": "Thomas Anderson",
    "honorific": "Mr.",
    "aliases": ["Neo"],
    "photo":
        "https://static.wikia.nocookie.net/matrix/images/3/32/Neo.jpg/revision/latest/smart/width/100/height/100",
    "sex": "male",
    "birth": {"start": "1962-03-11"},
    "death": null,
    "father": {"name": "John Anderson"},
    "mother": {"name": "Michelle McGahey"},
    // TODO: siblings, spouses, partners, children, colleagues, knows
    "speaks": ["en"],
    "nationalities": ["us"],
    "emails": ["thomas.anderson@metacortex.com"],
    "phones": ["+13125550101"],
    "links": ["https://matrix.fandom.com/wiki/Neo"],
    "notes": ["Neo loves Trinity."],
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
