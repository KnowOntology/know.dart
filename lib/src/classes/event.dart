// This is free and unencumbered software released into the public domain.

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

  const factory Event({
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
  String toString() => inspect("Event", toJson());

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll(<String, dynamic>{
      "start": start?.toString(),
      "end": end?.toString(),
      "place": place?.toJson(),
    })
    ..compact();
}

final class _Event extends Event {
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

  const _Event.of({
    this.id,
    this.name,
    this.start,
    this.end,
    this.place,
  }) : super._();

  const factory _Event() = _Event.of;

  factory _Event.fromJson(final Map<String, dynamic> json) {
    return Function.apply(
        _Event.of, [], json.map((k, v) => MapEntry(Symbol(k), v)));
  }
}
