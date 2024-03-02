// This is free and unencumbered software released into the public domain.

import 'classes/thing.dart' show Thing;
import 'inspect.dart' show inspect;

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
    return inspect("Relation", toJson());
  }

  Map<String, dynamic> toJson() => {
        "predicate": _formatPredicate(predicate),
        "subject": subject?.toJson(),
        "object": object?.toJson(),
      };
}

String _formatPredicate(Symbol predicate) {
  var predicateString = predicate.toString();
  predicateString = predicateString.substring("Symbol(\"".length, predicateString.length - 2);
  return "#$predicateString";
}
