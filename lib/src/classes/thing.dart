// This is free and unencumbered software released into the public domain.

import 'package:knf/knf.dart' show Fact, Property, Term;
import 'package:meta/meta.dart' show protected;

import '../prelude.dart' show FactListToSet, JSONCompact, Name;
import '../inspect.dart' show inspect;

/// A thing.
abstract base class Thing {
  /// The key for this thing.
  Term? get key;

  /// A unique, opaque identifier for this thing, if any.
  String? get id;

  /// A human-legible name for this thing, if any.
  Name? get name;

  @protected
  const Thing.init();

  const factory Thing({
    Term? key,
    String? id,
    Name? name,
  }) = _Thing.of;

  factory Thing.fromFacts(final Iterable<Fact> facts) = _Thing.fromFacts;

  factory Thing.fromJson(final Map<String, dynamic> json) = _Thing.fromJson;

  @override
  int get hashCode => Object.hash(id, name);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Thing) return false;
    return key == other.key && id == other.id && name == other.name;
  }

  dynamic operator [](final Symbol propertyID) => switch (propertyID) {
        #key => key,
        #id => id,
        #name => name,
        _ => null,
      };

  @override
  String toString() => inspect("Thing", toJson());

  Set<Fact> toFacts() => <Fact?>[
        key != null && id != null ? Fact.spo(key!, #id, id!) : null,
        key != null && name != null ? Fact.spo(key!, #name, name!) : null,
      ].toFacts();

  Map<String, dynamic> toJson() => <String, dynamic>{
        "key": key?.toString(),
        "id": id,
        "name": name?.toString(),
      }.compact();

  /// Creates a new [Thing] from this one by updating individual properties.
  Thing copyWith({
    Term? key,
    String? id,
    Name? name,
  }) =>
      Thing(
        key: key ?? this.key,
        id: id ?? this.id,
        name: name ?? this.name,
      );
}

final class _Thing extends Thing {
  @override
  final Term? key;

  @override
  final String? id;

  @override
  final Name? name;

  const _Thing.of({
    this.key,
    this.id,
    this.name,
  }) : super.init();

  const factory _Thing() = _Thing.of;

  factory _Thing.fromFacts(final Iterable<Fact> facts) {
    if (facts.isEmpty) return _Thing();
    final subject = facts.first.subject;
    final Map<Symbol, dynamic> props = {#key: subject};
    for (final fact in facts.where((f) => f.predicate.isProperty)) {
      final predicate = fact.predicate as Property;
      final object = fact.object;
      final _ = switch (predicate.id) {
        #id => {props[#id] = object.valueAsString},
        #name => {props[#name] = object.valueAsString},
        _ => {},
      };
    }
    return Function.apply(_Thing.of, [], props);
  }

  factory _Thing.fromJson(final Map<String, dynamic> json) {
    return Function.apply(
        _Thing.of, [], json.map((k, v) => MapEntry(Symbol(k), v)));
  }
}
