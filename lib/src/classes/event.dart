// This is free and unencumbered software released into the public domain.

import '../prelude.dart';
import 'thing.dart' show Thing;

sealed class Event extends Thing {
  Date? get start;

  Date? get end;

  Event._();

  factory Event({
    String? id,
    Name? name,
    Date? start,
    Date? end,
  }) = _Event.make;

  factory Event.fromJson(final Map<String, dynamic> json) = _Event.fromJson;

  @override
  Map<String, dynamic> toJson() {
    final result = super.toJson();
    result.addAll({
      "start": start.toString(),
      "end": end.toString(),
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
  Date? start;

  @override
  Date? end;

  _Event.make({
    this.id,
    this.name,
    this.start,
    this.end,
  }) : super._();

  factory _Event() => _Event.make();

  factory _Event.fromJson(final Map<String, dynamic> json) {
    return Function.apply(_Event.make, [], json.map((k, v) => MapEntry(Symbol(k), v)));
  }
}
