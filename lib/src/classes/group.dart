// This is free and unencumbered software released into the public domain.

import '../prelude.dart';
import '../inspect.dart' show inspect;
import 'thing.dart' show Thing;

/// A group of people.
sealed class Group extends Thing {
  // TODO: define properties

  const Group._() : super.init();

  const factory Group({
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
  String toString() => inspect("Group", toJson());

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll(<String, dynamic>{}) // TODO
    ..compact();
}

final class _Group extends Group {
  @override
  final String? id;

  @override
  final Name? name;

  const _Group.of({
    this.id,
    this.name,
  }) : super._();

  const factory _Group() = _Group.of;

  factory _Group.fromJson(final Map<String, dynamic> json) {
    return Function.apply(
        _Group.of, [], json.map((k, v) => MapEntry(Symbol(k), v)));
  }
}
