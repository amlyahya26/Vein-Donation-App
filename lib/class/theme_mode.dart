import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ThemeModeClass {
  final int id;
  final String name;
  final IconData icon;
  ThemeModeClass(this.id, this.name, this.icon);

// add these operators, so could compare two ThemeModeClass instances
  @override
  bool operator ==(Object other) => other is ThemeModeClass && other.id == id;

  @override
  int get hashCode => id.hashCode;

  static List<ThemeModeClass> themeModeClassList() {
    return <ThemeModeClass>[
      ThemeModeClass(2, 'light_mood'.tr(), Icons.sunny),
      ThemeModeClass(1, 'dark_mood'.tr(), Icons.dark_mode),
    ];
  }
}