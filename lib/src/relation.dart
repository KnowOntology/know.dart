// This is free and unencumbered software released into the public domain.

import 'classes/thing.dart' show Thing;

final class Relation<T extends Thing> {
  T subject;
  Symbol predicate;
  T object;

  Relation(this.subject, this.predicate, this.object);

  @override
  int get hashCode {
    return Object.hash(super.hashCode, subject, predicate, object);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Relation<T>) return false;
    return super == other &&
        subject == other.subject &&
        predicate == other.predicate &&
        object == other.object;
  }

  @override
  String toString() {
    final json = toJson().toString();
    final inner = json.substring(1, json.length - 1);
    return "Relation($inner)";
  }

  Map<String, dynamic> toJson() => {
        "subject": subject.toJson(),
        "predicate": predicate.toString(),
        "object": object.toJson(),
      };
}
