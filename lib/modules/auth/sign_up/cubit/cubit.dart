import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_app/models/donor_model.dart';
import 'package:donation_app/models/user_model.dart';
import 'package:donation_app/modules/auth/login/login.dart';
import 'package:donation_app/modules/auth/sign_up/cubit/states.dart';
import 'package:donation_app/shared/components/components.dart';
import 'package:donation_app/shared/style/widgets/elegant_notification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  static SignUpCubit get(context) => BlocProvider.of(context);

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

  final items = ['select', 'male', 'female'];
  String selectedValue = 'select';

  void changeGander(String newValue) {
    selectedValue = newValue;
    emit(GanderChangeStates());
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
      emit(UploadPhotoSuccessState());
    } else {
      emit(UploadPhotoErrorState('No image selected'));
    }
  }

  void removeImage(int index) {
    photos.removeAt(index);
    emit(RemovePhotoSuccessState());
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

  List<String> descriptionPhotosUrl = [];

  void createAccount({
    required BuildContext context,
    required String email,
    required String password,
    required String fName,
    required String lName,
    required String gender,
    required String address,
    required String nationality,
    required String jopDescription,
    required String nationalId,
    required String descriptionOfProblem,
    required String neededThingsToBeDonated,
    isDonor = false,
  }) {
    if (isDonor) {
      FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value) async {
        emit(CreateAccountSuccessState());
        emit(SignUpLoadingState());
        await firebase_storage.FirebaseStorage.instance.ref().child("users/${Uri.file(profilePhoto!.path).pathSegments.last}").putFile(profilePhoto!).then((profile) {
          profile.ref.getDownloadURL().then((profilePhoto) async {
            uploadDonorData(
                context: context,
                uId: value.user!.uid,
                email: email,
                fName: fName,
                lName: lName,
                gender: gender,
                address: address,
                nationality: nationality,
                jopDescription: jopDescription,
                nationalId: nationalId,
                profilePhoto: profilePhoto);
          });
        });
      }).catchError((error) {
        emit(CreateAccountErrorState(error.toString()));
      });
    } else {
      descriptionPhotosUrl = [];
      FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value) async {
        emit(CreateAccountSuccessState());
        emit(SignUpLoadingState());
        await firebase_storage.FirebaseStorage.instance.ref().child("users/${Uri.file(profilePhoto!.path).pathSegments.last}").putFile(profilePhoto!).then((profile) {
          profile.ref.getDownloadURL().then((profilePhoto) async {
            uploadUserData(
              context: context,
              uId: value.user!.uid,
              email: email,
              fName: fName,
              lName: lName,
              gender: gender,
              address: address,
              nationality: nationality,
              jopDescription: jopDescription,
              nationalId: nationalId,
              descriptionOfProblem: descriptionOfProblem,
              neededThingsToBeDonated: neededThingsToBeDonated,
              profilePhoto: profilePhoto,
              documentsImage: descriptionPhotosUrl,
            );
          });
        });
      }).catchError((error) {
        emit(CreateAccountErrorState(error.toString()));
      });
    }
  }

  void uploadDonorData({
    required BuildContext context,
    required String uId,
    required String email,
    required String fName,
    required String lName,
    required String gender,
    required String address,
    required String nationality,
    required String jopDescription,
    required String nationalId,
    required String profilePhoto,
  }) {
    DonorModel donorModel = DonorModel(
      profileImage: profilePhoto,
      firstName: fName,
      lastName: lName,
      emailAddress: email,
      gender: gender,
      address: address,
      nationality: nationality,
      jobDescription: jopDescription,
      nationalIdResidencyId: nationalId,
      uId: uId,
      isActive: '0',
    );
    FirebaseFirestore.instance.collection("donor").doc(uId).set(donorModel.toJson()).then((value) async {
      ToastMassage(context, 'thank you for for create account', Status.success);
      navigateAndFinish(context, LoginScreen());
      emit(UploadInfoAccountSuccessState());
    }).catchError((error) {
      emit(UploadInfoAccountErrorState(error.toString()));
    });
  }

  void uploadUserData({
    required BuildContext context,
    required String uId,
    required String email,
    required String fName,
    required String lName,
    required String gender,
    required String address,
    required String nationality,
    required String jopDescription,
    required String nationalId,
    required String descriptionOfProblem,
    required String neededThingsToBeDonated,
    required String profilePhoto,
    required List<String> documentsImage,
  }) {
    UserModel userModel = UserModel(
      profileImage: profilePhoto,
      documentsImage: documentsImage,
      firstName: fName,
      lastName: lName,
      emailAddress: email,
      gender: gender,
      address: address,
      nationality: nationality,
      jobDescription: jopDescription,
      nationalIdResidencyId: nationalId,
      descriptionOfProblem: descriptionOfProblem,
      neededThingsToBeDonated: neededThingsToBeDonated,
      uId: uId,
      isActive: '0',
    );
    FirebaseFirestore.instance.collection("users").doc(uId).set(userModel.toJson()).then((value) async {
      ToastMassage(context, 'thank you for for create account', Status.success);
      for (var element in photos) {
        await firebase_storage.FirebaseStorage.instance.ref().child("description/${Uri.file(element.path).pathSegments.last}").putFile(element).then((descriptionPhoto) {
          descriptionPhoto.ref.getDownloadURL().then((descriptionPhotoUrl) {
            var collection = FirebaseFirestore.instance.collection('users');
            collection.doc(uId).update({
              'documents_image': FieldValue.arrayUnion([descriptionPhotoUrl])
            }).then((_) {
              navigateAndFinish(context, LoginScreen());
            }).catchError((error) {});
          });
        });
      }
      emit(UploadInfoAccountSuccessState());
    }).catchError((error) {
      emit(UploadInfoAccountErrorState(error.toString()));
    });
  }
}
