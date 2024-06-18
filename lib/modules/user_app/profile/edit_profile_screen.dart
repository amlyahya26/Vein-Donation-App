import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:donation_app/layout/user_app/cubit/cubit.dart';
import 'package:donation_app/layout/user_app/cubit/states.dart';
import 'package:donation_app/shared/style/colors.dart';
import 'package:donation_app/shared/style/widgets/custom_dialog.dart';
import 'package:donation_app/shared/style/widgets/custom_field.dart';
import 'package:donation_app/shared/style/widgets/custom_text.dart';
import 'package:donation_app/shared/style/widgets/elegant_notification.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditProfileScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var addressController = TextEditingController();
  var nationalityController = TextEditingController();
  var jopDescriptionController = TextEditingController();
  var nationalIdController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = UserLayoutCubit.get(context);
    firstNameController.text = cubit.userModel.firstName!;
    lastNameController.text = cubit.userModel.lastName!;
    emailController.text = cubit.userModel.emailAddress!;
    addressController.text = cubit.userModel.address!;
    nationalityController.text = cubit.userModel.nationality!;
    jopDescriptionController.text = cubit.userModel.jobDescription!;
    nationalIdController.text = cubit.userModel.nationalIdResidencyId!;
    // genderController.text = cubit.userModel.gender!;
    return BlocConsumer<UserLayoutCubit, UserLayoutStates>(
      listener: (context, states) {},
      builder: (context, states) {
        return Scaffold(
          appBar: AppBar(
            title: CustomText(
              text: 'edit',
              textStyle: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white),
            ),
          ),
          body: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 20,
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
                            child: UserLayoutCubit.get(context).userModel.profileImage != null
                                ? CircleAvatar(
                                    radius: 50,
                                    backgroundImage: NetworkImage(cubit.userModel.profileImage!),
                                  )
                                : UserLayoutCubit.get(context).profilePhoto != null
                                    ? CircleAvatar(
                                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                        radius: 50,
                                        backgroundImage: FileImage(UserLayoutCubit.get(context).profilePhoto!),
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
                          enabled: false,
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
                                    value: UserLayoutCubit.get(context).selectedValue,
                                    onChanged: (newValue) {
                                      UserLayoutCubit.get(context).changeGander(newValue!);
                                    },
                                    isDense: true,
                                    isExpanded: true,
                                    items: UserLayoutCubit.get(context)
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
                        condition: states is! UpdateProblemLoadingState,
                        builder: (context) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: InkWell(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                if (UserLayoutCubit.get(context).selectedValue == 'select') {
                                  ToastMassage(context, 'please_choose_gender'.tr(), Status.error);
                                  return;
                                }
                                if (UserLayoutCubit.get(context).profilePhoto == null) {
                                  UserLayoutCubit.get(context).updateProfile(
                                    context: context,
                                    fName: firstNameController.text,
                                    lName: lastNameController.text,
                                    nationality: nationalityController.text,
                                    nationalId: nationalIdController.text,
                                    address: addressController.text,
                                    jobDescription: jopDescriptionController.text,
                                    gender: UserLayoutCubit.get(context).selectedValue,
                                  );
                                } else {
                                  UserLayoutCubit.get(context).updateProfile(
                                    context: context,
                                    isImage: true,
                                    fName: firstNameController.text,
                                    lName: lastNameController.text,
                                    nationality: nationalityController.text,
                                    nationalId: nationalIdController.text,
                                    address: addressController.text,
                                    jobDescription: jopDescriptionController.text,
                                    gender: UserLayoutCubit.get(context).selectedValue,
                                  );
                                }
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(color: CustomColors.secondaryColor, borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  'done'.tr(),
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
            UserLayoutCubit.get(context).profilePic(false, context);
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
            UserLayoutCubit.get(context).profilePic(true, context);
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
