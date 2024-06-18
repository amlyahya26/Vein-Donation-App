import 'package:donation_app/layout/donor_app/cubit/cubit.dart';
import 'package:donation_app/models/request_model.dart';
import 'package:donation_app/models/user_model.dart';
import 'package:donation_app/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AcceptedProblemsScreen extends StatelessWidget {
  const AcceptedProblemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: ListView.separated(
                    itemBuilder: (context, index) => requestItem(context, index, DonorLayoutCubit.get(context).myRequestModel[index]),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: DonorLayoutCubit.get(context).myRequestModel.length),
              )),
        ],
      ),
    );
  }
  Widget requestItem(BuildContext context, int index,RequestModel requestModel) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(color: CustomColors.thirdColor, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
             backgroundColor: CustomColors.primaryColor,
             child: Text('$index', style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white),),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  requestModel.descriptionOfProblem,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.caption!,
                ),
                Text(
                  requestModel.neededThingsToBeDonated,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyText1!,
                ),
              ],
            ),
            const Spacer(),
            InkWell(
                onTap: () {
                  // navigateTo(context, ProblemDonorViewScreen(userModel));
                },
                child: const Icon(
                  FontAwesomeIcons.circleInfo,
                )),
          ],
        ),
      ),
    );
  }
}
