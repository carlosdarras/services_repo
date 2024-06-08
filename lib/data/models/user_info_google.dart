import 'package:firebase_auth/firebase_auth.dart';

abstract class UserInfo {
  String? name;
  String uid;
  String? phoneNumber;

  UserInfo({this.name, required this.uid, this.phoneNumber});
}

class GoogleUserInfo extends UserInfo {
  String? email;
  bool? isVerification;

  GoogleUserInfo.fromJson(User user)
      : super(
            name: user.displayName ?? "",
            uid: user.uid,
            phoneNumber: user.phoneNumber ?? "") {
    email = user.email ?? "";
    isVerification = user.emailVerified;
  }
}

class FacebookUserInfo extends UserInfo {
  FacebookUserInfo({required super.uid});
}

class AppleUserInfo extends UserInfo {
  AppleUserInfo({required super.uid});
}
