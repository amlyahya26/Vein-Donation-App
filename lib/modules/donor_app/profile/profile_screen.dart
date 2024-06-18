import 'package:donation_app/layout/donor_app/cubit/cubit.dart';
import 'package:donation_app/modules/donor_app/profile/edit_profile.dart';
import 'package:donation_app/shared/components/components.dart';
import 'package:donation_app/shared/style/colors.dart';
import 'package:donation_app/shared/style/widgets/custom_field.dart';
import 'package:donation_app/shared/style/widgets/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  final _donorFormKey = GlobalKey<FormState>();

  var donorFirstNameController = TextEditingController();
  var donorLastNameController = TextEditingController();
  var donorAddressController = TextEditingController();
  var donorNationalityController = TextEditingController();
  var donorJopDescriptionController = TextEditingController();
  var donorEmailController = TextEditingController();
  var donorNationalIdController = TextEditingController();
  var genderController = TextEditingController();

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
    genderController.text = cubit.donorModel.gender!;
    return Scaffold(
      body: Form(
        key: _donorFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(height: 25,),
                  Center(
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(DonorLayoutCubit.get(context).donorModel.profileImage!),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        SizedBox(
                            width: 100,
                            child: CustomText(text: 'first_name')),
                        const SizedBox(width: 15,),
                        Expanded(
                          child: CustomTextFormField(
                            // labelText: 'first_name',
                            // hintText: 'first_name',
                            style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey),
                            enabled: false,
                            inputDecoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            controller: donorFirstNameController,
                            // prefix: Icons.email,
                            context: context,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        SizedBox(
                            width: 100,
                            child: CustomText(text: 'last_name')),
                        const SizedBox(width: 15,),
                        Expanded(
                          child: CustomTextFormField(
                            // labelText: 'first_name',
                            // hintText: 'first_name',
                            style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey),
                            enabled: false,
                            inputDecoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            controller: donorLastNameController,
                            // prefix: Icons.email,
                            context: context,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        SizedBox(
                            width: 100,
                            child: CustomText(text: 'email')),
                        const SizedBox(width: 15,),
                        Expanded(
                          child: CustomTextFormField(
                            enabled: false,
                            // labelText: 'first_name',
                            // hintText: 'first_name',
                            style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey),
                            inputDecoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            controller: donorEmailController,
                            // prefix: Icons.email,
                            context: context,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        SizedBox(
                            width: 100,
                            child: CustomText(text: 'address')),
                        const SizedBox(width: 15,),
                        Expanded(
                          child: CustomTextFormField(
                            // labelText: 'first_name',
                            // hintText: 'first_name',
                            style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey),
                            enabled: false,
                            inputDecoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            controller: donorAddressController,
                            // prefix: Icons.email,
                            context: context,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        SizedBox(
                            width: 100,
                            child: CustomText(text: 'jop_description')),
                        const SizedBox(width: 15,),
                        Expanded(
                          child: CustomTextFormField(
                            // labelText: 'first_name',
                            // hintText: 'first_name',
                            style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey),
                            enabled: false,
                            inputDecoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            controller: donorJopDescriptionController,
                            // prefix: Icons.email,
                            context: context,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        SizedBox(
                            width: 100,
                            child: CustomText(text: 'national_id_residency_id')),
                        const SizedBox(width: 15,),
                        Expanded(
                          child: CustomTextFormField(
                            enabled: false,
                            inputDecoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
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
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        SizedBox(
                            width: 100,
                            child: CustomText(text: 'nationality')),
                        const SizedBox(width: 15,),
                        Expanded(
                          child: CustomTextFormField(
                            // labelText: 'first_name',
                            // hintText: 'first_name',
                            style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey),
                            enabled: false,
                            inputDecoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            controller: donorNationalityController,
                            // prefix: Icons.email,
                            context: context,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        SizedBox(
                            width: 100,
                            child: CustomText(text: 'gender')),
                        const SizedBox(width: 15,),
                        Expanded(
                          child: CustomTextFormField(
                            // labelText: 'first_name',
                            // hintText: 'first_name',
                            style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey),
                            enabled: false,
                            inputDecoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            controller: genderController,
                            // prefix: Icons.email,
                            context: context,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 35,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: InkWell(
                      onTap: (){
                        navigateTo(context, DonorEditProfile());
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(color: CustomColors.primaryColor, borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            'edit'.tr(),
                            style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
