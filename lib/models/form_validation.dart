import 'package:beta_hustle/models/text_editing_control.dart';
import 'package:flutter/material.dart';

import 'package:beta_hustle/Screens/Both/signup.dart';
import 'package:beta_hustle/models/user.dart';
import 'package:beta_hustle/notifications/alerts.dart';

class formValidate {
  //String email, phone, password;

  //Push Request form attributes
  String? jobtitle;
  String? jobDescription;
  int? maxNumofmen;
  double? price;

  formValidate({
    this.jobtitle,
    this.jobDescription,
    this.maxNumofmen,
    this.price,
  });

  final alerts = new Alerts();
  final user = new NUser();
  login(BuildContext context, String email, String password) {
    if (!email.contains("@")) {
      alerts.user_toast("The email is invalid");
    } else if (password.length < 6) {
      alerts.user_toast("The password must be at least six characters");
    } else {
      user.login(email, password, context);
    }
  }

  bool signup(BuildContext context, String fname, String sname, String email,
      String phone, String password, String cpassword, String gender) {
    bool valid = false;
    if (!email.contains("@")) {
      alerts.user_toast("The email is invalid");
    } else if (password.length < 6) {
      alerts.user_toast("The password must be at least six characters");
    } else if (fname.length == 0 || sname.length == 0) {
      alerts.user_toast("The Names are required");
    } else if (phone.length == 0 || phone[0] != '+') {
      alerts.user_toast("Please enter a phone number in foriegn format ");
    } else if (password != cpassword) {
      alerts.user_toast("The Passwords don't Match");
    } else {
      //user.signUp(fname, sname, email, phone, password, context, gender);
      valid = true;
    }
    return valid;
  }

  bool pushRequestform() {
    bool valid = false;
    if (jobtitle!.length == 0 ||
        jobDescription!.length == 0 ||
        maxNumofmen == 0 ||
        jobDescription!.isEmpty) {
      alerts.user_toast("All fields are required!!");
    }
    //add more conditions for fieldvalues(Eg:Valid job titles)
    else {
      valid = true;
    }
    return valid;
  }
}
