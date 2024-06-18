import 'package:donation_app/shared/style/colors.dart';
import 'package:flutter/material.dart';

ThemeData dark = ThemeData(
  // fontFamily: 'Noto Kufi Arabic',
  primaryColor: CustomColors.primaryColor,
  secondaryHeaderColor: CustomColors.secondaryColor,
  appBarTheme: AppBarTheme(color: CustomColors.primaryColor),
  // brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF2C2C2C),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  hintColor: const Color(0xFFE7F6F8),
  focusColor: const Color(0xFF939090),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
    primary: Colors.white,
    textStyle: const TextStyle(color: Colors.white),
  )),
  textTheme: const TextTheme(
    button: TextStyle(color: Colors.white),
    headline1: TextStyle(fontWeight: FontWeight.w300, fontSize: 14, color: Colors.white),
    headline2: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.white),
    headline3: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.white),
    headline4: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.white),
    headline5: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Colors.white),
    headline6: TextStyle(fontWeight: FontWeight.w800, fontSize: 14, color: Colors.white),
    caption: TextStyle(fontWeight: FontWeight.w900, fontSize: 14, color: Colors.white),
    subtitle1: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
    bodyText2: TextStyle(fontSize: 12.0, color: Colors.white),
    bodyText1: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, color: Colors.white),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xFF252525)),
);
