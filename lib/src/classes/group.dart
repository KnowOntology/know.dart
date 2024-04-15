// This is free and unencumbered software released into the public domain.

import 'package:knf/knf.dart' show Term;

import '../prelude.dart';
import '../inspect.dart' show inspect;
import 'thing.dart' show Thing;

/// A group of people.
sealed class Group extends Thing {
  // TODO: define properties

  const Group._() : super.init();

  const factory Group({
    Term? key,
    String? id,
    Name? name,
  }) = _Group.of;

  factory Group.fromJson(final Map<String, dynamic> json) = _Group.fromJson;

  @override
  int get hashCode => Object.hash(super.hashCode, null); // TODO

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Group) return false;
    return super == other;
  }

  @override
  dynamic operator [](final Symbol propertyID) => switch (propertyID) {
        // TODO
        _ => super[propertyID],
      };

  @override
  String toString() => inspect("Group", toJson());

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll(<String, dynamic>{}) // TODO
    ..compact();

  /// Creates a new [Group] from this one by updating individual properties.
  @override
  Group copyWith({
    Term? key,
    String? id,
    Name? name,
  }) =>
      Group(
        key: key ?? this.key,
        id: id ?? this.id,
        name: name ?? this.name,
      );
}

final class _Group extends Group {
  @override
  final Term? key;

  @override
  final String? id;

  @override
  final Name? name;

  const _Group.of({
    this.key,
    this.id,
    this.name,
  }) : super._();

  const factory _Group() = _Group.of;

  factory _Group.fromJson(final Map<String, dynamic> json) {
    return Function.apply(
        _Group.of, [], json.map((k, v) => MapEntry(Symbol(k), v)));
  }
}
