import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:donation_app/modules/auth/login/cubit/cubit.dart';
import 'package:donation_app/modules/auth/login/cubit/states.dart';
import 'package:donation_app/modules/auth/sign_up/sign_up_screen.dart';
import 'package:donation_app/shared/components/components.dart';
import 'package:donation_app/shared/components/images.dart';
import 'package:donation_app/shared/style/colors.dart';
import 'package:donation_app/shared/style/widgets/custom_field.dart';
import 'package:donation_app/shared/style/widgets/language_style.dart';
import 'package:donation_app/shared/style/widgets/theme_mode/language.dart';
import 'package:donation_app/shared/style/widgets/theme_mode/theme_mode.dart';
import 'package:donation_app/shared/style/widgets/theme_mode_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var donorEmailController = TextEditingController();
  var donorPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // emailController.text = 'ridgerimon34@gmail.com';
    // passwordController.text = '123456789';
    donorEmailController.text = 'ridgerimo22@gmail.com';
    donorPasswordController.text = '123456789';
    emailController.text = 'admin@admin.com';
    passwordController.text = 'adminadmin';
    return BlocProvider(
      create: (BuildContext context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, states) {},
        builder: (context, states) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                title: Row(
                  children: const [
                    LanguageStyleCustom(),
                    SizedBox(
                      width: 10,
                    ),
                    ThemeModeCustom(),
                  ],
                ),
                bottom: TabBar(
                  tabs: [
                    Tab(text: 'user'.tr(), icon: const Icon(FontAwesomeIcons.person, size: 25,)),
                    Tab(text: 'donor'.tr(), icon: Image.asset(
                      Images.donor,
                      width: 25,
                    ),),
                  ],
                  // indicatorSize: TabBarIndicatorSize.tab,
                ),
              ),
              body: TabBarView(
                children: [
                  // User
                  Container(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.asset(
                              Images.logo2,
                              width: 250,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'login'.tr(),
                              style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 25),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'login_slogan'.tr(),
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: CustomTextFormField(
                              labelText: 'email',
                              hintText: 'hint_email',
                              style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey),
                              controller: emailController,
                              prefix: Icons.email,
                              context: context,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: CustomTextFormField(
                              labelText: 'password',
                              hintText: 'hint_password',
                              obscureText: AuthCubit.get(context).isVisible,
                              controller: passwordController,
                              style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey),
                              prefix: Icons.lock,
                              suffix: AuthCubit.get(context).passwordToggleIcon,
                              context: context,
                              suffixPress: () {
                                AuthCubit.get(context).passwordToggle();
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Text('not_have_account'.tr()),
                                const SizedBox(width: 5),
                                TextButton(
                                  child: Text(
                                    'register'.tr(),
                                    style: Theme.of(context).textTheme.caption!.copyWith(color: CustomColors.secondaryColor),
                                  ),
                                  onPressed: () {
                                    // showDialog(
                                    //     context: context,
                                    //     builder: (BuildContext context) {
                                    //       return AlertDialog(
                                    //         backgroundColor: Colors.transparent,
                                    //         content: signUpDialog(context),
                                    //       );
                                    //     });
                                    navigateTo(context, SignUpScreen());
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ConditionalBuilder(
                            condition: states is! LoginLoadingState,
                            builder: (context) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: InkWell(
                                onTap: () {
                                  AuthCubit.get(context).login(email: emailController.text, password: passwordController.text, context: context);
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 50,
                                  decoration: BoxDecoration(color: CustomColors.secondaryColor, borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      'login'.tr(),
                                      style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            fallback: (context) => const Center(child: CircularProgressIndicator()),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Donor
                  Container(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.asset(
                              Images.logo2,
                              width: 250,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'login'.tr(),
                              style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 25),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'login_slogan'.tr(),
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: CustomTextFormField(
                              labelText: 'email',
                              hintText: 'hint_email',
                              style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey),

                              controller: donorEmailController,
                              prefix: Icons.email,
                              context: context,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: CustomTextFormField(
                              labelText: 'password',
                              hintText: 'hint_password',
                              obscureText: AuthCubit.get(context).isVisible,
                              controller: donorPasswordController,
                              prefix: Icons.lock,
                              style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey),
                              suffix: AuthCubit.get(context).passwordToggleIcon,
                              context: context,
                              suffixPress: () {
                                AuthCubit.get(context).passwordToggle();
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Text('not_have_account'.tr()),
                                const SizedBox(width: 5),
                                TextButton(
                                  child: Text(
                                    'register'.tr(),
                                    style: Theme.of(context).textTheme.caption!.copyWith(color: CustomColors.secondaryColor),
                                  ),
                                  onPressed: () {
                                    // showDialog(
                                    //     context: context,
                                    //     builder: (BuildContext context) {
                                    //       return AlertDialog(
                                    //         backgroundColor: Colors.transparent,
                                    //         content: signUpDialog(context),
                                    //       );
                                    //     });
                                    navigateTo(context, SignUpScreen());
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ConditionalBuilder(
                            condition: states is! DonorLoginLoadingState,
                            builder: (context) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: InkWell(
                                onTap: () {
                                  AuthCubit.get(context).login(email: donorEmailController.text, password: donorPasswordController.text, context: context, isDonor: true);
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 50,
                                  decoration: BoxDecoration(color: CustomColors.secondaryColor, borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      'login'.tr(),
                                      style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            fallback: (context) => const Center(child: CircularProgressIndicator()),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

// Widget signUpDialog(BuildContext context) {
//   return Container(
//     height: 550,
//     width: 300,
//     decoration: BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor, borderRadius: BorderRadius.circular(10)),
//     child: Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CustomText(
//             text: 'sign_up',
//             textStyle: Theme.of(context).textTheme.caption,
//           ),
//           const SizedBox(
//             height: 25,
//           ),
//           Center(
//             child: Container(
//               height: 230,
//               width: 200,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     spreadRadius: 5,
//                     blurRadius: 7,
//                     offset: const Offset(0, 3), // changes position of shadow
//                   ),
//                 ],
//               ),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Image.asset(
//                       Images.donor,
//                       width: 150,
//                     ),
//                   ),
//                   CustomText(
//                     text: 'donor',
//                     textStyle: Theme.of(context).textTheme.caption,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 25,
//           ),
//           Center(
//             child: InkWell(
//               onTap: () {
//                 Navigator.pop(context);
//                 navigateTo(context, SignUpScreen());
//               },
//               child: Container(
//                 height: 230,
//                 width: 200,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 5,
//                       blurRadius: 7,
//                       offset: const Offset(0, 3), // changes position of shadow
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Image.asset(
//                         Images.user,
//                         width: 150,
//                       ),
//                     ),
//                     CustomText(
//                       text: 'user',
//                       textStyle: Theme.of(context).textTheme.caption,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
}
