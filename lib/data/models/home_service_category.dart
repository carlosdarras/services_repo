import 'package:cloud_firestore/cloud_firestore.dart';

import 'services_model.dart';

class HomeServiceCategoryModel {
  String? id;
  String? name;
  String? description;
  List<ServicesModel> services = [];

  HomeServiceCategoryModel.fromJson(Map<String, dynamic> json, this.id,
      List<QueryDocumentSnapshot<Map<String, dynamic>>> services) {
    name = json['name'];
    description = json['description'];
    services.forEach((e) {
      this.services.add(ServicesModel.fromJson(e.data(), e.id));
    });
  }
}
