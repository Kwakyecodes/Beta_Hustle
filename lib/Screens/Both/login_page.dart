import 'package:beta_hustle/models/colors.dart';
import 'package:beta_hustle/models/constants.dart';
import 'package:beta_hustle/models/strings.dart';
import 'package:beta_hustle/models/user.dart';
import 'package:beta_hustle/notifications/alerts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:beta_hustle/models/form_validation.dart';
import 'package:beta_hustle/models/text_editing_control.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordObscure = true;
  bool isChecked = false;
  int id = 1;
  bool otpOn = false;
  List<String> sex = ["Male", "Female"];
  String radioButtonItem = "Male";
  bool hideSetPassword = true;
  bool hideConfirmedPassword = true;
  IconData iconType = Icons.visibility_outlined;
  final validate = new formValidate();
  final user = new NUser();
  final alerts = new Alerts();
  final loginEmail = new TextEditingController();
  final loginPassword = new TextEditingController();

  bool loginState = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                        alignment: Alignment(1.0, 0.0),
                        padding: EdgeInsets.only(top: 30, right: 5),
                        child: Column(
                          children: [
                            LiteRollingSwitch(
                              colorOn: Colors.blueGrey,
                              colorOff: Color(0XFF6A62B7),
                              value: true,
                              textOn: "User",
                              iconOn: Icons.account_circle_outlined,
                              textOff: "Handyman",
                              iconOff: Icons.attach_money,
                              onChanged: (bool state) {
                                loginState = state;

                                print("$loginState");
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 90.0, 0.0, 0.0),
                        child: Text(
                          'Beta',
                          style: TextStyle(
                              color: Colors.blueGrey.shade900,
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Lobster"),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(35.0, 150.0, 0.0, 0.0),
                        child: Text(
                          'Hustle',
                          style: TextStyle(
                              color: Colors.blueGrey.shade900,
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Lobster"),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(180.0, 145.0, 0.0, 0.0),
                        child: Text(
                          '.',
                          style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              color: Color(0XFF6A62B7)),
                        ),
                      ),
                    ],
                  ),
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
                              child: Icon(Icons.email),
                            ),
                            Container(
                              height: 50,
                              width: 230,
                              decoration: BoxDecoration(
                                  //color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(100)),
                              child: TextField(
                                controller: loginEmail,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  //filled: true,
                                  hintText: "Email",
                                  //fillColor: Colors.blueGrey,

                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontFamily: "Lobster"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            color: Colors.blueGrey.withOpacity(0.5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(child: Icon(Icons.lock)),
                            Container(
                              width: 230,
                              child: TextField(
                                controller: loginPassword,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  border: InputBorder.none,
                                  suffixIcon: Container(
                                      child: InkWell(
                                          onTap: () {
                                            if (passwordObscure == true) {
                                              setState(() {
                                                passwordObscure = false;
                                                iconType = Icons
                                                    .visibility_off_outlined;
                                              });
                                            } else if (passwordObscure ==
                                                false) {
                                              setState(() {
                                                passwordObscure = true;
                                                iconType =
                                                    Icons.visibility_outlined;
                                              });
                                            }
                                          },
                                          child: Icon(
                                            iconType,
                                            color: Color(0XFF6A62B7),
                                          ))),
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFamily: "Lobster",
                                  ),
                                ),
                                obscureText: passwordObscure,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        alignment: Alignment(1.0, 0.0),
                        padding: EdgeInsets.only(top: 15, left: 20),
                        child: InkWell(
                          child: Text(
                            "Forgot Password?",
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

                            validate.login(context, loginEmail.text,
                                loginPassword.text, loginState);
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blueGrey.shade900,
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0))),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            height: 40,
                            width: 230,
                            child: Center(
                              child: Text("LOGIN",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          )),
                      SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "New to Beta Hustle?",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          InkWell(
                            onTap: () {
                              _signUp(context);
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  color: Colors.blueGrey.shade500,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
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

  void _signUp(context) {
    // this is the start of the bottom sheet
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return StatefulBuilder(builder: (BuildContext context,
            StateSetter setState /*You can rename this!*/) {
          return otpOn ? returnOtp(context) : returnsignUp(context);
        });
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(bottonSheetRadius),
      ),
      backgroundColor: textFieldColor,
      isScrollControlled: true,
    );
  }

//Signup Widget
  Widget returnsignUp(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .90,
      child: Column(children: [
        Container(
            child: Row(children: [
              IconButton(
                icon: Icon(Icons.clear_outlined,
                    color: Colors.black, size: cancelIconSize),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Align(
                  alignment: Alignment.center,
                  child: Container(
                      margin: const EdgeInsets.only(left: 25.0),
                      child: Text(createAccount,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: appNameFont,
                            fontSize: titleSize,
                            fontWeight: FontWeight.bold,
                          )))),
            ]),
            decoration: BoxDecoration(
              color: blueGrey5,
              borderRadius: const BorderRadius.only(
                topLeft: const Radius.circular(bottonSheetRadius),
                topRight: const Radius.circular(bottonSheetRadius),
              ),
            )),
        SizedBox(height: 5.0),
        Align(
            alignment: Alignment.center,
            child: Container(
              height: textFieldHeight,
              width: textFieldWidth,
              child: TextFormField(
                controller: fname,
                keyboardType: TextInputType.name,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: textFont,
                  fontSize: textFieldSize,
                ),
                showCursor: true,
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                    //prefixIcon: Icon(Icons.email_outlined,),//color: Colors.black12),
                    //border: InputBorder.none,
                    labelText: hintFirstName,
                    labelStyle: TextStyle(
                      fontSize: labelSize,
                      fontFamily: textFont,
                    )),
              ),
              /*decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(textFieldRadius)),
                  ),*/
            )),
        Align(
            alignment: Alignment.center,
            child: Container(
              height: textFieldHeight,
              width: textFieldWidth,
              child: TextFormField(
                controller: sname,
                keyboardType: TextInputType.name,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: textFont,
                  fontSize: textFieldSize,
                ),
                showCursor: true,
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                    //border: InputBorder.none,
                    //prefixIcon: Icon(Icons.email_sharp,color: Colors.blue),
                    labelText: hintLastName,
                    labelStyle: TextStyle(
                      fontSize: labelSize,
                      fontFamily: textFont,
                    )),
              ),
            )),
        Align(
            alignment: Alignment.center,
            child: Container(
              height: textFieldHeight,
              width: textFieldWidth,
              child: TextFormField(
                controller: phone,
                keyboardType: TextInputType.phone,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: textFont,
                  fontSize: textFieldSize,
                ),
                showCursor: true,
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                    //border: InputBorder.none,
                    //prefixIcon: Icon(Icons.email_sharp,color: Colors.blue),
                    labelText: hintPhoneNumber,
                    labelStyle: TextStyle(
                      fontSize: labelSize,
                      fontFamily: textFont,
                    )),
              ),
            )),
        Align(
            alignment: Alignment.center,
            child: Container(
              height: textFieldHeight,
              width: textFieldWidth,
              child: TextFormField(
                controller: Email,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: textFont,
                  fontSize: textFieldSize,
                ),
                showCursor: true,
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                    //border: InputBorder.none,
                    //prefixIcon: Icon(Icons.email_sharp,color: Colors.blue),
                    labelText: hintEmail,
                    labelStyle: TextStyle(
                      fontSize: labelSize,
                      fontFamily: textFont,
                    )),
              ),
            )),
        Align(
            alignment: Alignment.center,
            child: Container(
              height: textFieldHeight,
              width: textFieldWidth,
              child: TextFormField(
                controller: Password,
                keyboardType: TextInputType.text,
                obscureText: hideSetPassword,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: textFont,
                  fontSize: textFieldSize,
                ),
                showCursor: true,
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        hideSetPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        //color: Colors.blue,
                      ),
                      onPressed: () {
                        setState(() {
                          hideSetPassword = !hideSetPassword;
                        });
                      }
                      // Update the state i.e. toggle the state of passwordVisible variable
                      ,
                    ),
                    //border: InputBorder.none,
                    //prefixIcon: Icon(Icons.email_sharp,color: Colors.blue),
                    labelText: hintPassword,
                    labelStyle: TextStyle(
                      fontSize: labelSize,
                      fontFamily: textFont,
                    )),
              ),
            )),
        Align(
            alignment: Alignment.center,
            child: Container(
              height: textFieldHeight,
              width: textFieldWidth,
              child: TextFormField(
                controller: cpassword,
                keyboardType: TextInputType.text,
                obscureText: hideConfirmedPassword,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: textFont,
                  fontSize: textFieldSize,
                ),
                showCursor: true,
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        hideConfirmedPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        //color: Colors.blue,
                      ),
                      onPressed: () {
                        setState(() {
                          hideConfirmedPassword = !hideConfirmedPassword;
                        });
                      }
                      // Update the state i.e. toggle the state of passwordVisible variable
                      ,
                    ),
                    //border: InputBorder.none,
                    //prefixIcon: Icon(Icons.email_sharp,color: Colors.blue),
                    labelText: hintConfirmPassword,
                    labelStyle: TextStyle(
                      fontSize: labelSize,
                      fontFamily: textFont,
                    )),
              ),
            )),
        SizedBox(height: 10.0),
        Align(
            alignment: Alignment.centerLeft,
            child: Container(
                margin: const EdgeInsets.only(left: 40.0),
                child: Text("Sex",
                    style: TextStyle(
                      color: Colors.black54,
                      fontFamily: textFont,
                      fontSize: RadioTitleSize,
                      fontWeight: FontWeight.bold,
                    )))),
        Container(
          margin: const EdgeInsets.only(left: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: id,
                onChanged: (val) {
                  setState(() {
                    radioButtonItem = sex[0];
                    id = 1;
                  });
                },
              ),
              Text(
                sex[0],
                style: TextStyle(
                  color: Colors.black54,
                  fontFamily: textFont,
                  fontSize: textFieldSize,
                ),
              ),
              Radio(
                value: 2,
                groupValue: id,
                onChanged: (val) {
                  setState(() {
                    radioButtonItem = sex[1];
                    id = 2;
                  });
                },
              ),
              Text(
                sex[1],
                style: TextStyle(
                  color: Colors.black54,
                  fontFamily: textFont,
                  fontSize: textFieldSize,
                ),
              ),
            ],
          ),
        ),
        Container(
            margin: const EdgeInsets.only(left: 20),
            child: Flexible(
              child: Row(children: [
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: green, //Colors.blue,
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Text(agreement,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: textFont,
                    )),
                Text(agreement1,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontFamily: textFont,
                      fontWeight: FontWeight.bold,
                    )),
              ]),
            )),
        SizedBox(height: 0),
        Container(
            margin: const EdgeInsets.only(left: 170),
            child: FloatingActionButton.extended(
              backgroundColor: blueGrey3,
              foregroundColor: Colors.white,
              onPressed: () {
                // Respond to button press
                if (isChecked == true) {
                  bool valid = validate.signup(
                      context,
                      fname.text,
                      sname.text,
                      Email.text.trim(),
                      phone.text,
                      Password.text,
                      cpassword.text,
                      radioButtonItem);
                  if (valid == true) {
                    setState(() {
                      int verifycode = fname.text.length * 200 + 430;
                      // fotp.sendOtp(phone.text);
                      otpOn = true;
                    });
                    //  user.verifyPhone(fname.text, sname.text, email.text, phone.text, password.text, context, _value, verifycode);
                    user.signUp(fname.text, sname.text, Email.text.trim(),
                        phone.text, Password.text, context, radioButtonItem);
                  }
                } else {
                  alerts.user_toast(
                      "Please agree to terms of Beta Hustle to continue signup");
                }
              },
              label: Row(
                children: <Widget>[
                  Text("SIGN UP"),
                  SizedBox(width: 5),
                  Icon(Icons.arrow_forward)
                ],
              ),
            ))
      ]),
    );
  }

//Phone Verification WIdget
  Widget returnOtp(BuildContext context) {
    return Container(
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
                      // if (verifycode == otp.text) {
                      //   user.signUp(fname.text, sname.text, email.text,
                      //       phone.text, Password.text, context, _value);
                      // }
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
    );
  }
}
