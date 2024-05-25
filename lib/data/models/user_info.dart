class UserInfoModel {
  String? id;
  String? uid;
  String? name;
  String? email;
  String? phoneNumber;
  num? postelCode;
  String? image;

  UserInfoModel.fromJson(Map<String, dynamic> json, String id) {
    print('the dkdkdkdk ${json}');
    id = id;
    uid = json['uid'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    postelCode = json['postelCode'];
    image = json['image'] ?? "";
  }
}
