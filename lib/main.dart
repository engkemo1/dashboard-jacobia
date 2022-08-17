import 'package:dashboard/ViewModel/GetX/QuestionGetX.dart';
import 'package:dashboard/view/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'ViewModel/GetX/CategoryGetX.dart';
import 'ViewModel/GetX/SignInGetX.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put(AuthController());
    Get.put(CategoryController());
    Get.put(QustionGetX());

  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'DashBoard',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  LoginPage(),
    );
  }
}
