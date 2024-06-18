import 'package:donation_app/layout/user_app/cubit/cubit.dart';
import 'package:donation_app/layout/user_app/cubit/states.dart';
import 'package:donation_app/shared/style/widgets/custom_field.dart';
import 'package:donation_app/shared/style/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllRequestScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var cubit = UserLayoutCubit.get(context);
    return BlocConsumer<UserLayoutCubit, UserLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: cubit.donorModel != null ? Column(
              children: [
                const SizedBox(height: 25,),
                CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(cubit.donorModel!.profileImage!),
                ),
                const SizedBox(height: 10,),
                Text("${cubit.donorModel!.firstName!} ${cubit.donorModel!.lastName!}"),
                Text(cubit.donorModel!.emailAddress!),
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
                          controller: cubit.firstNameController,
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
                          controller: cubit.lastNameController,
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
                          controller: cubit.emailAddressController,
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
                          controller: cubit.addressController,
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
                          controller: cubit.nationalityController,
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
                          controller: cubit.jopDescriptionController,
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
                          controller: cubit.genderController,
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
                //       navigateTo(context, ProblemViewScreen(donorModel!));
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
            ) : SizedBox(),
          ),
        );
      },
    );
  }
}
