import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:donation_app/modules/auth/sign_up/cubit/cubit.dart';
import 'package:donation_app/modules/auth/sign_up/cubit/states.dart';
import 'package:donation_app/modules/auth/sign_up/problem_description.dart';
import 'package:donation_app/shared/components/components.dart';
import 'package:donation_app/shared/components/images.dart';
import 'package:donation_app/shared/style/colors.dart';
import 'package:donation_app/shared/style/widgets/custom_dialog.dart';
import 'package:donation_app/shared/style/widgets/custom_field.dart';
import 'package:donation_app/shared/style/widgets/elegant_notification.dart';
import 'package:donation_app/shared/style/widgets/theme_mode/language.dart';
import 'package:donation_app/shared/style/widgets/theme_mode/theme_mode.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _donorFormKey = GlobalKey<FormState>();

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var addressController = TextEditingController();
  var nationalityController = TextEditingController();
  var jopDescriptionController = TextEditingController();
  var nationalIdController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var donorFirstNameController = TextEditingController();
  var donorLastNameController = TextEditingController();
  var donorAddressController = TextEditingController();
  var donorNationalityController = TextEditingController();
  var donorJopDescriptionController = TextEditingController();
  var donorEmailController = TextEditingController();
  var donorPasswordController = TextEditingController();
  var donorNationalIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpStates>(
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
                  Tab(
                      text: 'user'.tr(),
                      icon: const Icon(
                        FontAwesomeIcons.person,
                        size: 25,
                      )),
                  Tab(
                    text: 'donor'.tr(),
                    icon: Image.asset(
                      Images.donor,
                      width: 25,
                    ),
                  ),
                ],
                // indicatorSize: TabBarIndicatorSize.tab,
              ),
            ),
            body: TabBarView(
              children: [
                // User
                Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            Images.logo2,
                            width: 150,
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  'register_screen'.tr(),
                                  style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 25),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  'sign_up_slogan'.tr(),
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Center(
                                child: InkWell(
                                  onTap: () {
                                    customDialog(title: 'pick_image', body: pickProfileImage(context), context: context, buttonEnabled: false);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      // color: Theme.of(context).scaffoldBackgroundColor,
                                      shape: BoxShape.circle,
                                      boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey.shade400, spreadRadius: 1)],
                                    ),
                                    child: SignUpCubit.get(context).profilePhoto != null
                                        ? CircleAvatar(
                                            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                            radius: 50,
                                            backgroundImage: FileImage(SignUpCubit.get(context).profilePhoto!),
                                          )
                                        : CircleAvatar(
                                            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                            radius: 50,
                                            child: const Icon(FontAwesomeIcons.person),
                                          ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: CustomTextFormField(
                                        style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey),
                                        labelText: 'first_name',
                                        hintText: 'first_example',
                                        controller: firstNameController,
                                        prefix: Icons.person,
                                        context: context,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'required'.tr();
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: CustomTextFormField(
                                        style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey),
                                        labelText: 'last_name',
                                        hintText: 'last_example',
                                        controller: lastNameController,
                                        prefix: Icons.person,
                                        context: context,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'required'.tr();
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: CustomTextFormField(
                                  style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey),
                                  labelText: 'email',
                                  hintText: 'hint_email',
                                  controller: emailController,
                                  prefix: Icons.email,
                                  context: context,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'required'.tr();
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: CustomTextFormField(
                                  style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey),
                                  labelText: 'address',
                                  hintText: 'hint_address',
                                  controller: addressController,
                                  prefix: Icons.location_on_rounded,
                                  context: context,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'required'.tr();
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: CustomTextFormField(
                                  style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey),
                                  labelText: 'nationality',
                                  hintText: 'hint_nationality',
                                  controller: nationalityController,
                                  prefix: FontAwesomeIcons.earthAfrica,
                                  context: context,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'required'.tr();
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: CustomTextFormField(
                                  style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey),
                                  labelText: 'jop_description',
                                  hintText: 'hint_jop_description',
                                  controller: jopDescriptionController,
                                  prefix: FontAwesomeIcons.briefcase,
                                  context: context,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'required'.tr();
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: CustomTextFormField(
                                  style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey),
                                  labelText: 'national_id_residency_id',
                                  hintText: 'hint_national_id',
                                  controller: nationalIdController,
                                  prefix: FontAwesomeIcons.idCard,
                                  context: context,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'required'.tr();
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: CustomTextFormField(
                                  style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey),
                                  labelText: 'password',
                                  hintText: 'hint_password',
                                  obscureText: SignUpCubit.get(context).isVisible,
                                  controller: passwordController,
                                  prefix: Icons.lock,
                                  suffix: SignUpCubit.get(context).passwordToggleIcon,
                                  context: context,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'required'.tr();
                                    }
                                    return null;
                                  },
                                  suffixPress: () {
                                    SignUpCubit.get(context).passwordToggle();
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'gender'.tr(),
                                        style: Theme.of(context).textTheme.caption!.copyWith(fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                          child: DropdownButton<String>(
                                            value: SignUpCubit.get(context).selectedValue,
                                            onChanged: (newValue) {
                                              SignUpCubit.get(context).changeGander(newValue!);
                                            },
                                            isDense: true,
                                            isExpanded: true,
                                            items: SignUpCubit.get(context)
                                                .items
                                                .map<DropdownMenuItem<String>>(
                                                  (String value) => DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Text(value.tr()),
                                                  ),
                                                )
                                                .toList(),
                                            icon: Icon(
                                              Icons.arrow_drop_down,
                                              color: Theme.of(context).textTheme.caption!.color,
                                            ),
                                            iconSize: 42,
                                            style: Theme.of(context).textTheme.caption,
                                            underline: const SizedBox(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: InkWell(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      if (SignUpCubit.get(context).selectedValue == 'select') {
                                        ToastMassage(context, 'please_choose_gender'.tr(), Status.error);
                                        return;
                                      }
                                      if (SignUpCubit.get(context).profilePhoto == null) {
                                        ToastMassage(context, 'profile_picture_required'.tr(), Status.error);
                                        return;
                                      }
                                      navigateTo(
                                        context,
                                        ProblemDescription(
                                          firstNameController: firstNameController,
                                          lastNameController: lastNameController,
                                          addressController: addressController,
                                          emailController: emailController,
                                          jopDescriptionController: jopDescriptionController,
                                          nationalIdController: nationalIdController,
                                          nationalityController: nationalityController,
                                          passwordController: passwordController,
                                          gender: SignUpCubit.get(context).selectedValue,
                                        ),
                                      );
                                    }
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(color: CustomColors.secondaryColor, borderRadius: BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text(
                                        'continue'.tr(),
                                        style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //Donor
                Container(
                  child: Form(
                    key: _donorFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            Images.logo2,
                            width: 150,
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  'register_screen'.tr(),
                                  style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 25),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  'sign_up_slogan'.tr(),
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Center(
                                child: InkWell(
                                  onTap: () {
                                    customDialog(title: 'pick_image', body: pickProfileImage(context), context: context, buttonEnabled: false);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      // color: Theme.of(context).scaffoldBackgroundColor,
                                      shape: BoxShape.circle,
                                      boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey.shade400, spreadRadius: 1)],
                                    ),
                                    child: SignUpCubit.get(context).profilePhoto != null
                                        ? CircleAvatar(
                                            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                            radius: 50,
                                            backgroundImage: FileImage(SignUpCubit.get(context).profilePhoto!),
                                          )
                                        : CircleAvatar(
                                            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                            radius: 50,
                                            child: const Icon(FontAwesomeIcons.person),
                                          ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: CustomTextFormField(
                                        style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey),
                                        labelText: 'first_name',
                                        hintText: 'first_example',
                                        controller: donorFirstNameController,
                                        prefix: Icons.person,
                                        context: context,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'required'.tr();
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: CustomTextFormField(
                                        style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey),
                                        labelText: 'last_name',
                                        hintText: 'last_example',
                                        controller: donorLastNameController,
                                        prefix: Icons.person,
                                        context: context,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'required'.tr();
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: CustomTextFormField(
                                  style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey),
                                  labelText: 'email',
                                  hintText: 'hint_email',
                                  controller: donorEmailController,
                                  prefix: Icons.email,
                                  context: context,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'required'.tr();
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: CustomTextFormField(
                                  style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey),
                                  labelText: 'password',
                                  hintText: 'hint_password',
                                  obscureText: SignUpCubit.get(context).isVisible,
                                  controller: donorPasswordController,
                                  prefix: Icons.lock,
                                  suffix: SignUpCubit.get(context).passwordToggleIcon,
                                  context: context,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'required'.tr();
                                    }
                                    return null;
                                  },
                                  suffixPress: () {
                                    SignUpCubit.get(context).passwordToggle();
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: CustomTextFormField(
                                  style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey),
                                  labelText: 'address',
                                  hintText: 'hint_address',
                                  controller: donorAddressController,
                                  prefix: Icons.location_on_rounded,
                                  context: context,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'required'.tr();
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: CustomTextFormField(
                                  style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey),
                                  labelText: 'jop_description',
                                  hintText: 'hint_jop_description',
                                  controller: donorJopDescriptionController,
                                  prefix: FontAwesomeIcons.briefcase,
                                  context: context,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'required'.tr();
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: CustomTextFormField(
                                  style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey),
                                  labelText: 'national_id_residency_id',
                                  hintText: 'hint_national_id',
                                  controller: donorNationalIdController,
                                  prefix: FontAwesomeIcons.idCard,
                                  context: context,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'required'.tr();
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: CustomTextFormField(
                                  style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey),
                                  labelText: 'nationality',
                                  hintText: 'hint_nationality',
                                  controller: donorNationalityController,
                                  prefix: FontAwesomeIcons.earthAfrica,
                                  context: context,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'required'.tr();
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'gender'.tr(),
                                        style: Theme.of(context).textTheme.caption!.copyWith(fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                          child: DropdownButton<String>(
                                            value: SignUpCubit.get(context).selectedValue,
                                            onChanged: (newValue) {
                                              SignUpCubit.get(context).changeGander(newValue!);
                                            },
                                            isDense: true,
                                            isExpanded: true,
                                            items: SignUpCubit.get(context)
                                                .items
                                                .map<DropdownMenuItem<String>>(
                                                  (String value) => DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Text(value.tr()),
                                                  ),
                                                )
                                                .toList(),
                                            icon: Icon(
                                              Icons.arrow_drop_down,
                                              color: Theme.of(context).textTheme.caption!.color,
                                            ),
                                            iconSize: 42,
                                            style: Theme.of(context).textTheme.caption,
                                            underline: const SizedBox(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              ConditionalBuilder(
                                condition: states is! SignUpLoadingState,
                                builder: (context) => Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: InkWell(
                                    onTap: () {
                                      if (_donorFormKey.currentState!.validate()) {
                                        if (SignUpCubit.get(context).selectedValue == 'select') {
                                          ToastMassage(context, 'please_choose_gender'.tr(), Status.error);
                                          return;
                                        }
                                        if (SignUpCubit.get(context).profilePhoto == null) {
                                          ToastMassage(context, 'profile_picture_required'.tr(), Status.error);
                                          return;
                                        }

                                        SignUpCubit.get(context).createAccount(
                                          context: context,
                                          address: donorAddressController.text,
                                          descriptionOfProblem: '',
                                          email: donorEmailController.text,
                                          fName: donorFirstNameController.text,
                                          gender: SignUpCubit.get(context).selectedValue,
                                          jopDescription: donorJopDescriptionController.text,
                                          lName: donorLastNameController.text,
                                          nationalId: donorNationalIdController.text,
                                          nationality: donorNationalityController.text,
                                          neededThingsToBeDonated: '',
                                          password: donorPasswordController.text,
                                          isDonor: true,
                                        );
                                      }
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 50,
                                      decoration: BoxDecoration(color: CustomColors.secondaryColor, borderRadius: BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(
                                          'sign_up'.tr(),
                                          style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                fallback: (context) => const Center(child: CircularProgressIndicator()),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget pickProfileImage(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            SignUpCubit.get(context).profilePic(false, context);
          },
          leading: Text('open_gallery'.tr()),
          trailing: Icon(
            FontAwesomeIcons.image,
            color: Theme.of(context).textTheme.caption!.color,
          ),
          contentPadding: const EdgeInsets.all(0),
        ),
        Divider(color: Theme.of(context).textTheme.caption!.color!.withOpacity(0.5), thickness: 1, height: 0, endIndent: 50, indent: 50),
        ListTile(
          onTap: () {
            SignUpCubit.get(context).profilePic(true, context);
          },
          leading: Text('open_camera'.tr()),
          trailing: Icon(
            FontAwesomeIcons.camera,
            color: Theme.of(context).textTheme.caption!.color,
          ),
          contentPadding: const EdgeInsets.all(0),
        ),
        Divider(color: Theme.of(context).textTheme.caption!.color!.withOpacity(0.5), thickness: 1, height: 0, endIndent: 50, indent: 50),
      ],
    );
  }
}
