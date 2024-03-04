// This is free and unencumbered software released into the public domain.

import '../prelude.dart';
import '../inspect.dart' show inspect;
import 'thing.dart' show Thing;

/// A link.
sealed class Link extends Thing {
  /// The URL of this link.
  IRI? get url;

  Link._() : super.init();

  factory Link({String? id, Name? name, IRI? url}) = _Link.of;

  factory Link.fromJson(final Map<String, dynamic> json) = _Link.fromJson;

  @override
  int get hashCode => Object.hash(super.hashCode, url);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Link) return false;
    return super == other && url == other.url;
  }

  @override
  String toString() => inspect("Link", toJson());

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll({
      "url": url,
    })
    ..compact();
}

final class _Link extends Link {
  @override
  String? id;

  @override
  Name? name;

  @override
  IRI? url;

  _Link.of({
    this.id,
    this.name,
    this.url,
  }) : super._();

  factory _Link() => _Link.of();

  factory _Link.fromJson(final Map<String, dynamic> json) {
    return Function.apply(
        _Link.of, [], json.map((k, v) => MapEntry(Symbol(k), v)));
  }
}
