import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_app/layout/donor_app/cubit/states.dart';
import 'package:donation_app/layout/donor_app/donor_layout_screen.dart';
import 'package:donation_app/models/donor_model.dart';
import 'package:donation_app/models/request_model.dart';
import 'package:donation_app/models/user_model.dart';
import 'package:donation_app/modules/auth/login/login.dart';
import 'package:donation_app/modules/donor_app/accepted_problems/accted_problem_screen.dart';
import 'package:donation_app/modules/donor_app/profile/profile_screen.dart';
import 'package:donation_app/shared/components/components.dart';
import 'package:donation_app/shared/network/cache_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../../modules/donor_app/all_request/all_resquest_screen.dart';

class DonorLayoutCubit extends Cubit<DonorLayoutStates> {
  DonorLayoutCubit() : super(DonorLayoutInitialState());

  static DonorLayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<String> appBarNames = [
    'all_request',
    'accepted_requests',
    'profile',
  ];

  List<Widget> Screens = [
    AllRequestScreen(),
    AcceptedProblemsScreen(),
    ProfileScreen(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(DonorBottomNavState());
  }

  late DonorModel donorModel;

  void getDonorData()async {
    emit(GetDonorDataLoadingState());
    await FirebaseFirestore.instance.collection('donor').doc(CacheHelper.getData(key: 'uId')).get().then((value) {
      donorModel = DonorModel.formJson(value.data());
      emit(GetDonorDataSuccessState());
    }).catchError((error) {
      emit(GetDonorDataErrorState(error));
    });
  }

  List<UserModel> userModel = [];

  void getAllUsers() async {
    userModel = [];
    await FirebaseFirestore.instance.collection('users').get().then((value) async {
      value.docs.forEach((element) {
        userModel.add(UserModel.formJson(element.data()));
      });
      emit(GetAllUsersSuccessState());
    }).catchError((error) {
      emit(GetAllUsersErrorState(error.toString()));
    });
  }

  void acceptRequest(UserModel userModel)async{
    emit(AcceptLoadingState());
    var uuid = Uuid().v4();
    await FirebaseFirestore.instance.collection("accepted_request").doc(uuid).set({
      'user_id': userModel.uId,
      'donor_id': donorModel.uId,
      'request_id': uuid,
      'documents_image': userModel.documentsImage,
      'description_of_problem': userModel.descriptionOfProblem,
      'needed_things_to_be_donated': userModel.descriptionOfProblem,
    }).then((value) {
      emit(AcceptRequestSuccessState());
    }).catchError((error){
      emit(AcceptRequestErrorState(error.toString()));
    });
  }
  List<RequestModel> requestModel = [];
  List<RequestModel> myRequestModel = [];

  void getMyRequests() async {
    requestModel = [];
    await FirebaseFirestore.instance.collection('accepted_request').get().then((value) async {
      value.docs.forEach((element) {
        requestModel.add(RequestModel.formJson(element.data()));
        if(element.data()['donor_id'] == donorModel.uId){
          myRequestModel.add(RequestModel.formJson(element.data()));
        }
      });
      emit(GetAllRequestsSuccessState());
    }).catchError((error) {
      emit(GetAllRequestsErrorState(error.toString()));
    });
  }

  File? profilePhoto;
  var pickerProfile = ImagePicker();

  Future<void> profilePic(bool isCamera, BuildContext context) async {
    final profilePic;
    if (isCamera) {
      profilePic = await pickerProfile.pickImage(
        source: ImageSource.camera,
      );
    } else {
      profilePic = await pickerProfile.pickImage(
        source: ImageSource.gallery,
      );
    }

    if (profilePic != null) {
      profilePhoto = File(profilePic.path);
      Navigator.pop(context);
      emit(UploadProfilePhotoSuccessState());
    } else {
      emit(UploadProfilePhotoErrorState('No image selected'));
    }
  }

  final items = ['select', 'male', 'female'];
  String selectedValue = 'select';

  void changeGander(String newValue) {
    selectedValue = newValue;
    emit(GanderChangeStates());
  }

  void updateProfile({
    bool isImage = false,
    required BuildContext context,
    required String fName,
    required String lName,
    required String address,
    required String nationality,
    required String jobDescription,
    required String nationalId,
    required String gender,
  }) async{
    emit(UpdateProfileLoadingState());
    var collection = FirebaseFirestore.instance.collection('donor');
    if(isImage) {
      await firebase_storage.FirebaseStorage.instance.ref().child("users/${Uri.file(profilePhoto!.path).pathSegments.last}").putFile(profilePhoto!).then((profile) {
        profile.ref.getDownloadURL().then((profileValue) {
          collection.doc(CacheHelper.getData(key: 'uId')).update({
            'first_name': fName,
            'last_name': lName,
            'address': address,
            'nationality': nationality,
            'job_description': jobDescription,
            'national_id_residency_iD': nationalId,
            'gender': gender,
            'profile_image' : profileValue,
          }).then((value) {
            getDonorData();
            navigateAndFinish(context, const DonorLayoutScreen());
            emit(UpdateProfileSuccessState());
          });
        });
      });
    }else{
      collection.doc(CacheHelper.getData(key: 'uId')).update({
        'first_name': fName,
        'last_name': lName,
        'address': address,
        'nationality': nationality,
        'job_description': jobDescription,
        'national_id_residency_iD': nationalId,
        'gender': gender,
      }).then((value) {
        getDonorData();
        navigateAndFinish(context, const DonorLayoutScreen());
        emit(UpdateProfileSuccessState());
      });
    }
  }




  Future <void> signOut(BuildContext context)  async{
    await FirebaseAuth.instance.signOut();
    navigateAndFinish(context, LoginScreen());
    emit(SignOutSuccessState());
  }
}
