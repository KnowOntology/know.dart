// This is free and unencumbered software released into the public domain.

/// The length of time that a person has lived or a thing has existed.
typedef Age = int;

/// ISO 3166-1 alpha-2 code.
typedef CountryCode = String;

typedef Date = String; // TODO

/// A valid email address.
typedef Email = String;

/// Internationalized Resource Identifier (IRI).
typedef IRI = String;

/// A human-readable name for something.
typedef Name = String;

/// SS7 international phone number.
typedef Phone = String;

/// Biological sex for sexually dimorphic species.
enum Sex {
  male,
  female,
}

Type typeOf<X>() => X;

extension JSONCompact on Map<String, dynamic> {
  Map<String, dynamic> compact() {
    removeWhere((_, v) => v == null);
    removeWhere((_, v) => v is List && v.isEmpty);
    removeWhere((_, v) => v is Set && v.isEmpty);
    removeWhere((_, v) => v is Map && v.isEmpty);
    updateAll((_, v) => v is Map ? (v as Map<String, dynamic>).compact() : v);
    return this;
  }
}

extension SymbolAsString on Symbol {
  String asString() {
    final s = toString();
    return s.substring("Symbol(\"".length, s.length - "\")".length);
  }
}
