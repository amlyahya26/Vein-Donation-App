import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_app/layout/admin_app/cubit/states.dart';
import 'package:donation_app/models/accept_request_model.dart';
import 'package:donation_app/models/donor_model.dart';
import 'package:donation_app/models/user_model.dart';
import 'package:donation_app/modules/auth/login/login.dart';
import 'package:donation_app/shared/components/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminLayoutCubit extends Cubit<AdminLayoutStates> {
  AdminLayoutCubit() : super(AdminLayoutInitialState());

  static AdminLayoutCubit get(context) => BlocProvider.of(context);
  List<UserModel> userModel = [];
  List<DonorModel> donorModel = [];

  void getAllUsers() async {
    userModel = [];
    donorModel = [];
    await FirebaseFirestore.instance.collection('users').get().then((value) async {
      value.docs.forEach((element) {
        userModel.add(UserModel.formJson(element.data()));
      });

      await FirebaseFirestore.instance.collection('donor').get().then((value) {
        value.docs.forEach((element) {
          donorModel.add(DonorModel.formJson(element.data()));
        });
      });

      emit(GetAllUsersSuccessState());
    }).catchError((error) {
      emit(GetAllUsersErrorState(error.toString()));
    });
  }

  void changeActiveUser(String uId) {
    var collection = FirebaseFirestore.instance.collection('users');
    collection.doc(uId).update({'is_active': '1'}).then((_) {
      print('Success');
      getAllUsers();
    }).catchError((error) => print('Failed: $error'));
  }

  void changeActiveDonor(String uId) {
    var collection = FirebaseFirestore.instance.collection('donor');
    collection.doc(uId).update({'is_active': '1'}).then((_) {
      print('Success');
      getAllUsers();
    }).catchError((error) => print('Failed: $error'));
  }

  void changeDisActiveUser(String uId) {
    var collection = FirebaseFirestore.instance.collection('users');
    collection.doc(uId).update({'is_active': '0'}).then((_) {
      print('Success');
      getAllUsers();
    }).catchError((error) => print('Failed: $error'));
  }

  List<AcceptRequestModel> acceptRequestModel = [];
  List<DonorModel> acceptedDonorRequestModel = [];
  void getAcceptedRequestData() async {
    emit(GetAcceptRequestDataLoadingState());
    await FirebaseFirestore.instance.collection('accepted_request').get().then((value) {
      value.docs.forEach((element) async{
        acceptRequestModel.add(AcceptRequestModel.fromJson(element.data()));
        await FirebaseFirestore.instance.collection('donor').doc(element.data()['donor_id']).get().then((value) {
          acceptedDonorRequestModel.add(DonorModel.formJson(value.data()));
          emit(GetAcceptRequestDataSuccessState());
        }).catchError((error) {
          emit(GetAcceptRequesErrorState(error));
        });
      });
      emit(GetAcceptRequestDataSuccessState());
    }).catchError((error) {
      emit(GetAcceptRequesErrorState(error));
    });
  }

  Future <void> signOut(BuildContext context)  async{
    await FirebaseAuth.instance.signOut();
    navigateAndFinish(context, LoginScreen());
    emit(SignOutSuccessState());
  }
}
