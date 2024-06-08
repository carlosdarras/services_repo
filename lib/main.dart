import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'core/services/cash_helper.dart';
import 'firebase_options.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  userId = await CashHelper.getData(key: "userId")?? "/**/";
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}
