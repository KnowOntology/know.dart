// This is free and unencumbered software released into the public domain.

import 'package:knf/knf.dart' show Term;

import '../prelude.dart';
import '../inspect.dart' show inspect;
import 'place.dart' show Place;
import 'thing.dart' show Thing;

/// An event.
sealed class Event extends Thing {
  /// The start date of this event.
  Date? get start;

  /// The end date of this event, if any.
  Date? get end;

  /// The place where this event occurs, if any.
  Place? get place;

  const Event._() : super.init();

  factory Event({
    Term? key,
    String? id,
    Name? name,
    Date? start,
    Date? end,
    Place? place,
  }) = _Event.of;

  factory Event.fromJson(final Map<String, dynamic> json) = _Event.fromJson;

  @override
  int get hashCode => Object.hash(super.hashCode, start, end, place);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Event) return false;
    return super == other &&
        start == other.start &&
        end == other.end &&
        place == other.place;
  }

  @override
  dynamic operator [](final Symbol propertyID) => switch (propertyID) {
        #start => start,
        #end => end,
        #place => place,
        _ => super[propertyID],
      };

  @override
  String toString() => inspect("Event", toJson());

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll(<String, dynamic>{
      "start": start?.toString(),
      "end": end?.toString(),
      "place": place?.toJson(),
    })
    ..compact();

  /// Creates a new [Event] from this one by updating individual properties.
  @override
  Event copyWith({
    Term? key,
    String? id,
    Name? name,
    Date? start,
    Date? end,
    Place? place,
  }) =>
      Event(
        key: key ?? this.key,
        id: id ?? this.id,
        name: name ?? this.name,
        start: start ?? this.start,
        end: end ?? this.end,
        place: place ?? this.place,
      );
}

final class _Event extends Event {
  @override
  final Term key;

  @override
  final String? id;

  @override
  final Name? name;

  @override
  final Date? start;

  @override
  final Date? end;

  @override
  final Place? place;

  _Event.of({
    Term? key,
    this.id,
    this.name,
    this.start,
    this.end,
    this.place,
  })  : key = key ?? Term.genid(),
        super._();

  factory _Event() = _Event.of;

  factory _Event.fromJson(final Map<String, dynamic> json) {
    return Function.apply(_Event.of, [], json.map((k, v) {
      final key = Symbol(k);
      final val = switch (key) { #key => Term.parse(v), _ => v };
      return MapEntry(key, val);
    }));
  }
}
