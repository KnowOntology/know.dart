// This is free and unencumbered software released into the public domain.

import 'package:know/know.dart';
import 'package:test/test.dart';

void main() {
  group('LanguageTag', () {
    test('.fi', () {
      expect(LanguageTag.fi, isA<LanguageTag>());
      expect(LanguageTag.fi.name, equals('fi'));
      expect(LanguageTag.fi.toString(), equals('LanguageTag.fi'));
      expect(LanguageTag.fi.tag, equals('fi'));
      expect(LanguageTag.fi.labelEnglish, equals("Finnish"));
      expect(LanguageTag.fi.labelNative, equals("suomi"));
    });
    test('can be constructed without a label', () {
      // TODO
    });
  });
}
