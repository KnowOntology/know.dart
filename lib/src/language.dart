// This is free and unencumbered software released into the public domain.

typedef L = LanguageTag;

/// IETF BCP 47 language tag.
enum LanguageTag {
  ar("ar", "Arabic", "العربية"),
  bn("bn", "Bengali", "বাংলা"),
  de("de", "German", "Deutsch"),
  en("en", "English", "English"),
  eo("eo", "Esperanto", "Esperanto"),
  es("es", "Spanish", "español"),
  et("et", "Estonian", "eesti"),
  fi("fi", "Finnish", "suomi"),
  fr("fr", "French", "français"),
  hi("hi", "Hindi", "हिंदी"),
  id("id", "Indonesian", "Bahasa Indonesia"),
  it("it", "Italian", "italiano"),
  ja("ja", "Japanese", "日本語"),
  ko("ko", "Korean", "한국어"),
  ms("ms", "Malay", "Bahasa Malaysia"),
  pl("pl", "Polish", "polski"),
  pt("pt", "Portuguese", "Português"),
  sv("sv", "Swedish", "svenska"),
  tr("tr", "Turkish", "Türkçe"),
  uk("uk", "Ukrainian", "українська"),
  ur("ur", "Urdu", "اُردو"),
  vi("vi", "Vietnamese", "Tiếng Việt"),
  zh("zh", "Chinese", "中文");

  factory LanguageTag.fromString(final String tag) {
    for (final lang in LanguageTag.values) {
      if (lang.tag == tag) {
        return lang;
      }
    }
    throw ArgumentError.value(tag, "tag", "Unknown language tag");
  }

  factory LanguageTag.fromJson(final String tag) = LanguageTag.fromString;

  String toJson() => tag;

  const LanguageTag(this.tag, [this.labelEnglish, this.labelNative]);

  final String tag;
  final String? labelEnglish;
  final String? labelNative;
}
