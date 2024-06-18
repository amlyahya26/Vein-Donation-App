import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:donation_app/layout/admin_app/cubit/cubit.dart';
import 'package:donation_app/layout/donor_app/cubit/cubit.dart';
import 'package:donation_app/layout/donor_app/cubit/states.dart';
import 'package:donation_app/models/user_model.dart';
import 'package:donation_app/shared/style/colors.dart';
import 'package:donation_app/shared/style/widgets/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProblemDonorViewScreen extends StatelessWidget {
  UserModel userModel;

  ProblemDonorViewScreen(this.userModel);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DonorLayoutCubit, DonorLayoutStates>(
      listener: (context, states){},
      builder: (context, states){
        return Scaffold(
          appBar: AppBar(
            title: Text("${userModel.firstName!} ${userModel.lastName!}"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
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
                                      content: imageView(userModel.documentsImage[index]),
                                    );
                                  });
                            },
                            child: Image.network(
                              userModel.documentsImage[index],
                              width: 150,
                            ),
                          ),
                          separatorBuilder: (context, index) => const SizedBox(width: 25),
                          itemCount: userModel.documentsImage.length),
                    ),
                  ),
                  const SizedBox(height: 50,),
                  CustomText(text: 'description_of_problem', textStyle: Theme.of(context).textTheme.caption,),
                  const SizedBox(height: 15,),
                  Text(userModel.descriptionOfProblem!),
                  const SizedBox(height: 25,),
                  CustomText(text: 'needed_things_to_be_donated', textStyle: Theme.of(context).textTheme.caption,),
                  const SizedBox(height: 15,),
                  Text(userModel.neededThingsToBeDonated!),
                  SizedBox(height: 50,),
                  ConditionalBuilder(
                    condition: states is! AcceptLoadingState,
                    builder: (context) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: InkWell(
                        onTap: () {
                          DonorLayoutCubit.get(context).acceptRequest(userModel);
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(color: CustomColors.primaryColor, borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              'accept'.tr(),
                              style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    fallback: (context) => const Center(child: CircularProgressIndicator()),
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
