import 'package:donation_app/layout/admin_app/cubit/cubit.dart';
import 'package:donation_app/models/user_model.dart';
import 'package:donation_app/modules/admin_app/problem_view/problem_view_screen.dart';
import 'package:donation_app/shared/components/components.dart';
import 'package:donation_app/shared/style/colors.dart';
import 'package:donation_app/shared/style/widgets/custom_field.dart';
import 'package:donation_app/shared/style/widgets/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ViewUserInfoScreen extends StatelessWidget {
  ViewUserInfoScreen(this.userModel, {Key? key}) : super(key: key);

  UserModel userModel;

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailAddressController = TextEditingController();
  var addressController = TextEditingController();
  var nationalityController = TextEditingController();
  var jopDescriptionController = TextEditingController();
  var genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    firstNameController.text = userModel.firstName!;
    lastNameController.text = userModel.lastName!;
    emailAddressController.text = userModel.emailAddress!;
    addressController.text = userModel.address!;
    nationalityController.text = userModel.nationality!;
    jopDescriptionController.text = userModel.jobDescription!;
    genderController.text = userModel.gender!;
    return Scaffold(
      appBar: AppBar(
        title: Text("${userModel.firstName!} ${userModel.lastName!}"),
        actions: [
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
                onTap: (){
                  if(userModel.isActive == '0'){
                    AdminLayoutCubit.get(context).changeActiveUser(userModel.uId!);
                  }else{
                    AdminLayoutCubit.get(context).changeDisActiveUser(userModel.uId!);
                  }
                },
                child: Icon(userModel.isActive == '1' ? FontAwesomeIcons.x : FontAwesomeIcons.check)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25,),
            CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(userModel.profileImage!),
            ),
            const SizedBox(height: 10,),
            Text("${userModel.firstName!} ${userModel.lastName!}"),
            Text(userModel.emailAddress!),
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
                  navigateTo(context, ProblemViewScreen(userModel));
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(color: CustomColors.secondaryColor, borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'view_problem'.tr(),
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
