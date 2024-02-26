// This is free and unencumbered software released into the public domain.

import '../prelude.dart';
import 'package:meta/meta.dart' show protected;

abstract base class Thing {
  String? get id;

  Name? get name;

  @protected
  Thing.init();

  factory Thing({
    String? id,
    Name? name,
  }) = _Thing.of;

  factory Thing.fromJson(final Map<String, dynamic> json) = _Thing.fromJson;

  @override
  int get hashCode {
    return Object.hash(id, name);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Thing) return false;
    return id == other.id && name == other.name;
  }

  @override
  String toString() {
    final json = toJson().toString();
    final inner = json.substring(1, json.length - 1);
    return "Thing($inner)";
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name.toString(),
      };
}

final class _Thing extends Thing {
  @override
  String? id;

  @override
  Name? name;

  _Thing.of({
    this.id,
    this.name,
  }) : super.init();

  factory _Thing() => _Thing.of();

  factory _Thing.fromJson(final Map<String, dynamic> json) {
    return Function.apply(
        _Thing.of, [], json.map((k, v) => MapEntry(Symbol(k), v)));
  }
}
