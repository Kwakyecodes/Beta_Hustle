import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telephony/telephony.dart';

import 'package:beta_hustle/Screens/Both/login_page.dart';
import 'package:beta_hustle/main.dart';
import 'package:beta_hustle/models/db_ref.dart';
import 'package:beta_hustle/notifications/alerts.dart';

String verifyID = "...";
bool userState = true;
final Telephony telephony = Telephony.instance;

class NUser {
  String? fname;
  String? sname;
  String? email;
  String? password;

  final alerts = new Alerts();
  final box = GetStorage();
  String username = "";
  login(String email, String password, BuildContext context,
      bool userStatus) async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User? _FirebaseUser = (await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .catchError((errMsg) {
      alerts.user_toast("Error: " + errMsg.toString());
    }))
        .user;
    if (_FirebaseUser != null) {
      //User exists
      //Credentials are valid
      DataSnapshot snapshot = await usersRef
          .orderByChild('${_FirebaseUser.uid}/user')
          .equalTo(false)
          .once();

      print("Value::");
      print(snapshot.exists);
      print("state");
      print(userStatus.toString());
      if (snapshot.exists == true && userStatus == false) {
        await box.write('userstate', false);

        // Navigator.of(context).pushNamedAndRemoveUntil(
        //     '/handymainpage', (Route<dynamic> route) => false);
      } else {
        await box.write('userstate', true);

        // Navigator.of(context).pushNamedAndRemoveUntil(
        //     '/jobRequest', (Route<dynamic> route) => false);
      }

      //   print("Value::");
      //   print(snapshot.exists);
      //   if (snapshot.exists == true && userStatus == false) {
      //     await box.write('userstate', false);

      //     Navigator.of(context).pushNamedAndRemoveUntil(
      //         '/handymainpage', (Route<dynamic> route) => false);
      //   } else {
      //     await box.write('userstate', true);

      //     Navigator.of(context).pushNamedAndRemoveUntil(
      //         '/jobRequest', (Route<dynamic> route) => false);
      //   }
    } else {
      //An error occured
      alerts.user_toast("Invalid Credentials");
    }
  }

  signUp(String fname, String sname, String email, String phone,
      String password, BuildContext context, String gender) async {
    // try {
    //   final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    //   if (newUser != null) {
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(builder: (context) => LoginPage()),
    //     );
    //   }
    // } catch (e) {
    //   print(e);
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User? _FirebaseUser = (await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .catchError((errMsg) {
      alerts.user_toast("Error: " + errMsg.toString());
    }))
        .user;
    signout();
    if (_FirebaseUser != null) {
//User is created
//Save User data into database

      Map userData = {
        "fname": fname.trim(),
        "sname": sname.trim(),
        "email": email.trim(),
        "phone": phone.trim(),
        "gender": gender.trim(),
        "user": "true"
      };
      await usersRef.child(_FirebaseUser.uid).set(userData);
      alerts.user_toast("Account Created Successfully");
      Navigator.of(context).pop();
    } else {
//An error occured
      alerts.user_toast("Unable to create new User");
    }
  }

  signout() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.remove('userstate');
    await FirebaseAuth.instance.signOut();
    box.remove('userstate');
  }

  verifyPhone(String fname, String sname, String email, String phone,
      String password, BuildContext context, String gender, int otpCode) async {
    String message =
        'Verify your Beta Husle Phone Number with this code : $otpCode ';
    await telephony.requestPhoneAndSmsPermissions;
    await telephony.sendSms(to: phone, message: message);

    // if (sendsms != null) {
    //   alerts.user_toast("sms sent");
    // } else {
    //   alerts.user_toast("error occured");
    // }
    // await FirebaseAuth.instance.verifyPhoneNumber(
    //   phoneNumber: phone,
    //   verificationCompleted: (phoneAuthCredential) {
    //     signUp(fname, sname, email, phone, password, context, gender);
    //   },
    //   verificationFailed: (FirebaseAuthException e) {
    //     alerts.user_toast("Unable to verify: " + e.message.toString());
    //   },
    //   codeSent: (String verificationId, int? resendToken) {
    //     verifyID = verificationId;
    //   },
    //   codeAutoRetrievalTimeout: (String verificationId) {},
    // );

    // bool isCorrectOTP = FlutterOtp.resultChecker(otpCode);

    // if (isCorrectOTP) {
    //   signUp(fname, sname, email, phone, password, context, gender);
    // } else {
    //   alerts.user_toast("Unable to verify Phone ");
    //   Navigator.of(context).pushNamed('/signup');
    // }
  }

  userInfo(BuildContext context) async {
    final firebaseUser = context.watch<User>();
    usersRef
        .child(firebaseUser.uid)
        .child("fname")
        .once()
        .then((DataSnapshot data) {
      print(data.value);
      print(data.key);
      username = data.value.toString();
    });
  }

  updateUserinfo() async {}
}
