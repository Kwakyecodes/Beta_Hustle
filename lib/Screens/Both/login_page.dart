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
  IconData iconType = Icons.visibility_outlined;
  @override
  Widget build(BuildContext context) {
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
                            onChanged: (bool state) {},
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20.0, 90.0, 0.0, 0.0),
                      child: Text(
                        'Beta',
                        style: TextStyle(color: Colors.blueGrey.shade900, fontSize: 60, fontWeight: FontWeight.bold, fontFamily: "Lobster"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(35.0, 150.0, 0.0, 0.0),
                      child: Text(
                        'Hustle',
                        style: TextStyle(color: Colors.blueGrey.shade900, fontSize: 60, fontWeight: FontWeight.bold, fontFamily: "Lobster"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(180.0, 145.0, 0.0, 0.0),
                      child: Text(
                        '.',
                        style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Color(0XFF6A62B7)),
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
                      decoration: BoxDecoration(color: Colors.blueGrey.withOpacity(0.5), borderRadius: BorderRadius.circular(50)),
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
                              controller: email,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                //filled: true,
                                hintText: "Email",
                                //fillColor: Colors.blueGrey,

                                hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontFamily: "Lobster"),
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
                      decoration: BoxDecoration(color: Colors.blueGrey.withOpacity(0.5), borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(child: Icon(Icons.lock)),
                          Container(
                            width: 230,
                            child: TextField(
                              controller: password,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                border: InputBorder.none,
                                suffixIcon: Container(
                                    child: InkWell(
                                        onTap: () {
                                          if (passwordObscure == true) {
                                            setState(() {
                                              passwordObscure = false;
                                              iconType = Icons.visibility_off_outlined;
                                            });
                                          } else if (passwordObscure == false) {
                                            setState(() {
                                              passwordObscure = true;
                                              iconType = Icons.visibility_outlined;
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
                          final validate = new formValidate();
                          validate.login(context, email.text, password.text);
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.blueGrey.shade900, shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))),
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
                            Navigator.of(context).pushNamed('/signup');
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(color: Colors.blueGrey.shade500, fontWeight: FontWeight.bold),
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
    );
  }
}
