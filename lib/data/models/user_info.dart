class UserInfoModel {
  String? id;
  String? name;
  String? email;
  String? lat;
  String? lng;
  String? uid;


  UserInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    lat = json['lat'];
    lng = json['lng'];
    uid = json['uid'];
  }
}
