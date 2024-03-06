// This is free and unencumbered software released into the public domain.

import '../prelude.dart';
import '../inspect.dart' show inspect;
import 'package:meta/meta.dart' show protected;

/// A thing.
abstract base class Thing {
  /// A unique, opaque identifier for this thing, if any.
  String? get id;

  /// A human-legible name for this thing, if any.
  Name? get name;

  @protected
  const Thing.init();

  const factory Thing({
    String? id,
    Name? name,
  }) = _Thing.of;

  factory Thing.fromJson(final Map<String, dynamic> json) = _Thing.fromJson;

  @override
  int get hashCode => Object.hash(id, name);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Thing) return false;
    return id == other.id && name == other.name;
  }

  dynamic operator [](final Symbol propertyID) => switch (propertyID) {
        #id => id,
        #name => name,
        _ => null,
      };

  @override
  String toString() => inspect("Thing", toJson());

  Map<String, dynamic> toJson() => <String, dynamic>{
        "id": id,
        "name": name?.toString(),
      }.compact();

  /// Creates a new [Thing] from this one by updating individual properties.
  Thing copyWith({
    String? id,
    Name? name,
  }) =>
      Thing(
        id: id ?? this.id,
        name: name ?? this.name,
      );
}

final class _Thing extends Thing {
  @override
  final String? id;

  @override
  final Name? name;

  const _Thing.of({
    this.id,
    this.name,
  }) : super.init();

  const factory _Thing() = _Thing.of;

  factory _Thing.fromJson(final Map<String, dynamic> json) {
    return Function.apply(
        _Thing.of, [], json.map((k, v) => MapEntry(Symbol(k), v)));
  }
}
