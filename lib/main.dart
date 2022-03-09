//import 'package:beta_hustle/Screens/Both/login.dart';

// @dart=2.9

import 'package:beta_hustle/Screens/Both/login_page.dart';
import 'package:beta_hustle/Screens/Handyman/handyman_main_page.dart';
import 'package:beta_hustle/Screens/User/category_list_page.dart';
import 'package:beta_hustle/Screens/User/user_profile.dart';
import 'package:beta_hustle/chat_files/screens/home_screen.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'authentication.dart';

final box = GetStorage('userstate');
bool userstate = true;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance
      .activate(webRecaptchaSiteKey: 'recaptcha-v3-site-key');
  SharedPreferences prefs = await SharedPreferences.getInstance();

  userstate = prefs.getBool('userstate');
  await GetStorage.init('userstate');
  final box = GetStorage('userstate');

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
          //'/signup': (BuildContext context) => new SignUpPage(),
          //'/requests': (BuildContext context) => new Requests(),
          //'/pushrequests': (BuildContext context) => new PushRequests(),
          'jobrequest': (BuildContext context) => new MainPage(),
          '/handymainpage': (BuildContext context) => new HandyMainPage(),
          '/chats': (BuildContext context) => new HomeScreen(),
          '/userprofile': (BuildContext context) => new UserProfile()
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

//this class checks the if the user is signed in already
class Authenticate extends StatefulWidget {
  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    // Userstate = box.read('userstate');
    // print(Userstate);

    if (firebaseUser != null) {
      print(userstate);
      if (userstate == true)
        return MainPage();
      else
        return HandyMainPage();
    } else {
      return LoginPage();
    }
  }
}
