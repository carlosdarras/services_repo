class UserInfoModel {
  String? id;
  String? uid;
  String? name;
  String? email;
  String? phoneNumber;
  String? postelCode;
  String? image;

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    postelCode = json['postelCode'];
    image = json['image'] ?? "";
  }
}
