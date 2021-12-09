//import 'package:beta_hustle/Screens/Both/login.dart';
import 'package:beta_hustle/Screens/Both/login_page.dart';
import 'package:beta_hustle/Screens/User/category_list_page.dart';
import 'package:beta_hustle/Screens/User/pushrequests.dart';
import 'package:beta_hustle/chat_files/screens/home_screen.dart';
import 'package:beta_hustle/models/job_descriptions.dart';

import '/Screens/Both/login.dart';
import 'package:flutter/material.dart';

import 'Screens/Both/requests.dart';
import 'Screens/Both/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'Screens/User/payment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //await FirebaseAppCheck.instance.activate(webRecaptchaSiteKey: 'recaptcha-v3-site-key');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beta Hustle',
      navigatorKey: Job.mainAppNav,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignUpPage(),
        '/jobRequest': (BuildContext context) => new MainPage(),
        '/requests': (BuildContext context) => new Requests(),
        '/login_page': (BuildContext context) => new LoginPage(),
        '/pushrequests': (BuildContext context) => new PushRequests()
      },
      theme: new ThemeData(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
