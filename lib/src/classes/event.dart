// This is free and unencumbered software released into the public domain.

import '../prelude.dart';
import 'thing.dart' show Thing;

sealed class Event extends Thing {
  Date? get date;

  Event._();

  factory Event({
    String? id,
    Name? name,
    Date? date,
  }) = _Event.make;

  factory Event.fromJson(final Map<String, dynamic> json) = _Event.fromJson;

  @override
  Map<String, dynamic> toJson() {
    final result = super.toJson();
    result.addAll({
      "date": date.toString(),
    });
    return result;
  }
}

final class _Event extends Event {
  @override
  String? id;

  @override
  Name? name;

  @override
  Date? date;

  _Event.make({
    this.id,
    this.name,
    this.date,
  }) : super._();

  factory _Event() => _Event.make();

  factory _Event.fromJson(final Map<String, dynamic> json) {
    return _Event.make(
      id: json["id"],
      name: json["name"],
      date: json["date"],
    );
  }
}
