import 'package:donation_app/layout/admin_app/cubit/cubit.dart';
import 'package:donation_app/layout/admin_app/layout_screen.dart';
import 'package:donation_app/layout/donor_app/cubit/cubit.dart';
import 'package:donation_app/models/donor_model.dart';
import 'package:donation_app/models/user_model.dart';
import 'package:donation_app/modules/admin_app/accepted_requests/accepted_requests_screen.dart';
import 'package:donation_app/modules/admin_app/donor/donor_view_screen.dart';
import 'package:donation_app/modules/auth/login/login.dart';
import 'package:donation_app/shared/components/components.dart';
import 'package:donation_app/shared/style/colors.dart';
import 'package:donation_app/shared/style/widgets/custom_text.dart';
import 'package:donation_app/shared/style/widgets/theme_mode/language.dart';
import 'package:donation_app/shared/style/widgets/theme_mode/theme_mode.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DonorDrawer extends StatelessWidget {
  DonorDrawer(this.donorModel, {Key? key}) : super(key: key);

  DonorModel donorModel;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(color: CustomColors.primaryColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(donorModel.profileImage!),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: '${donorModel.firstName} ${donorModel.lastName}',
                  textStyle: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  donorModel.emailAddress!,
                  style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: const [
                LanguageStyleCustom(),
                SizedBox(
                  width: 10,
                ),
                ThemeModeCustom(),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ListTile(
            onTap: ()async{
              await DonorLayoutCubit.get(context).signOut(context);
            },
            title: CustomText(text: 'sign_out',),
            leading: Icon(FontAwesomeIcons.signOut, color: Theme.of(context).textTheme.caption!.color,),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //   child: Row(
          //     children: const [
          //       LanguageStyleCustom(),
          //       SizedBox(
          //         width: 10,
          //       ),
          //       ThemeModeCustom(),
          //     ],
          //   ),
          // ),
          // const SizedBox(height: 25,),
          // ListTile(
          //   onTap: (){
          //     navigateTo(context, DonorViewScreen());
          //   },
          //   title: CustomText(text: 'donor',),
          //   leading: Icon(FontAwesomeIcons.moneyCheck, color: Theme.of(context).textTheme.caption!.color,),
          // ),
          // SizedBox(height: 20,),
          // ListTile(
          //   onTap: (){
          //     navigateTo(context, LayoutAdminScreen());
          //   },
          //   title: CustomText(text: 'user',),
          //   leading: Icon(FontAwesomeIcons.person, color: Theme.of(context).textTheme.caption!.color,),
          // ),
          // SizedBox(height: 20,),
          // ListTile(
          //   onTap: (){
          //     navigateTo(context, AcceptedRequestsScreen());
          //   },
          //   title: CustomText(text: 'accept_request',),
          //   leading: Icon(FontAwesomeIcons.check, color: Theme.of(context).textTheme.caption!.color,),
          // ),
          // ListTile(
          //   onTap: ()async{
          //     await AdminLayoutCubit.get(context).signOut(context);
          //   },
          //   title: CustomText(text: 'sign_out',),
          //   leading: Icon(FontAwesomeIcons.signOut, color: Theme.of(context).textTheme.caption!.color,),
          // ),
        ],
      ),
    );
  }
}
