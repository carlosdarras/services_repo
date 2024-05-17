import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterRepository {
  Future<void> register(
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
      registerUserInfo(
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
    } catch (e) {
      print(e);
    }
  }

  Future<void> registerUserInfo(
      {required String email,
      required User user,
      required String phoneNumber,
      required num postelCode,
      required String name,
      String? image}) async {
    print('we enter to save info method');
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    users.add({
      'name': name, // John Doe
      'email': email, // Stokes and Sons
      'phoneNumber': phoneNumber,
      'postelCode': postelCode,
      'uid': user.uid,
      if (image != null) 'image': image,
    }).then((value) {
      print('the value we have is is $value');
      print('the value we have is is ${value.id}');
    }).catchError((error) {
      print('the error isisisi ${error}');
    });
  }
}
