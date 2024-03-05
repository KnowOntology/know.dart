// This is free and unencumbered software released into the public domain.

import 'classes/thing.dart' show Thing;
import 'inspect.dart' show inspect;

/// A relationship between two things.
///
/// See: https://www.w3.org/TR/rdf12-concepts/#section-triples
/// See: https://www.w3.org/TR/rdf12-schema/#ch_statement
final class Relation<S extends Thing, O extends Thing> {
  final Symbol predicate;
  final S? subject;
  final O? object;

  const Relation(this.predicate, [this.subject, this.object]);

  @override
  int get hashCode {
    return Object.hash(predicate, subject, object);
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

  Map<String, dynamic> toJson() => <String, dynamic>{
        "predicate": _formatPredicate(predicate),
        "subject": subject?.toJson(),
        "object": object?.toJson(),
      };
}

String _formatPredicate(Symbol predicate) {
  var predicateString = predicate.toString();
  predicateString =
      predicateString.substring("Symbol(\"".length, predicateString.length - 2);
  return "#$predicateString";
}
