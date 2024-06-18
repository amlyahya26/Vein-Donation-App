import 'package:donation_app/shared/style/colors.dart';
import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  // fontFamily: 'Noto Kufi Arabic',
  primaryColor: CustomColors.primaryColor,
  secondaryHeaderColor: CustomColors.secondaryColor,
  primaryColorDark: Colors.black,
  scaffoldBackgroundColor: Colors.white,
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(color: CustomColors.primaryColor),
  iconTheme: const IconThemeData(
    color: Color(0xFF252525),
  ),
  focusColor: Colors.grey[200],
  hintColor: const Color(0xFF52575C),
  textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(
    primary: Colors.black, textStyle: const TextStyle(color: Colors.black),
  )),
  textTheme: const TextTheme(
    button: TextStyle(color: Colors.white),

    headline1: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
    headline2: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
    headline3: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
    headline4: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
    headline5: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
    headline6: TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
    caption: TextStyle(fontWeight: FontWeight.w900, fontSize: 14, color: Colors.black),
    subtitle1: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
    bodyText2: TextStyle(fontSize: 12.0, color: Colors.black),
    bodyText1: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
  ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
);