// This is free and unencumbered software released into the public domain.

import 'package:knf/knf.dart' show Term;

import '../prelude.dart';
import '../inspect.dart' show inspect;
import 'thing.dart' show Thing;

/// A link.
sealed class Link extends Thing {
  /// The URL of this link.
  IRI? get url;

  const Link._() : super.init();

  const factory Link({Term? key, String? id, Name? name, IRI? url}) = _Link.of;

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
  dynamic operator [](final Symbol propertyID) => switch (propertyID) {
        #url => url,
        _ => super[propertyID],
      };

  @override
  String toString() => inspect("Link", toJson());

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll(<String, dynamic>{
      "url": url,
    })
    ..compact();

  /// Creates a new [Link] from this one by updating individual properties.
  @override
  Link copyWith({
    Term? key,
    String? id,
    Name? name,
    IRI? url,
  }) =>
      Link(
        key: key ?? this.key,
        id: id ?? this.id,
        name: name ?? this.name,
        url: url ?? this.url,
      );
}

final class _Link extends Link {
  @override
  final Term? key;

  @override
  final String? id;

  @override
  final Name? name;

  @override
  final IRI? url;

  const _Link.of({
    this.key,
    this.id,
    this.name,
    this.url,
  }) : super._();

  const factory _Link() = _Link.of;

  factory _Link.fromJson(final Map<String, dynamic> json) {
    return Function.apply(
        _Link.of, [], json.map((k, v) => MapEntry(Symbol(k), v)));
  }
}
