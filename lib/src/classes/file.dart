// This is free and unencumbered software released into the public domain.

import '../prelude.dart';
import 'thing.dart' show Thing;

/// A file.
sealed class File extends Thing {
  /// The size of this file, if known.
  int? get size;

  File._() : super.init();

  factory File({String? id, Name? name, int? size}) = _File.of;

  factory File.fromJson(final Map<String, dynamic> json) = _File.fromJson;

  @override
  int get hashCode {
    return Object.hash(super.hashCode, size);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! File) return false;
    return super == other && size == other.size;
  }

  @override
  String toString() {
    final json = toJson()..removeWhere((_, v) => v == null);
    final jsonString = json.toString();
    final inner = jsonString.substring(1, jsonString.length - 1);
    return "File($inner)";
  }

  @override
  Map<String, dynamic> toJson() {
    final result = super.toJson();
    result.addAll({
      "size": size,
    });
    return result;
  }
}

final class _File extends File {
  @override
  String? id;

  @override
  Name? name;

  @override
  int? size;

  _File.of({
    this.id,
    this.name,
    this.size,
  }) : super._();

  factory _File() => _File.of();

  factory _File.fromJson(final Map<String, dynamic> json) {
    return Function.apply(
        _File.of, [], json.map((k, v) => MapEntry(Symbol(k), v)));
  }
}
