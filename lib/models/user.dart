import 'package:flutter/material.dart';
import 'package:beta_hustle/main.dart';
import 'package:beta_hustle/Screens/Both/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:beta_hustle/notifications/alerts.dart';
import 'package:beta_hustle/models/db_ref.dart';
//import 'package:flutter_sms/flutter_sms.dart';
import 'package:telephony/telephony.dart';

String verifyID = "...";
final Telephony telephony = Telephony.instance;

class NUser {
  final alerts = new Alerts();
  //final FlutterSms sms = new FlutterSms();
  login(String email, String password, BuildContext context) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User? _FirebaseUser = (await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .catchError((errMsg) {
      alerts.user_toast("Error: " + errMsg.toString());
    }))
        .user;
    if (_FirebaseUser != null) {
//User is created
//Save User data into database

      //Navigator.of(context).pushNamed('/jobRequest');
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/jobRequest', (Route<dynamic> route) => false);
      // Navigator.of(context).popUntil(ModalRoute.withName('/jobRe'));
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
    if (_FirebaseUser != null) {
//User is created
//Save User data into database

      Map userData = {
        "fname": fname.trim(),
        "sname": sname.trim(),
        "email": email.trim(),
        "phone": phone.trim(),
        "gender": gender.trim()
      };
      usersRef.child(_FirebaseUser.uid).set(userData);
      alerts.user_toast("Account Created Successfully");
      Navigator.of(context).pushNamed('/login_page');
    } else {
//An error occured
      alerts.user_toast("Unable to create new User");
    }
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
}
