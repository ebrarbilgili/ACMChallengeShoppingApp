part of '../view/home_view.dart';

enum _StringPathEnum {
  WELCOME,
  NAME,
  SURNAME,
  FULL_NAME,
  CHAIR,
  ALL,
  SOFA,
  TABLE,
  LAMP,
  FURNITURE,
  SEARCH
}

extension HomeStringsExtension on _StringPathEnum {
  String get rawValue {
    switch (this) {
      case _StringPathEnum.WELCOME:
        return LocaleKeys.home_welcome;
      case _StringPathEnum.NAME:
        return 'Muhammed Ebrar';
      case _StringPathEnum.SURNAME:
        return 'Bilgili';
      case _StringPathEnum.FULL_NAME:
        return 'Muhammed Ebrar';
      case _StringPathEnum.CHAIR:
        return LocaleKeys.home_chair;
      case _StringPathEnum.ALL:
        return LocaleKeys.home_all;
      case _StringPathEnum.SOFA:
        return LocaleKeys.home_sofa;
      case _StringPathEnum.TABLE:
        return LocaleKeys.home_table;
      case _StringPathEnum.LAMP:
        return LocaleKeys.home_lamp;
      case _StringPathEnum.FURNITURE:
        return LocaleKeys.home_furniture;
      case _StringPathEnum.SEARCH:
        return LocaleKeys.home_search;

      default:
        throw Exception();
    }
  }
}
