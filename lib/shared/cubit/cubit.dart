import 'dart:convert';
import 'dart:io';

import 'package:donation_app/class/language.dart';
import 'package:donation_app/class/theme_mode.dart';
import 'package:donation_app/shared/cubit/states.dart';
import 'package:donation_app/shared/style/theme/dark_theme.dart';
import 'package:donation_app/shared/style/theme/light_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool switchThemeValue = true;
  bool switchLngValue = true;
  Language? setLanguage;
  ThemeModeClass? themeModeClass;

  bool saveCheckedValue = true;
  String lng = 'en';
  late ThemeData themeData = light;
  IconData theme = Icons.sunny;

  void startAppSetup(BuildContext context, int themeId) async {
    if (context.locale.languageCode == 'en') {
      switchLngValue = true;
      setLanguage = Language.languageList()[0];
    } else {
      switchLngValue = false;
      setLanguage = Language.languageList()[1];
    }
    if (themeId == 0) {
      themeModeClass = ThemeModeClass.themeModeClassList()[0];
      themeData = light;
      theme = Icons.sunny;
    } else if (themeId == 1) {
      themeModeClass = ThemeModeClass.themeModeClassList()[1];
      themeData = dark;
      theme = Icons.dark_mode;
    } else {
      themeModeClass = ThemeModeClass.themeModeClassList()[0];
      themeData = light;
      theme = Icons.sunny;
    }

    print(themeId);
  }

  void themeToggle({required bool isLight}) {
    isLight ? themeData = light : themeData = dark;
    isLight ? theme = Icons.sunny : theme = Icons.dark_mode;
    switchThemeValue = isLight;
    emit(ThemeToggle());
  }

  void changeLng({required bool isAr, required BuildContext context}) {
    if (isAr) {
      context.setLocale(context.supportedLocales[1]);
    } else {
      context.setLocale(context.supportedLocales[0]);
    }
    switchLngValue = isAr;
    emit(LangToggle());
  }
}
