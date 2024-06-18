import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_app/layout/user_app/cubit/states.dart';
import 'package:donation_app/layout/user_app/user_layou_screen.dart';
import 'package:donation_app/models/donor_model.dart';
import 'package:donation_app/models/user_model.dart';
import 'package:donation_app/modules/user_app/all_request/all_resquest_screen.dart';
import 'package:donation_app/modules/user_app/profile/profile_screen.dart';
import 'package:donation_app/modules/user_app/view_problem/view_problem_screen.dart';
import 'package:donation_app/shared/components/components.dart';
import 'package:donation_app/shared/network/cache_helper.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class UserLayoutCubit extends Cubit<UserLayoutStates> {
  UserLayoutCubit() : super(UserLayoutInitialState());

  static UserLayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<String> appBarNames = [
    'accept_request',
    'problem',
    'profile',
  ];

  List<Widget> Screens = [
    AllRequestScreen(),
    ViewProblemScreen(),
    ProfileScreen(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(UserBottomNavState());
  }

  late UserModel userModel;

  void getUserData() async {
    emit(GetUserDataLoadingState());
    await FirebaseFirestore.instance.collection('users').doc(CacheHelper.getData(key: 'uId')).get().then((value) {
      userModel = UserModel.formJson(value.data());
      getMyAcceptedRequestData();
      emit(GetUserDataSuccessState());
    }).catchError((error) {
      emit(GetUserDataErrorState(error));
    });
  }

  List<File> photos = [];
  var picker = ImagePicker();

  void pickImages() async {
    final pic = await picker.pickMultiImage(
      maxWidth: 250,
      maxHeight: 200,
    );
    if (pic.isNotEmpty) {
      pic.forEach((element) {
        photos.add(File(element.path));
      });
      emit(UpdatePhotoSuccessState());
    } else {
      emit(UpdatePhotoErrorState('No image selected'));
    }
  }

  void removeImage(int index) {
    photos.removeAt(index);
    emit(UpdateRemovePhotoSuccessState());
  }

  void updateProblem({required String descriptionOfProblemController, required String neededThingsToBeDonatedController, required BuildContext context}) async {
    emit(UpdateProblemLoadingState());
    var collection = FirebaseFirestore.instance.collection('users');
    collection.doc(CacheHelper.getData(key: 'uId')).update({
      'documents_image': [],
    });
    for (var element in photos) {
      await firebase_storage.FirebaseStorage.instance.ref().child("description/${Uri.file(element.path).pathSegments.last}").putFile(element).then((descriptionPhoto) {
        descriptionPhoto.ref.getDownloadURL().then((descriptionPhotoUrl) {
          var collection = FirebaseFirestore.instance.collection('users');
          collection.doc(CacheHelper.getData(key: 'uId')).update({
            'documents_image': FieldValue.arrayUnion([descriptionPhotoUrl]),
          }).then((_) {
            var collection = FirebaseFirestore.instance.collection('users');
            collection.doc(CacheHelper.getData(key: 'uId')).update({
              'description_of_problem': descriptionOfProblemController,
              'needed_things_to_be_donated': neededThingsToBeDonatedController,
            }).then((value) {
              getUserData();
              navigateAndFinish(context, UserLayoutScreen());
              emit(UpdateDescriptionSuccessState());
            });
          }).catchError((error) {});
        });
      });
    }
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
      emit(UpdateProfilePhotoSuccessState());
    } else {
      emit(UpdateProfilePhotoErrorState('No image selected'));
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
    var collection = FirebaseFirestore.instance.collection('users');
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
            getUserData();
            navigateAndFinish(context, const UserLayoutScreen());
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
        getUserData();
        navigateAndFinish(context, const UserLayoutScreen());
        emit(UpdateProfileSuccessState());
      });
    }
  }
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailAddressController = TextEditingController();
  var addressController = TextEditingController();
  var nationalityController = TextEditingController();
  var jopDescriptionController = TextEditingController();
  var genderController = TextEditingController();

  DonorModel? donorModel;
  void getMyAcceptedRequestData() async {
    emit(GetAcceptRequestDataLoadingState());
    await FirebaseFirestore.instance.collection('accepted_request').get().then((value) {
      value.docs.forEach((element) async{
        if(element.data()['user_id'] == userModel.uId){

          await FirebaseFirestore.instance.collection('donor').doc(element.data()['donor_id']).get().then((value) {
            donorModel = DonorModel.formJson(value.data());
            firstNameController.text = donorModel!.firstName!;
            lastNameController.text = donorModel!.lastName!;
            emailAddressController.text = donorModel!.emailAddress!;
            addressController.text = donorModel!.address!;
            nationalityController.text = donorModel!.nationality!;
            jopDescriptionController.text = donorModel!.jobDescription!;
            genderController.text = donorModel!.gender!;
            emit(GetAcceptRequestSuccessState());
          });

        }
      });
    }).catchError((error) {
      emit(GetAcceptRequesErrorState(error));
    });
  }
}
