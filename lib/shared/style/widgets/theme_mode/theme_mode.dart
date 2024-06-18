import 'package:donation_app/class/theme_mode.dart';
import 'package:donation_app/shared/cubit/cubit.dart';
import 'package:donation_app/shared/cubit/states.dart';
import 'package:donation_app/shared/network/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeModeCustom extends StatefulWidget {
  const ThemeModeCustom({Key? key}) : super(key: key);

  @override
  State<ThemeModeCustom> createState() => _ThemeModeCustomState();
}

class _ThemeModeCustomState extends State<ThemeModeCustom> {
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, states) {},
      builder: (context, states) {
        return Container(
          // padding: EdgeInsets.symmetric(horizontal: 10.0),
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
              size: 20,
              color: Theme.of(context).textTheme.caption!.color,
            ),
            // borderRadius: BorderRadius.circular(10),
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
            items: ThemeModeClass.themeModeClassList().map<DropdownMenuItem<ThemeModeClass>>(
                  (theme) => DropdownMenuItem(
                value: theme,
                child: Container(
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 105,
                      child: Row(
                        children: [
                          Text(
                            theme.name,
                            style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 12),
                          ),
                          Spacer(),
                          Icon(
                            theme.icon,
                            size: 20,
                          ),
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
