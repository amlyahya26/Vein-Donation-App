import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:donation_app/layout/user_app/cubit/cubit.dart';
import 'package:donation_app/layout/user_app/cubit/states.dart';
import 'package:donation_app/shared/style/colors.dart';
import 'package:donation_app/shared/style/widgets/custom_field.dart';
import 'package:donation_app/shared/style/widgets/custom_text.dart';
import 'package:donation_app/shared/style/widgets/elegant_notification.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditProblemScreen extends StatelessWidget {
  var descriptionOfProblemController = TextEditingController();
  var neededThingsToBeDonatedController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
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
                              UserLayoutCubit.get(context).pickImages();
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
                                          UserLayoutCubit.get(context).photos[index],
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
                                        UserLayoutCubit.get(context).removeImage(index);
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
                              itemCount: UserLayoutCubit.get(context).photos.length,
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
                    condition: states is! UpdateProblemLoadingState,
                    builder: (context) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            if(UserLayoutCubit.get(context).photos.isNotEmpty){
                              UserLayoutCubit.get(context).updateProblem(
                                descriptionOfProblemController: descriptionOfProblemController.text,
                                neededThingsToBeDonatedController: neededThingsToBeDonatedController.text,
                                context: context,
                              );
                            }else{
                              ToastMassage(context, 'please_enter_images'.tr(), Status.error);
                            }
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(color: CustomColors.primaryColor, borderRadius: BorderRadius.circular(10)),
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
