//import 'package:beta_hustle/Screens/Both/login.dart';
// @dart=2.9
import 'package:beta_hustle/Screens/Both/login_page.dart';
import 'package:beta_hustle/Screens/Both/requests.dart';
import 'package:beta_hustle/Screens/User/category_list_page.dart';
import 'package:beta_hustle/Screens/User/pushrequests.dart';
import 'package:beta_hustle/models/job_descriptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'Screens/Both/signup.dart';
import 'authentication.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //await FirebaseAppCheck.instance.activate(webRecaptchaSiteKey: 'recaptcha-v3-site-key');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationProvider>(
          create: (_) => AuthenticationProvider(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationProvider>().authState,
        )
      ],
      child: MaterialApp(
        title: 'Firebase Authentication',
        home: Authenticate(),
        routes: <String, WidgetBuilder>{
          '/signup': (BuildContext context) => new SignUpPage(),
          //'/jobRequest': (BuildContext context) => new MainPage(),
          '/requests': (BuildContext context) => new Requests(),
          //'/login_page': (BuildContext context) => new LoginPage(),
          '/pushrequests': (BuildContext context) => new PushRequests()
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class Authenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return MainPage();
    }
    return LoginPage();
  }
}
