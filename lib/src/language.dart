// This is free and unencumbered software released into the public domain.

/// IETF BCP 47 language tag.
enum LanguageTag {
  ar("ar", "Arabic", "العربية"),
  en("en", "English", "English"),
  fi("fi", "Finnish", "suomi"),
  sv("sv", "Swedish", "svenska"),
  uk("uk", "Ukrainian", "українська");

  // TODO: add more language tags.

  const LanguageTag(this.tag, [this.labelEnglish, this.labelNative]);

  final String tag;
  final String? labelEnglish;
  final String? labelNative;
}
