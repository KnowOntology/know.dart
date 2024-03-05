// This is free and unencumbered software released into the public domain.

/// The length of time that a person has lived or a thing has existed.
typedef Age = int;

/// ISO 3166-1 alpha-2 code.
typedef CountryCode = String;

typedef Date = String; // TODO

/// A valid email address.
typedef Email = String;

/// An Internationalized Resource Identifier (IRI).
typedef IRI = String;

/// A human-readable name for something.
typedef Name = String;

/// An SS7 international phone number.
typedef Phone = String;

/// A biological sex for sexually dimorphic species.
enum Sex {
  male,
  female,
}

Type typeOf<X>() => X;

/// Implementation of `Map<String, dynamic>#compact()`.
extension JSONCompact on Map<String, dynamic> {
  Map<String, dynamic> compact() {
    removeWhere((_, v) => v == null);
    removeWhere((_, v) => v is List && v.isEmpty);
    removeWhere((_, v) => v is Set && v.isEmpty);
    removeWhere((_, v) => v is Map && v.isEmpty);
    keys.toList().forEach((k) {
      final v = this[k];
      if (v is Map) {
        this[k] = (v as Map<String, dynamic>).compact();
      } else if (v is Set) {
        this[k] = v
            .map((e) => e is! Map ? e : (e as Map<String, dynamic>).compact())
            .toList();
      } else if (v is List) {
        this[k] = v
            .map((e) => e is! Map ? e : (e as Map<String, dynamic>).compact())
            .toList();
      }
    });
    return this;
  }
}

/// Implementation of `Symbol#asString()`.
extension SymbolAsString on Symbol {
  String asString() {
    final s = toString();
    return s.substring("Symbol(\"".length, s.length - "\")".length);
  }
}
