import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_app/layout/admin_app/layout_screen.dart';
import 'package:donation_app/layout/donor_app/donor_layout_screen.dart';
import 'package:donation_app/layout/user_app/user_layou_screen.dart';
import 'package:donation_app/modules/auth/login/cubit/states.dart';
import 'package:donation_app/shared/components/components.dart';
import 'package:donation_app/shared/network/cache_helper.dart';
import 'package:donation_app/shared/style/widgets/elegant_notification.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  IconData passwordToggleIcon = Icons.visibility;
  bool isVisible = true;

  void passwordToggle() {
    isVisible = !isVisible;
    if (isVisible) {
      passwordToggleIcon = Icons.visibility;
    } else {
      passwordToggleIcon = Icons.visibility_off;
    }
    emit(PasswordToggleStates());
  }

  void login({required String email, required String password, required BuildContext context, isDonor = false}) {
    if(isDonor) {
      emit(LoginLoadingState());
      print('is donner');
      FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) async {
        CacheHelper.saveData(key: 'uId', value: value.user!.uid);
        if (email == 'admin@admin.com' && password == 'adminadmin') {
          ToastMassage(context, 'thank_you_for_login'.tr(), Status.success);
          navigateAndFinish(context, LayoutAdminScreen());
        }else{
          await FirebaseFirestore.instance.collection('donor').doc(value.user!.uid).get().then((value) {
            if (value['is_active'] == '1') {
              ToastMassage(context, 'thank_you_for_login'.tr(), Status.success);
              navigateAndFinish(context, DonorLayoutScreen());
            } else {
              ToastMassage(context, 'dont_have_access_to_login'.tr(), Status.error);
            }
          });
        }
        emit(LoginSuccessState());
      }).catchError((error) {
        ToastMassage(context, error.toString(), Status.error);
        emit(LoginErrorState(error.toString()));
      });

    }else {
      emit(LoginLoadingState());
      FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) async {
        CacheHelper.saveData(key: 'uId', value: value.user!.uid);
        if (email == 'admin@admin.com' && password == 'adminadmin') {
          ToastMassage(context, 'thank_you_for_login'.tr(), Status.success);
          navigateAndFinish(context, LayoutAdminScreen());
        }else{
          await FirebaseFirestore.instance.collection('users').doc(value.user!.uid).get().then((value) {
            if (value['is_active'] == '1') {
              ToastMassage(context, 'thank_you_for_login'.tr(), Status.success);
              navigateAndFinish(context, UserLayoutScreen());
            } else {
              ToastMassage(context, 'dont_have_access_to_login'.tr(), Status.error);
            }
          });
        }
        emit(LoginSuccessState());
      }).catchError((error) {
        ToastMassage(context, error.toString(), Status.error);
        emit(LoginErrorState(error.toString()));
      });
    }
  }
}
