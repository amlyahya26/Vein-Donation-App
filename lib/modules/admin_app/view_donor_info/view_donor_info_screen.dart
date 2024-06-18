import 'package:donation_app/layout/admin_app/cubit/cubit.dart';
import 'package:donation_app/models/donor_model.dart';
import 'package:donation_app/models/user_model.dart';
import 'package:donation_app/modules/admin_app/problem_view/problem_view_screen.dart';
import 'package:donation_app/shared/components/components.dart';
import 'package:donation_app/shared/style/colors.dart';
import 'package:donation_app/shared/style/widgets/custom_field.dart';
import 'package:donation_app/shared/style/widgets/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ViewDonorInfoScreen extends StatelessWidget {
  ViewDonorInfoScreen(this.donorModel, {Key? key}) : super(key: key);

  DonorModel donorModel;

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailAddressController = TextEditingController();
  var addressController = TextEditingController();
  var nationalityController = TextEditingController();
  var jopDescriptionController = TextEditingController();
  var genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    firstNameController.text = donorModel.firstName!;
    lastNameController.text = donorModel.lastName!;
    emailAddressController.text = donorModel.emailAddress!;
    addressController.text = donorModel.address!;
    nationalityController.text = donorModel.nationality!;
    jopDescriptionController.text = donorModel.jobDescription!;
    genderController.text = donorModel.gender!;
    return Scaffold(
      appBar: AppBar(
        title: Text("${donorModel.firstName!} ${donorModel.lastName!}"),
        actions: [
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
                onTap: (){
                  if(donorModel.isActive == '0'){
                    AdminLayoutCubit.get(context).changeActiveDonor(donorModel.uId!);
                  }else{
                    AdminLayoutCubit.get(context).changeActiveDonor(donorModel.uId!);
                  }
                },
                child: Icon(donorModel.isActive == '1' ? FontAwesomeIcons.x : FontAwesomeIcons.check)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25,),
            CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(donorModel.profileImage!),
            ),
            const SizedBox(height: 10,),
            Text("${donorModel.firstName!} ${donorModel.lastName!}"),
            Text(donorModel.emailAddress!),
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
            // const SizedBox(height: 35,),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: InkWell(
            //     onTap: (){
            //       navigateTo(context, ProblemViewScreen(donorModel));
            //     },
            //     child: Container(
            //       width: double.infinity,
            //       height: 50,
            //       decoration: BoxDecoration(color: CustomColors.secondaryColor, borderRadius: BorderRadius.circular(10)),
            //       child: Center(
            //         child: Text(
            //           'view_problem'.tr(),
            //           style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
