import 'package:donation_app/layout/user_app/cubit/cubit.dart';
import 'package:donation_app/modules/user_app/view_problem/edit_problem_screen.dart';
import 'package:donation_app/shared/components/components.dart';
import 'package:donation_app/shared/style/colors.dart';
import 'package:donation_app/shared/style/widgets/custom_field.dart';
import 'package:donation_app/shared/style/widgets/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ViewProblemScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  var descriptionOfProblemController = TextEditingController();
  var neededThingsToBeDonatedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    descriptionOfProblemController.text = UserLayoutCubit.get(context).userModel.descriptionOfProblem!;
    neededThingsToBeDonatedController.text = UserLayoutCubit.get(context).userModel.neededThingsToBeDonated!;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
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
                  height: 200,
                  child: Hero(
                    tag: 'imageHero',
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                        content: imageView(UserLayoutCubit.get(context).userModel.documentsImage[index]),
                                      );
                                    });
                              },
                              child: Image.network(
                                UserLayoutCubit.get(context).userModel.documentsImage[index],
                                width: 150,
                              ),
                            ),
                        separatorBuilder: (context, index) => const SizedBox(width: 25),
                        itemCount: UserLayoutCubit.get(context).userModel.documentsImage.length),
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
                  enabled: false,
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
                  enabled: false,
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
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: (){
                    navigateTo(context, EditProblemScreen());
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: CustomColors.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: CustomText(
                        text: 'edit',
                        textStyle: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget imageView(String image) {
    return Hero(
      tag: 'imageHero',
      child: Image.network(
        image,
        height: 500,
        fit: BoxFit.cover,
      ),
    );
  }
}
