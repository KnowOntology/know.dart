// This is free and unencumbered software released into the public domain.

import 'package:knf/knf.dart' show Term;

import '../prelude.dart';
import '../inspect.dart' show inspect;
import 'thing.dart' show Thing;

/// A file.
sealed class File extends Thing {
  /// The size of this file, if known.
  int? get size;

  const File._() : super.init();

  factory File({Term? key, String? id, Name? name, int? size}) = _File.of;

  factory File.fromJson(final Map<String, dynamic> json) = _File.fromJson;

  @override
  int get hashCode => Object.hash(super.hashCode, size);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! File) return false;
    return super == other && size == other.size;
  }

  @override
  dynamic operator [](final Symbol propertyID) => switch (propertyID) {
        #size => size,
        _ => super[propertyID],
      };

  @override
  String toString() => inspect("File", toJson());

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll(<String, dynamic>{
      "size": size,
    })
    ..compact();

  /// Creates a new [File] from this one by updating individual properties.
  @override
  File copyWith({
    Term? key,
    String? id,
    Name? name,
    int? size,
  }) =>
      File(
        key: key ?? this.key,
        id: id ?? this.id,
        name: name ?? this.name,
        size: size ?? this.size,
      );
}

final class _File extends File {
  @override
  final Term key;

  @override
  final String? id;

  @override
  final Name? name;

  @override
  final int? size;

  _File.of({
    Term? key,
    this.id,
    this.name,
    this.size,
  }) : key = key ?? Term.genid(), super._();

  factory _File() = _File.of;

  factory _File.fromJson(final Map<String, dynamic> json) {
    return Function.apply(
        _File.of, [], json.map((k, v) => MapEntry(Symbol(k), v)));
  }
}
