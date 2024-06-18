import 'package:donation_app/layout/donor_app/cubit/cubit.dart';
import 'package:donation_app/models/user_model.dart';
import 'package:donation_app/modules/donor_app/all_request/problem_view_screen.dart';
import 'package:donation_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AllRequestScreen extends StatelessWidget {
  const AllRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: ListView.separated(
                    itemBuilder: (context, index) => userItem(context, DonorLayoutCubit.get(context).userModel[index]),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: DonorLayoutCubit.get(context).userModel.length),
              )),
        ],
      ),
    );
  }

  Widget userItem(BuildContext context, UserModel userModel) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(color: userModel.isActive == '0' ? Colors.red : Colors.green, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(userModel.profileImage!),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${userModel.firstName!} ${userModel.lastName!}",
                  style: Theme.of(context).textTheme.caption!,
                ),
                Text(
                  userModel.emailAddress!,
                  style: Theme.of(context).textTheme.bodyText1!,
                ),
              ],
            ),
            const Spacer(),
            InkWell(
                onTap: () {
                  navigateTo(context, ProblemDonorViewScreen(userModel));
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
