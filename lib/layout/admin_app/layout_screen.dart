import 'package:donation_app/layout/admin_app/cubit/cubit.dart';
import 'package:donation_app/layout/admin_app/cubit/states.dart';
import 'package:donation_app/modules/admin_app/view_user_info/view_user_info_screen.dart';
import 'package:donation_app/shared/components/components.dart';
import 'package:donation_app/shared/style/widgets/admin_drawer.dart';
import 'package:donation_app/shared/style/widgets/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../models/user_model.dart';

class LayoutAdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminLayoutCubit, AdminLayoutStates>(
      listener: (context, states) {},
      builder: (context, states) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
              appBar: AppBar(
                title: CustomText(
                  text: 'user',
                  textStyle: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white),
                ),
                bottom: TabBar(
                  onTap: (tabIndex) {},
                  tabs: [
                    Tab(text: 'all'.tr(), icon: const Icon(FontAwesomeIcons.borderAll)),
                    Tab(text: 'accepted'.tr(), icon: const Icon(FontAwesomeIcons.check)),
                    Tab(text: 'pending'.tr(), icon: const Icon(FontAwesomeIcons.x)),
                  ],
                  // indicatorSize: TabBarIndicatorSize.tab,
                ),
              ),
              drawer: AdminDrawer(),
              body: TabBarView(
                children: [
                  Container(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        AdminLayoutCubit.get(context).getAllUsers();
                      },
                      child: Column(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            child: ListView.separated(
                                itemBuilder: (context, index) => userItem(context, AdminLayoutCubit.get(context).userModel[index]),
                                separatorBuilder: (context, index) => const Divider(),
                                itemCount: AdminLayoutCubit.get(context).userModel.length),
                          )),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        AdminLayoutCubit.get(context).getAllUsers();
                      },
                      child: Column(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            child: ListView.separated(
                                itemBuilder: (context, index) =>
                                    AdminLayoutCubit.get(context).userModel[index].isActive == '1' ? userItem(context, AdminLayoutCubit.get(context).userModel[index]) : const SizedBox(),
                                separatorBuilder: (context, index) => const Divider(),
                                itemCount: AdminLayoutCubit.get(context).userModel.length),
                          )),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        AdminLayoutCubit.get(context).getAllUsers();
                      },
                      child: Column(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            child: ListView.separated(
                                itemBuilder: (context, index) =>
                                    AdminLayoutCubit.get(context).userModel[index].isActive == '0' ? userItem(context, AdminLayoutCubit.get(context).userModel[index]) : const SizedBox(),
                                separatorBuilder: (context, index) => const Divider(),
                                itemCount: AdminLayoutCubit.get(context).userModel.length),
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          ),
        );
      },
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
                  navigateTo(context, ViewUserInfoScreen(userModel));
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
