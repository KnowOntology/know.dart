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
