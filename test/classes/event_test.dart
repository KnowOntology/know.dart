// This is free and unencumbered software released into the public domain.

import 'package:knf/knf.dart';
import 'package:know/know.dart';
import 'package:test/test.dart';

void main() {
  final event = Event(
    key: Term.allusion("event"),
    id: "123",
    name: "An Event",
    start: "2021-01-01",
    end: "2021-01-02",
    place: null,
  );

  final eventJson = {
    "key": "event",
    "id": "123",
    "name": "An Event",
    "start": "2021-01-01",
    "end": "2021-01-02",
  };

  group('Event', () {
    test('#toJson', () {
      expect(event.toJson(), equals(eventJson));
    });
    test('.fromJson', () {
      expect(Event.fromJson(eventJson), isA<Event>());
      expect(Event.fromJson(eventJson), equals(event));
    });
  });
}
