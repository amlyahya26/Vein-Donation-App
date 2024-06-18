import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:donation_app/layout/donor_app/cubit/cubit.dart';
import 'package:donation_app/layout/donor_app/cubit/states.dart';
import 'package:donation_app/shared/style/colors.dart';
import 'package:donation_app/shared/style/widgets/custom_dialog.dart';
import 'package:donation_app/shared/style/widgets/custom_field.dart';
import 'package:donation_app/shared/style/widgets/elegant_notification.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DonorEditProfile extends StatelessWidget {
  final _donorFormKey = GlobalKey<FormState>();

  var donorFirstNameController = TextEditingController();
  var donorLastNameController = TextEditingController();
  var donorAddressController = TextEditingController();
  var donorNationalityController = TextEditingController();
  var donorJopDescriptionController = TextEditingController();
  var donorEmailController = TextEditingController();
  var donorNationalIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = DonorLayoutCubit.get(context);
    donorFirstNameController.text = cubit.donorModel.firstName!;
    donorLastNameController.text = cubit.donorModel.lastName!;
    donorAddressController.text = cubit.donorModel.address!;
    donorNationalityController.text = cubit.donorModel.nationality!;
    donorJopDescriptionController.text = cubit.donorModel.jobDescription!;
    donorEmailController.text = cubit.donorModel.emailAddress!;
    donorNationalIdController.text = cubit.donorModel.nationalIdResidencyId!;
    return BlocConsumer<DonorLayoutCubit, DonorLayoutStates>(
      listener: (context, states) {},
      builder: (context, states) {
        return Scaffold(
          body: Form(
            key: _donorFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView(
                    children: [
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
                            child: DonorLayoutCubit.get(context).donorModel.profileImage != null
                                ? CircleAvatar(
                                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                    radius: 50,
                                    backgroundImage: NetworkImage(DonorLayoutCubit.get(context).donorModel.profileImage!),
                                  )
                                : DonorLayoutCubit.get(context).profilePhoto != null
                                    ? CircleAvatar(
                                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                        radius: 50,
                                        backgroundImage: FileImage(DonorLayoutCubit.get(context).profilePhoto!),
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
                                    value: DonorLayoutCubit.get(context).selectedValue,
                                    onChanged: (newValue) {
                                      DonorLayoutCubit.get(context).changeGander(newValue!);
                                    },
                                    isDense: true,
                                    isExpanded: true,
                                    items: DonorLayoutCubit.get(context)
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
                        condition: states is! UpdateProfileLoadingState,
                        builder: (context) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: InkWell(
                            onTap: () {
                              if (_donorFormKey.currentState!.validate()) {
                                if (DonorLayoutCubit.get(context).selectedValue == 'select') {
                                  ToastMassage(context, 'please_choose_gender'.tr(), Status.error);
                                  return;
                                }
                                if (DonorLayoutCubit.get(context).profilePhoto == null) {
                                  DonorLayoutCubit.get(context).updateProfile(
                                    context: context,
                                    fName: donorFirstNameController.text,
                                    lName: donorLastNameController.text,
                                    nationality: donorNationalityController.text,
                                    nationalId: donorNationalIdController.text,
                                    address: donorAddressController.text,
                                    jobDescription: donorJopDescriptionController.text,
                                    gender: DonorLayoutCubit.get(context).selectedValue,
                                  );
                                }else{
                                  DonorLayoutCubit.get(context).updateProfile(
                                    context: context,
                                    isImage: true,
                                    fName: donorFirstNameController.text,
                                    lName: donorLastNameController.text,
                                    nationality: donorNationalityController.text,
                                    nationalId: donorNationalIdController.text,
                                    address: donorAddressController.text,
                                    jobDescription: donorJopDescriptionController.text,
                                    gender: DonorLayoutCubit.get(context).selectedValue,
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
                )
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
            DonorLayoutCubit.get(context).profilePic(false, context);
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
            DonorLayoutCubit.get(context).profilePic(true, context);
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
