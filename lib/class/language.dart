import 'package:donation_app/shared/components/images.dart';

class Language {
  final int id;
  final String name;
  final String flag;
  final String languageCode;
  Language(this.id, this.name, this.flag, this.languageCode);

// add these operators, so could compare two Language instances
  @override
  bool operator ==(Object other) => other is Language && other.id == id;

  @override
  int get hashCode => id.hashCode;

  static List<Language> languageList() {
    return <Language>[
      Language(1, 'English', Images.us, 'EN'),
      Language(2, 'عربي', Images.egypt, 'AR'),
    ];
  }
}