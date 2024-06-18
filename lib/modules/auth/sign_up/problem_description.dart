import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:donation_app/models/user_model.dart';
import 'package:donation_app/modules/auth/login/login.dart';
import 'package:donation_app/modules/auth/sign_up/cubit/cubit.dart';
import 'package:donation_app/modules/auth/sign_up/cubit/states.dart';
import 'package:donation_app/shared/components/components.dart';
import 'package:donation_app/shared/style/colors.dart';
import 'package:donation_app/shared/style/widgets/custom_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProblemDescription extends StatelessWidget {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var addressController = TextEditingController();
  var nationalityController = TextEditingController();
  var jopDescriptionController = TextEditingController();
  var nationalIdController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  String gender;

  var descriptionOfProblemController = TextEditingController();
  var neededThingsToBeDonatedController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  ProblemDescription(
      {required this.firstNameController,
      required this.lastNameController,
      required this.addressController,
      required this.nationalityController,
      required this.jopDescriptionController,
      required this.nationalIdController,
      required this.emailController,
      required this.passwordController,
      required this.gender,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpStates>(
      listener: (context, states) {
        if(states is UploadInfoAccountSuccessState){
          navigateAndFinish(context, LoginScreen());
        }
      },
      builder: (context, states) {
        return Scaffold(
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text('proof_Documents'.tr()),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      height: 100,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              SignUpCubit.get(context).pickImages();
                            },
                            child: Container(
                              height: 100,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(Icons.add),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Stack(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      // color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: FileImage(
                                          SignUpCubit.get(context).photos[index],
                                        ),
                                      ),
                                    ),
                                    // child: Image.file(SignUpCubit.get(context).photos[index], height: 80, width: 80,)
                                  ),
                                  Positioned(
                                    right: 10,
                                    top: 10,
                                    child: InkWell(
                                      onTap: () {
                                        SignUpCubit.get(context).removeImage(index);
                                      },
                                      child: const Icon(
                                        FontAwesomeIcons.x,
                                        size: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              separatorBuilder: (context, index) => const SizedBox(width: 5),
                              itemCount: SignUpCubit.get(context).photos.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomTextFormField(
                      labelText: 'description_of_problem',
                      hintText: 'hint_description_of_problem',
                      maxLines: 6,
                      style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey),
                      controller: descriptionOfProblemController,
                      prefix: Icons.description,
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
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomTextFormField(
                      labelText: 'needed_things_to_be_donated.',
                      hintText: 'hint_description_of_problem',
                      maxLines: 6,
                      style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey),
                      controller: neededThingsToBeDonatedController,
                      prefix: Icons.description,
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
                    height: 50,
                  ),
                  ConditionalBuilder(
                    condition: states is! SignUpLoadingState,
                    builder: (context) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            SignUpCubit.get(context).createAccount(
                              context: context,
                              address: addressController.text,
                              descriptionOfProblem: descriptionOfProblemController.text,
                              email: emailController.text,
                              fName: firstNameController.text,
                              gender: gender,
                              jopDescription: jopDescriptionController.text,
                              lName: lastNameController.text,
                              nationalId: nationalIdController.text,
                              nationality: nationalityController.text,
                              neededThingsToBeDonated: neededThingsToBeDonatedController.text,
                              password: passwordController.text,
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
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
