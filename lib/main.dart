import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deeplink/home.dart';
import 'package:flutter_deeplink/reset_password.dart';
import 'package:get/get.dart';

import 'deeplink_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyC7hTtONogXMd2UHoo07M1fVAtnbmCFsvA',
      appId: '1:1028846655455:android:9db7a25e9471fe636a566a',
      messagingSenderId: '1028846655455',
      projectId: 'flutter-deeplink-e887b',
      authDomain: 'flutter-deeplink-e887b.firebaseapp.com',
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your applsication.
  final dynamicC = Get.put(DynamicLink());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      getPages: [
        GetPage(name: '/homePage', page: () => HomePage()),
        GetPage(name: '/resetPassword', page: () => ResetPassword())
      ],
    );
  }
}
