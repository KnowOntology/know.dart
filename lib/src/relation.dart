// This is free and unencumbered software released into the public domain.

import 'classes/thing.dart' show Thing;

final class Relation<S extends Thing, O extends Thing> {
  Symbol predicate;
  S? subject;
  O? object;

  Relation(this.predicate, [this.subject, this.object]);

  @override
  int get hashCode {
    return Object.hash(super.hashCode, predicate, subject, object);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Relation<S, O>) return false;
    return predicate == other.predicate &&
        subject == other.subject &&
        object == other.object;
  }

  @override
  String toString() {
    final json = toJson().toString();
    final inner = json.substring(1, json.length - 1);
    return "Relation($inner)";
  }

  Map<String, dynamic> toJson() => {
        "predicate": predicate.toString(),
        "subject": subject?.toJson(),
        "object": object?.toJson(),
      };
}
