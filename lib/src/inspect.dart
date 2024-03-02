// This is free and unencumbered software released into the public domain.

String inspect(final String className, final Map<String, dynamic> json) {
  final jsonString = json.compact().toString();
  final inner = jsonString.substring(1, jsonString.length - 1);
  return "$className($inner)";
}

extension on Map<String, dynamic> {
  Map<String, dynamic> compact() {
    removeWhere((_, v) => v == null);
    removeWhere((_, v) => v is List && v.isEmpty);
    removeWhere((_, v) => v is Set && v.isEmpty);
    removeWhere((_, v) => v is Map && v.isEmpty);
    updateAll((_, v) => v is Map ? (v as Map<String, dynamic>).compact() : v);
    return this;
  }
}
