import 'package:donation_app/class/language.dart';
import 'package:donation_app/shared/cubit/cubit.dart';
import 'package:flutter/material.dart';

class LanguageStyleCustom extends StatefulWidget {
  const LanguageStyleCustom({Key? key}) : super(key: key);

  @override
  State<LanguageStyleCustom> createState() => _LanguageStyleCustomState();
}

class _LanguageStyleCustomState extends State<LanguageStyleCustom> {
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);

    return  Container(
      // padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border.all(color: Colors.grey, style: BorderStyle.solid, width: 0.80),
      ),
      child: DropdownButton<Language>(
        dropdownColor: Theme.of(context).scaffoldBackgroundColor,
        underline: const SizedBox(),
        icon: Icon(Icons.keyboard_arrow_down_sharp,
          size: 20,
          color: Theme.of(context).textTheme.caption!.color,),
        borderRadius: BorderRadius.circular(10),
        // Must be one of items.value.
        value: cubit.setLanguage,
        onChanged: (Language? newValue) {
          if (newValue != null) {
            setState(() => cubit.setLanguage = newValue);
            if(newValue == Language.languageList()[0]){
              cubit.changeLng(context: context, isAr: true);
            }else{
              cubit.changeLng(context: context, isAr: false);
            }

          }
        },
        items: Language.languageList()
            .map<DropdownMenuItem<Language>>(
              (lang) => DropdownMenuItem(
            value: lang,
            child: Container(
              width: 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 105,
                  child: Row(
                    children: [
                      Text(
                       lang.name,
                        style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 12),
                      ),
                     const Spacer(),
                      Image.asset(
                        lang.flag,
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ).toList(),
      ),
    );
  }
}
