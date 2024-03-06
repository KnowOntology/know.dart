// This is free and unencumbered software released into the public domain.

import '../prelude.dart';
import '../inspect.dart' show inspect;
import 'thing.dart' show Thing;

/// A place.
sealed class Place extends Thing {
  // TODO: define properties

  const Place._() : super.init();

  const factory Place({
    String? id,
    Name? name,
  }) = _Place.of;

  factory Place.fromJson(final Map<String, dynamic> json) = _Place.fromJson;

  @override
  int get hashCode => Object.hash(super.hashCode, null); // TODO

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Place) return false;
    return super == other;
  }

  @override
  dynamic operator [](final Symbol propertyID) => switch (propertyID) {
        // TODO
        _ => super[propertyID],
      };

  @override
  String toString() => inspect("Place", toJson());

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll(<String, dynamic>{}) // TODO
    ..compact();

  /// Creates a new [Place] from this one by updating individual properties.
  @override
  Place copyWith({
    String? id,
    Name? name,
  }) =>
      Place(
        id: id ?? this.id,
        name: name ?? this.name,
      );
}

final class _Place extends Place {
  @override
  final String? id;

  @override
  final Name? name;

  const _Place.of({
    this.id,
    this.name,
  }) : super._();

  const factory _Place() = _Place.of;

  factory _Place.fromJson(final Map<String, dynamic> json) {
    return Function.apply(
        _Place.of, [], json.map((k, v) => MapEntry(Symbol(k), v)));
  }
}
