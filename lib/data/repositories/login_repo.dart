// import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:services_repo/data/models/user_info.dart';

class LoginRepository {
  Future<UserInfoModel> login(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return await getUserInfo(credential.user!.uid);
    } on FirebaseAuthException catch (e) {
      print('hte ddkdkdk ${e.message}');
      if (e.code == 'user-not-found') {
        throw Exception(e.message);
      } else if (e.code == 'wrong-password') {
        throw Exception(e.message);
      } else {
        throw Exception(e.message);
      }
    }
  }

  Future<UserInfoModel> getUserInfo(String uid) async {
    try {
      QuerySnapshot<Map<String, dynamic>> user =
          await FirebaseFirestore.instance
              .collection('users')
              .where(
                "uid",
                isEqualTo: uid,
              )
              .get();
      print('user ${user}');
      print('user ${user.docs.first.id}');
      print('user ${user.docs.first.data()}');
      return UserInfoModel.fromJson(
        user.docs.first.data(),
        user.docs.first.id,
      );
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }
}
