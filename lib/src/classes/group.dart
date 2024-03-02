// This is free and unencumbered software released into the public domain.

import '../prelude.dart';
import 'thing.dart' show Thing;

/// A group of people.
sealed class Group extends Thing {
  // TODO: define properties

  Group._() : super.init();

  factory Group({
    String? id,
    Name? name,
  }) = _Group.of;

  factory Group.fromJson(final Map<String, dynamic> json) = _Group.fromJson;

  @override
  int get hashCode {
    return Object.hash(super.hashCode, null); // TODO
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Group) return false;
    return super == other;
  }

  @override
  String toString() {
    final json = toJson()..removeWhere((_, v) => v == null);
    final jsonString = json.toString();
    final inner = jsonString.substring(1, jsonString.length - 1);
    return "Group($inner)";
  }

  @override
  Map<String, dynamic> toJson() {
    final result = super.toJson();
    result.addAll({}); // TODO
    return result;
  }
}

final class _Group extends Group {
  @override
  String? id;

  @override
  Name? name;

  _Group.of({
    this.id,
    this.name,
  }) : super._();

  factory _Group() => _Group.of();

  factory _Group.fromJson(final Map<String, dynamic> json) {
    return Function.apply(
        _Group.of, [], json.map((k, v) => MapEntry(Symbol(k), v)));
  }
}
