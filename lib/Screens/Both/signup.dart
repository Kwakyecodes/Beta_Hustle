import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'text_field.dart';
import 'package:beta_hustle/models/form_validation.dart';
import 'package:beta_hustle/models/text_editing_control.dart';
import 'package:beta_hustle/models/user.dart';
//import 'package:beta_hustle/models/flutter_otp.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool passwordObscure1 = true;
  bool passwordObscure2 = true;
  bool otpOn = false;
  IconData iconType1 = Icons.visibility_outlined;
  IconData iconType2 = Icons.visibility_outlined;
  var _value = "male";
  final random = new Random();
  int verifycode = 0;
  final validate = new formValidate();
  final user = new NUser();

  @override
  Widget build(BuildContext context) {
    return otpOn ? returnOtp(context) : returnSignUp(context);
  }

  Widget returnSignUp(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        color: Color(0XFF6A62B7).withOpacity(0.3),
        child: SingleChildScrollView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          //scrollDirection: Axis.vertical,

          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(12.0, 20.0, 0.0, 0.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Create an Account',
                              style: TextStyle(
                                  fontFamily: "Lobster",
                                  color: Colors.blueGrey.shade900,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 8.0, left: 20.0, right: 30.0),
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: fname,
                        hintName: "First Name",
                        iconType: Icons.account_circle,
                        keyboardType: TextInputType.name,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: sname,
                        hintName: "Last Name",
                        iconType: Icons.account_circle,
                        keyboardType: TextInputType.name,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: phone,
                        hintName: "Phone Number",
                        keyboardType: TextInputType.phone,
                        iconType: Icons.phone,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: email,
                        hintName: "Email",
                        iconType: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Gender",
                                style: TextStyle(
                                  fontFamily: "Lobster",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 30),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Radio(
                                      value: "male",
                                      groupValue: _value,
                                      onChanged: (value) {
                                        setState(() {
                                          _value = "male";
                                        });
                                      }),
                                  Text(
                                    "Male",
                                    style: TextStyle(
                                        fontFamily: "Lobster",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueGrey,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Radio(
                                      value: "female",
                                      focusColor: Colors.blueGrey,
                                      groupValue: _value,
                                      onChanged: (var value) {
                                        setState(() {
                                          _value = "female";
                                        });
                                      }),
                                  Text(
                                    "Female",
                                    style: TextStyle(
                                        fontFamily: "Lobster",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueGrey,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Icon(Icons.lock),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 2),
                              width: 225,
                              height: 50,
                              child: TextField(
                                controller: Password,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                      fontFamily: "Lobster",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  border: InputBorder.none,
                                  suffixIcon: Container(
                                      child: InkWell(
                                          onTap: () {
                                            if (passwordObscure1 == true) {
                                              setState(() {
                                                passwordObscure1 = false;
                                                iconType1 = Icons
                                                    .visibility_off_outlined;
                                              });
                                            } else if (passwordObscure1 ==
                                                false) {
                                              setState(() {
                                                passwordObscure1 = true;
                                                iconType1 =
                                                    Icons.visibility_outlined;
                                              });
                                            }
                                          },
                                          child: Icon(
                                            iconType1,
                                            color: Colors.blueGrey,
                                          ))),
                                ),
                                obscureText: passwordObscure1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Icon(Icons.lock),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 2),
                              width: 225,
                              height: 50,
                              child: TextField(
                                controller: cpassword,
                                decoration: InputDecoration(
                                  hintText: 'Confirm Password',
                                  hintStyle: TextStyle(
                                      fontFamily: "Lobster",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  border: InputBorder.none,
                                  suffixIcon: Container(
                                      child: InkWell(
                                          onTap: () {
                                            if (passwordObscure2 == true) {
                                              setState(() {
                                                passwordObscure2 = false;
                                                iconType2 = Icons
                                                    .visibility_off_outlined;
                                              });
                                            } else if (passwordObscure2 ==
                                                false) {
                                              setState(() {
                                                passwordObscure2 = true;
                                                iconType2 =
                                                    Icons.visibility_outlined;
                                              });
                                            }
                                          },
                                          child: Icon(
                                            iconType2,
                                            color: Colors.blueGrey,
                                          ))),
                                ),
                                obscureText: passwordObscure2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 40,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.blue.shade700,
                          color: Colors.blueGrey.shade900,
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: () {
                              bool valid = validate.signup(
                                  context,
                                  fname.text,
                                  sname.text,
                                  email.text,
                                  phone.text,
                                  Password.text,
                                  cpassword.text,
                                  _value);
                              if (valid == true) {
                                setState(() {
                                  int verifycode =
                                      fname.text.length * 200 + 430;
                                  // fotp.sendOtp(phone.text);
                                  otpOn = true;
                                });
                                //  user.verifyPhone(fname.text, sname.text, email.text, phone.text, password.text, context, _value, verifycode);
                                user.signUp(fname.text, sname.text, email.text,
                                    phone.text, Password.text, context, _value);
                              }
                            },
                            child: Center(
                              child: Text(
                                "SIGN UP",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget returnOtp(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0XFFE5E5E5),
                Color(0XFF6A62B7).withOpacity(0.6),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              //stops: [0.3,0.6]
            ),
          ),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Container(
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(35.0, 150.0, 0.0, 0.0),
                      child: Text(
                        'Verify ' + phone.text,
                        style: TextStyle(
                            color: Colors.blueGrey.shade900,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Lobster"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 30.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blueGrey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(50)),
                      padding: EdgeInsets.only(left: 5, top: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Icon(Icons.lock),
                          ),
                          Container(
                            child: TextField(
                              controller: otp,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                //filled: true,
                                hintText: "    X      X    X    X",
                                //fillColor: Colors.blueGrey,

                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: "Lobster",
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(height: 5),
                    Container(
                      alignment: Alignment(1.0, 0.0),
                      padding: EdgeInsets.only(top: 15, left: 20),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            otpOn = false;
                          });
                        },
                        child: Text(
                          "Wrong Number?",
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                        onPressed: () {
                          //Navigator.of(context).pushReplacementNamed('/jobRequest');
                          if (verifycode == otp.text) {
                            user.signUp(fname.text, sname.text, email.text,
                                phone.text, Password.text, context, _value);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blueGrey.shade900,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0))),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          height: 40,
                          width: 230,
                          child: Center(
                            child: Text("VERIFY",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        )),
                    SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
