// This is free and unencumbered software released into the public domain.

import '../prelude.dart';
import '../inspect.dart' show inspect;
import 'thing.dart' show Thing;

/// A file.
sealed class File extends Thing {
  /// The size of this file, if known.
  int? get size;

  const File._() : super.init();

  const factory File({String? id, Name? name, int? size}) = _File.of;

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
  String toString() => inspect("File", toJson());

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll(<String, dynamic>{
      "size": size,
    })
    ..compact();
}

final class _File extends File {
  @override
  final String? id;

  @override
  final Name? name;

  @override
  final int? size;

  const _File.of({
    this.id,
    this.name,
    this.size,
  }) : super._();

  const factory _File() = _File.of;

  factory _File.fromJson(final Map<String, dynamic> json) {
    return Function.apply(
        _File.of, [], json.map((k, v) => MapEntry(Symbol(k), v)));
  }
}
