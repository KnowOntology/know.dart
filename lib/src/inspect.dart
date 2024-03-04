// This is free and unencumbered software released into the public domain.

import 'prelude.dart' show JSONCompact;

String inspect(final String className, final Map<String, dynamic> json) {
  final jsonString = json.compact().toString();
  final inner = jsonString.substring(1, jsonString.length - 1);
  return "$className($inner)";
}

Map<String, dynamic> compactJSON(final Map<String, dynamic> input) {
  return input.compact();
}
