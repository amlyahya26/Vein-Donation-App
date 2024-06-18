import 'package:donation_app/layout/user_app/cubit/cubit.dart';
import 'package:donation_app/modules/user_app/profile/edit_profile_screen.dart';
import 'package:donation_app/shared/components/components.dart';
import 'package:donation_app/shared/style/colors.dart';
import 'package:donation_app/shared/style/widgets/custom_field.dart';
import 'package:donation_app/shared/style/widgets/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailAddressController = TextEditingController();
  var addressController = TextEditingController();
  var nationalityController = TextEditingController();
  var jopDescriptionController = TextEditingController();
  var genderController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var cubit = UserLayoutCubit.get(context);
    firstNameController.text = cubit.userModel.firstName!;
    lastNameController.text = cubit.userModel.lastName!;
    emailAddressController.text = cubit.userModel.emailAddress!;
    addressController.text = cubit.userModel.address!;
    nationalityController.text = cubit.userModel.nationality!;
    jopDescriptionController.text = cubit.userModel.jobDescription!;
    genderController.text = cubit.userModel.gender!;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25,),
            CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(cubit.userModel.profileImage!),
            ),
            const SizedBox(height: 10,),
            Text("${cubit.userModel.firstName!} ${cubit.userModel.lastName!}"),
            Text(cubit.userModel.emailAddress!),
            const SizedBox(height: 40,),
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
                      controller: firstNameController,
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
                      controller: lastNameController,
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
                      controller: emailAddressController,
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
                      controller: addressController,
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
                      controller: nationalityController,
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
                      controller: jopDescriptionController,
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
                  navigateTo(context, EditProfileScreen());
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
      ),
    );
  }
}
