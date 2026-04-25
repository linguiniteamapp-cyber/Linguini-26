import 'package:flutter/material.dart';
import 'package:linguini_app/homepage.dart';
import 'otp_temp.dart';
import 'package:linguini_app/choose_account.dart';
import 'package:linguini_app/login.dart';
import 'package:linguini_app/profile_setup_1.dart';
import 'package:linguini_app/basket.dart';
import 'splash_page.dart';
import 'package:linguini_app/chat.dart';
import 'package:linguini_app/chef_profile_page.dart';
import 'package:linguini_app/home/home_root_page.dart';
import 'package:linguini_app/welcome/wepage1.dart';
import 'package:linguini_app/Review.dart';
import 'package:linguini_app/forgetPassword.dart';
import 'package:linguini_app/order.dart';
import 'package:linguini_app/active_order.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  SplashPage(),
    );
  }
}
