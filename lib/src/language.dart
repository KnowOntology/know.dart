// This is free and unencumbered software released into the public domain.

/// IETF BCP 47 language tag.
enum LanguageTag {
  ar("ar", "Arabic", "العربية"),
  en("en", "English", "English"),
  fi("fi", "Finnish", "suomi"),
  sv("sv", "Swedish", "svenska"),
  uk("uk", "Ukrainian", "українська");

  // TODO: add more language tags.

  factory LanguageTag.fromString(final String tag) {
    switch (tag) {
      case "ar":
        return ar;
      case "en":
        return en;
      case "fi":
        return fi;
      case "sv":
        return sv;
      case "uk":
        return uk;
      default:
        throw ArgumentError.value(tag, "tag", "Invalid language tag");
    }
  }

  factory LanguageTag.fromJson(final String tag) = LanguageTag.fromString;

  String toJson() => tag;

  const LanguageTag(this.tag, [this.labelEnglish, this.labelNative]);

  final String tag;
  final String? labelEnglish;
  final String? labelNative;
}
