import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:services_repo/blocs/main/main_bloc.dart';
import 'package:services_repo/data/models/companies_model.dart';
import 'package:services_repo/data/models/home_service_category.dart';
import 'package:services_repo/data/models/orderModel.dart';
import 'package:services_repo/view/common_widgets/show_toast.dart';

part 'home_services_section_event.dart';
part 'home_services_section_state.dart';

class HomeServicesSectionBloc
    extends Bloc<HomeServicesSectionEvent, HomeServicesSectionState> {
  HomeServicesSectionBloc(this.mainBloc) : super(HomeServicesSectionInitial()) {
    on<GetAllServices>(_onGetAllServices);
    on<GetAllCompaniesByCategoryId>(_onGetAllCompaniesByCategoryId);
    on<UploadImage>(_onUploadImage);
    on<SelectTimeEvent>(_onSelectTimeEvent);
    on<SelectDateEvent>(_onSelectDateEvent);
    on<SendRequest>(_onSendRequest);
    on<GetAllRequests>(_onGetAllRequests);
  }

  List<HomeServiceCategoryModel> categories = [];
  List<CompaniesModel> companies = [];

  CompaniesModel? selectedCompany;
  HomeServiceCategoryModel? homeServiceSelected;

  TextEditingController infoController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  DateTime? dateTime;
  TimeOfDay? timeOfDay;

  MainBloc mainBloc;
  File? profileImage;
  var profileImageName = "";
  var picker = ImagePicker();
  List<OrderModel> ordersModel = [];

  void _onGetAllServices(
    GetAllServices event,
    Emitter emit,
  ) async {
    var homeServices =
        await FirebaseFirestore.instance.collection('home_categories').get();
    for (var e in homeServices.docs) {
      var services = await FirebaseFirestore.instance
          .collection('home_categories')
          .doc(
            e.id,
          )
          .collection("services")
          .get();
      categories.add(
          HomeServiceCategoryModel.fromJson(e.data(), e.id, services.docs));
    }

    print('the Categoriddkdk ${categories}');
  }

  void _onGetAllCompaniesByCategoryId(
    GetAllCompaniesByCategoryId event,
    Emitter emit,
  ) async {
    emit(HomeServicesGetCompaniesLoading());
    try{
      this.companies.clear();
      var companies = await FirebaseFirestore.instance
          .collection('home_companies')
          .where('category', isEqualTo: event.catId)
          .get();
      for (var e in companies.docs) {
        this.companies.add(CompaniesModel.fromJson(e.data(), e.id));
      }
      emit(HomeServicesGetCompaniesSuccess());
    }catch(e){
      emit(HomeServicesGetCompaniesFail());
    }

    print('the companies is ${this.companies}');
    print('the eelele ${event.catId}');
  }

  Future<void> _onUploadImage(UploadImage event, Emitter emit) async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        profileImage = File(pickedFile.path);
        profileImageName = pickedFile.name;
        emit(HomeServicesSectionUploadImageSuccessState());
      } else {
        print('No Image Selected');
        emit(HomeServicesSectionUploadImageFailState());
      }
    } catch (e) {
      print('Error in _onStudentPickProfileImage ::: ${e.toString()}');
    }
  }

  void _onSelectDateEvent(
    SelectDateEvent event,
    Emitter emit,
  ) async {
    var date = await openDateTimePicker(event.context);
    dateTime = date!;
    emit(HomeServicesSectionSelectDateState());
  }

  void _onSelectTimeEvent(
    SelectTimeEvent event,
    Emitter emit,
  ) async {
    var time = await timePickerBuilder(event.context);
    timeOfDay = time;
    emit(HomeServicesSectionSelectTimeState());
  }

  void _onGetAllRequests(
    GetAllRequests event,
    Emitter emit,
  ) async {
    emit(HomeServicesGetAllRequestLoading());
    await FirebaseFirestore.instance
        .collection("users")
        .doc(mainBloc.userInfoModel!.id)
        .collection("requests")
        .get()
        .then((e) {
      for (var e in e.docs) {
        ordersModel.add(
          OrderModel.fromJson(e.data(), e.id),
        );
      }
      emit(HomeServicesGetAllRequestSuccess());
    }).catchError((e) {
      emit(HomeServicesGetAllRequestFail());
    });
  }

  void _onSendRequest(
    SendRequest event,
    Emitter emit,
  ) async {
    emit(HomeServicesSendRequestLoading());
    String image = "";
    if (profileImage != null) {
      image = await authGetImageUrl("test", profileImageName, profileImage!);
    }
    print('the id od fff ${selectedCompany!.id}');
    var userRequest = await FirebaseFirestore.instance
        .collection("users")
        .doc(mainBloc.userInfoModel!.id)
        .collection("requests")
        .add({
      "location": locationController.text,
      "info": infoController.text,
      "userId": mainBloc.userInfoModel!.id,
      "timeFrom": "${timeOfDay!.hour}:${timeOfDay!.minute}",
      "image": image,
      "serviceName": homeServiceSelected!.name,
      "serviceId": homeServiceSelected!.id,
      "isAccept": 0,
    });
    await FirebaseFirestore.instance
        .collection("home_companies")
        .doc(selectedCompany!.id)
        .collection("requests")
        .add({
      "location": locationController.text,
      "userId": mainBloc.userInfoModel!.id,
      "info": infoController.text,
      "timeFrom": "${timeOfDay!.hour}:${timeOfDay!.minute}",
      "image": image,
      "serviceName": homeServiceSelected!.name,
      "serviceId": homeServiceSelected!.id,
      "isAccept": 0,
      "userRequest": userRequest.id,
    }).then((v) {
      print('the v is ${v.id}');
      showToast(text: "Request sent successfully", state: ToastState.SUCCESS);
      emit(HomeServicesSendRequestSuccess());
    }).catchError((e) {
      showToast(text: e.toString(), state: ToastState.ERROR);
      emit(HomeServicesSendRequestFail());
    });
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

  Future<TimeOfDay?> timePickerBuilder(BuildContext context) async {
    return await showTimePicker(
      context: context,
      initialTime:
          TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute),
    );
  }

  Future<DateTime?> openDateTimePicker(BuildContext context) async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime(3000),
    );
  }
}
