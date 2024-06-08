import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:services_repo/blocs/main/main_bloc.dart';
import 'package:services_repo/data/repositories/register_repo.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(this.registerRepository, this.mainBloc)
      : super(RegisterInitial()) {
    on<RegisterEmailAndPasswordEvent>(_onRegisterEmailAndPasswordEvent);
    on<UploadImage>(_onUploadImage);
  }

  RegisterRepository registerRepository;

  bool hiddenPassword = true;

  MainBloc mainBloc;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController postelCodeController = TextEditingController();
  TextEditingController passwordCodeController = TextEditingController();
  File? profileImage;
  var profileImageName = "";
  var picker = ImagePicker();

  void _onRegisterEmailAndPasswordEvent(
    RegisterEmailAndPasswordEvent event,
    Emitter emit,
  ) async {
    emit(RegisterStartProcessLoadingState());
    try {
      String image = "";
      if (profileImage != null) {
        image = await authGetImageUrl("test", profileImageName, profileImage!);
      }
      mainBloc.userInfoModel = await registerRepository.register(
        email: emailController.text,
        password: passwordCodeController.text,
        image: image,
        postelCode: num.parse(postelCodeController.text),
        name: nameController.text,
        phoneNumber: phoneNumberController.text,
      );
      emit(RegisterStartProcessSuccessState());
    } catch (e) {
      print('ERRROOOORRRR ${e.toString()}');
      emit(RegisterStartProcessFailState());
    }
  }

  Future<void> _onUploadImage(UploadImage event, Emitter emit) async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        profileImage = File(pickedFile.path);
        profileImageName = pickedFile.name;
        emit(RegisterUploadImageSuccessState());
      } else {
        print('No Image Selected');
        emit(RegisterUploadImageFailState());
      }
    } catch (e) {
      print('Error in _onStudentPickProfileImage ::: ${e.toString()}');
    }
  }

  Future<String> authGetImageUrl(
    String dirName,
    String imageName,
    File image,
  ) async {
    try {
      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDirImages = referenceRoot.child(dirName);
      Reference referenceImageToUpload = referenceDirImages.child(imageName);
      await referenceImageToUpload.putFile(File(image.path));
      var imageUrl = await referenceImageToUpload.getDownloadURL();
      return imageUrl;
    } catch (e) {
      throw Exception(
          'Error in authRegistrationGetImageUrl ::: ${e.toString()}');
    }
  }
}
