import '../../../layout/admin_app/cubit/cubit.dart' show AdminLayoutCubit;
import 'package:donation_app/models/accept_request_model.dart';
import 'package:donation_app/models/donor_model.dart';
import 'package:donation_app/models/user_model.dart';
import 'package:donation_app/shared/style/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AcceptedRequestsScreen extends StatelessWidget {
  const AcceptedRequestsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'accept_request',
          textStyle: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: ListView.separated(
                    itemBuilder: (context, index) => userItem(context, AdminLayoutCubit.get(context).acceptedDonorRequestModel[index], AdminLayoutCubit.get(context).acceptRequestModel[index]),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: AdminLayoutCubit.get(context).acceptRequestModel.length),
              )),
        ],
      ),
    );
  }

  Widget userItem(BuildContext context, DonorModel donorModel, AcceptRequestModel requestModel) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(requestModel.documentsImage![0]),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  requestModel.descriptionOfProblem!,
                  style: Theme.of(context).textTheme.caption!,
                ),
                Text(
                  "${donorModel.firstName!} ${donorModel.lastName!}",
                  style: Theme.of(context).textTheme.bodyText1!,
                ),
              ],
            ),
            const Spacer(),
            InkWell(
                onTap: () {

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
