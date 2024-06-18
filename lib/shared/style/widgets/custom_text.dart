import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String text;
  TextStyle? textStyle;


  CustomText({Key? key, required this.text,  this.textStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text.tr(), style: textStyle?? Theme.of(context).textTheme.bodyText1,);
  }
}
