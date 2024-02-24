// This is free and unencumbered software released into the public domain.

import '../prelude.dart';
import 'thing.dart' show Thing;

sealed class Event extends Thing {
  String? get date;

  Event._();

  factory Event() = _Event;

  factory Event.fromJson(final Map<String, dynamic> json) = _Event.fromJson;

  @override
  Map<String, dynamic> toJson() {
    final result = super.toJson();
    result.addAll({
      "date": date,
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
  String? date;

  _Event._({
    this.id,
    this.name,
    this.date, // ignore: unused_element
  }) : super._();

  factory _Event() => _Event._();

  factory _Event.fromJson(final Map<String, dynamic> json) {
    return _Event._(
      id: json["id"],
      name: json["name"],
      date: json["date"],
    );
  }
}
