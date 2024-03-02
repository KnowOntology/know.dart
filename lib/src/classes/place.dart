// This is free and unencumbered software released into the public domain.

import '../prelude.dart';
import 'thing.dart' show Thing;

/// A place.
sealed class Place extends Thing {
  // TODO: define properties

  Place._() : super.init();

  factory Place({
    String? id,
    Name? name,
  }) = _Place.of;

  factory Place.fromJson(final Map<String, dynamic> json) = _Place.fromJson;

  @override
  int get hashCode {
    return Object.hash(super.hashCode, null); // TODO
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Place) return false;
    return super == other;
  }

  @override
  String toString() {
    final json = toJson()..removeWhere((_, v) => v == null);
    final jsonString = json.toString();
    final inner = jsonString.substring(1, jsonString.length - 1);
    return "Place($inner)";
  }

  @override
  Map<String, dynamic> toJson() {
    final result = super.toJson();
    result.addAll({}); // TODO
    return result;
  }
}

final class _Place extends Place {
  @override
  String? id;

  @override
  Name? name;

  _Place.of({
    this.id,
    this.name,
  }) : super._();

  factory _Place() => _Place.of();

  factory _Place.fromJson(final Map<String, dynamic> json) {
    return Function.apply(
        _Place.of, [], json.map((k, v) => MapEntry(Symbol(k), v)));
  }
}
