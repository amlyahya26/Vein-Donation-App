import 'package:donation_app/class/theme_mode.dart';
import 'package:donation_app/shared/cubit/cubit.dart';
import 'package:donation_app/shared/cubit/states.dart';
import 'package:donation_app/shared/network/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeModeStyle extends StatefulWidget {
  const ThemeModeStyle({Key? key}) : super(key: key);

  @override
  State<ThemeModeStyle> createState() => _ThemeModeStyleState();
}

class _ThemeModeStyleState extends State<ThemeModeStyle> {
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, states) {},
      builder: (context, states) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(color: Colors.grey, style: BorderStyle.solid, width: 0.80),
          ),
          child: DropdownButton<ThemeModeClass>(
            dropdownColor: Theme.of(context).scaffoldBackgroundColor,
            underline: SizedBox(),
            icon: Icon(
              Icons.keyboard_arrow_down_sharp,
              color: Theme.of(context).textTheme.caption!.color,
            ),
            borderRadius: BorderRadius.circular(10),
            value: cubit.themeModeClass,
            onChanged: (ThemeModeClass? newValue) {
              setState(() => cubit.themeModeClass = newValue);
              CacheHelper.saveData(key: 'theme', value: newValue!.id);
              if (newValue == ThemeModeClass.themeModeClassList()[0]) {
                cubit.themeToggle(isLight: true);
              } else {
                cubit.themeToggle(isLight: false);
              }
            },
            items: ThemeModeClass.themeModeClassList()
                .map<DropdownMenuItem<ThemeModeClass>>(
                  (theme) => DropdownMenuItem(
                    value: theme,
                    child: Container(
                      width: 130,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 105,
                          child: Row(
                            children: [
                              Text(
                                theme.name,
                                style: Theme.of(context).textTheme.caption!,
                              ),
                              Spacer(),
                              Icon(
                                theme.icon,
                                size: 30,
                              ),
                              // Image.asset(
                              //   theme.flag,
                              //   width: 30,
                              //   height: 30,
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
