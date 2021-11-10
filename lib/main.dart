//import 'package:beta_hustle/Screens/Both/login.dart';
import 'package:beta_hustle/Screens/Both/login.dart';
import 'package:flutter/material.dart';

import 'Screens/Both/requests.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beta Hustle',
      theme: new ThemeData(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: Requests(),

    );
  }

}




