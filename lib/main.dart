//import 'package:beta_hustle/Screens/Both/login.dart';
import 'package:beta_hustle/Screens/Both/login_page.dart';
import 'package:beta_hustle/Screens/Handyman/handyman_main_page.dart';
import 'package:beta_hustle/Screens/User/category_list_page.dart';
import 'package:beta_hustle/Screens/User/pushrequests.dart';
import 'package:beta_hustle/chat_files/screens/home_screen.dart';
import 'package:beta_hustle/models/job_descriptions.dart';

import '/Screens/Both/login.dart';
import 'package:flutter/material.dart';

import 'Screens/Both/requests.dart';
import 'Screens/Both/signup.dart';
import 'Screens/User/payment.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beta Hustle',

      navigatorKey: Job.mainAppNav,
      routes: <String, WidgetBuilder>{

        '/signup':(BuildContext context)=> new SignUpPage(),
        '/jobRequest':(BuildContext context)=> new MainPage(),
        '/handyPage':(BuildContext context) => new HandyMainPage(),
        '/requests' : (BuildContext context)=> new Requests()
      },


      theme: new ThemeData(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: HandyMainPage(),

    );
  }

}




