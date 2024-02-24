// This is free and unencumbered software released into the public domain.

import '../prelude.dart';

abstract base class Thing {
  String? get id;

  Name? get name;

  Thing();

  factory Thing.fromJson(final Map<String, dynamic> json) = _Thing.fromJson;

  @override
  String toString() => toJson().toString();

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

  _Thing._({
    this.id, // ignore: unused_element
    this.name, // ignore: unused_element
  });

  factory _Thing() => _Thing._();

  factory _Thing.fromJson(final Map<String, dynamic> json) {
    return _Thing._(
      id: json["id"],
      name: json["name"],
    );
  }
}
