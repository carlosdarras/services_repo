import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:services_repo/data/models/user_info.dart';

class RegisterRepository {
  Future<UserInfoModel> register(
      {required String email,
      required String password,
      required String phoneNumber,
      required num postelCode,
      required String name,
      String? image}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return await registerUserInfo(
        email: email,
        phoneNumber: phoneNumber,
        postelCode: postelCode,
        user: credential.user!,
        name: name,
        image: image,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<UserInfoModel> registerUserInfo(
      {required String email,
      required User user,
      required String phoneNumber,
      required num postelCode,
      required String name,
      String? image}) async {
    print('we enter to save info method');
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection("users");

      var userInfo = await users.add({
        'name': name, // John Doe
        'email': email, // Stokes and Sons
        'phoneNumber': phoneNumber,
        'postelCode': postelCode,
        'uid': user.uid,
        if (image != null) 'image': image,
      });
      return UserInfoModel.fromJson({
        'name': name, // John Doe
        'email': email, // Stokes and Sons
        'phoneNumber': phoneNumber,
        'postelCode': postelCode,
        'uid': user.uid,
        if (image != null) 'image': image,
      }, userInfo.id);
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }
}
