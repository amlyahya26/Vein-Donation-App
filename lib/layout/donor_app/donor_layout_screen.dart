import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:donation_app/layout/donor_app/cubit/cubit.dart';
import 'package:donation_app/layout/donor_app/cubit/states.dart';
import 'package:donation_app/shared/cubit/cubit.dart';
import 'package:donation_app/shared/style/colors.dart';
import 'package:donation_app/shared/style/theme/dark_theme.dart';
import 'package:donation_app/shared/style/widgets/custom_text.dart';
import 'package:donation_app/shared/style/widgets/donor_drawer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DonorLayoutScreen extends StatelessWidget {
  const DonorLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = DonorLayoutCubit.get(context);
    return BlocConsumer<DonorLayoutCubit, DonorLayoutStates>(
      listener: (context, states) {},
      builder: (context, states) {
        return ConditionalBuilder(
          condition: states is! GetDonorDataLoadingState,
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: CustomText(
                text: cubit.appBarNames[cubit.currentIndex],
                textStyle: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white),
              ),
            ),
            drawer: DonorDrawer(cubit.donorModel),
            body: cubit.Screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              unselectedItemColor: AppCubit.get(context).themeData == dark ? Colors.grey.shade600 : Colors.black,
              selectedItemColor: AppCubit.get(context).themeData == dark ? Colors.white : CustomColors.primaryColor,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(FontAwesomeIcons.check),
                  label: 'all_request'.tr(),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(FontAwesomeIcons.personBreastfeeding),
                  label: 'accepted_requests'.tr(),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(FontAwesomeIcons.person),
                  label: 'profile'.tr(),
                ),
              ],
            ),
          ),
          fallback: (context) => const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
