import 'package:beta_hustle/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:beta_hustle/constants.dart';
import '../../strings.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isChecked = false;
  List<String> gender = ["Male","Female","Other"];
  String radioButtonItem = "Other";
  int id = 3;
  bool hidePassword = true;
  bool hideSetPassword = true;
  bool hideConfirmedPassword = true;
  bool _toggle(bool hideMe) {
    setState(() {
      hideMe = !hideMe;
    });
    return hideMe;
  }
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : false,
        body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SizedBox(height:20),
              Align(
                  alignment: Alignment.topRight,
                child: Container(
                  margin: const EdgeInsets.only(right: 5.0),
                  child: Transform.scale( scale: 0.8,
                      child: LiteRollingSwitch(
                        value: true,
                        textOn: user,
                        textOff: handyman,
                        colorOn: blueGrey5,
                        colorOff: blueGrey3,
                        iconOn: Icons.account_circle_sharp,
                        iconOff: Icons.attach_money_sharp,
                        animationDuration: Duration(milliseconds: 600),
                        onChanged: (bool state) {
                          print('turned ${(state) ? 'yes' : 'no'}');
                        },
                      )),

                ),
              ),
              SizedBox(height:240),
              Align(
                  alignment: Alignment.center,
                  child: Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                    //margin: const EdgeInsets.only(left: 35.0),
                        Text (appName,
                          style:TextStyle(
                            color:green,
                            fontSize: appNameSize,
                            fontFamily: appNameFont,
                            fontWeight: FontWeight.bold,
                          )),
                        Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                            //margin: const EdgeInsets.only(bottom: 10.0),
                          child:Text(appName1,
                              style: TextStyle(
                                color:deepBlue,
                                fontSize: appNameSize,
                                fontFamily: appNameFont,
                                fontWeight: FontWeight.bold,
                              )
                          )
                        ))
                      ])
                  )),

              SizedBox(height:10),
              Align(
                  alignment: Alignment.center,
                  child: Container(
                    height:textFieldHeight,
                    width: textFieldWidth,
                    child: TextField(
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: textFont,
                        fontSize: textFieldSize,
                      ),
                      showCursor: true,
                      cursorColor: Colors.blue,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.email_sharp,color: Colors.blue),
                        hintText: hintEmail,
                        hintStyle: TextStyle(
                          fontFamily: textFont,
                        )

                      ),
                    ),
                    decoration: BoxDecoration(
                      color: textfieldColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: const Radius.circular(5),
                        topRight: const Radius.circular(5),
                      ),
                    ),
                  )
              ),
              SizedBox(height: 0.2),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height:textFieldHeight,
                  width: textFieldWidth,
                  child: TextField(
                    obscureText: hidePassword,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: textFont,
                      fontSize: textFieldSize,
                    ),
                    showCursor: true,
                    cursorColor: Colors.blue,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.lock,color: Colors.blue),
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            hidePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.blue,
                          ),
                          onPressed: (){hidePassword=_toggle(hidePassword);}// Update the state i.e. toggle the state of passwordVisible variable
                          ,
                        ),
                      hintText: hintPassword,
                      hintStyle: TextStyle(
                        fontFamily: textFont,
                      )
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: textfieldColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: const Radius.circular(textFieldRadius),
                      bottomRight: const Radius.circular(textFieldRadius),
                    ),
                  ),


                ),
              ),
              SizedBox(height:10),
              Align(
                  alignment: Alignment.center,
                  child: Container(
                      decoration: BoxDecoration(
                          color: blueGrey1,
                          borderRadius: BorderRadius.all(
                              const Radius.circular(textFieldRadius))
                      ),
                      height:textFieldHeight,
                      width: textFieldWidth,
                      child: TextButton(
                        child: Text(loginButton,
                          style: TextStyle(
                              fontSize: loginSize,
                              color: Colors.white,
                              fontFamily: textFont,
                              fontWeight: FontWeight.normal),
                        ),
                        onPressed: () {},
                      )

                  )
              ),
              SizedBox(height: 20),
              Align(
                  alignment: Alignment.center,
                  child: Container(
                      margin: const EdgeInsets.only(left: 216.0),
                      child: Text(forgotPassword,
                        //textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: forgotPasswordSize,
                            fontFamily: textFont,
                            fontWeight: FontWeight.normal
                        ),
                      ))
              ),
              SizedBox(height:100),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(noAccount1,
                            //textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: textFont,
                                fontSize: textFieldSize,
                                fontWeight: FontWeight.normal
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                _signUp(context);
                              },
                              child: Text(noAccount2,
                                //textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: green,//Colors.blue,
                                    fontFamily: textFont,
                                    fontSize: textFieldSize,
                                    fontWeight: FontWeight.bold
                                ),
                              )
                          )
                        ],
                      )
              ))
            ],
          ),

          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.white,
                coolGray,
                deepBlue
                ],
            )
            ),


    )

    ));
  }
  void _signUp(context) { // this is the start of the bottom sheet
    showModalBottomSheet(context: context,builder: (BuildContext bc) {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState /*You can rename this!*/) {
      return Container(
        height: MediaQuery
            .of(context)
            .size
            .height * .90,
        child: Column(
            children: [
              Container(
                  child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.clear_outlined, color: Colors.black,
                              size: cancelIconSize),
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
                                    ))
                            )
                        ),
                      ]),
                  decoration: BoxDecoration(
                    color: blueGrey5,
                    borderRadius: const BorderRadius.only(
                      topLeft: const Radius.circular(bottonSheetRadius),
                      topRight: const Radius.circular(bottonSheetRadius),
                    ),)
              ),
              SizedBox(height: 60.0),
              Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: textFieldHeight,
                    width: textFieldWidth,
                    child: TextField(
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
                          )
                      ),),
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
                    child: TextField(
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
                          )

                      ),
                    ),
                  )),
              Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: textFieldHeight,
                    width: textFieldWidth,
                    child: TextField(
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
                          )
                      ),
                    ),
                  )),
              Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: textFieldHeight,
                    width: textFieldWidth,
                    child: TextField(
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
                          )
                      ),
                    ),
                  )),
              Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: textFieldHeight,
                    width: textFieldWidth,
                    child: TextField(
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
                          )
                      ),
                    ),
                  )),
              Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: textFieldHeight,
                    width: textFieldWidth,
                    child: TextField(
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
                          )
                      ),
                    ),
                  )),
              SizedBox(height: 10.0),
              Align(
                alignment: Alignment.centerLeft,
                  child:Container(
                    margin: const EdgeInsets.only(left: 38.0),
                      child: Text ("Gender",
                          style: TextStyle(
                            color: Colors.black54,
                            fontFamily: textFont,
                            fontSize: RadioTitleSize,
                            fontWeight: FontWeight.bold,
                          ))
                  )
              ),
              Container(
                margin: const EdgeInsets.only(left:28.0),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Radio(
                      value: 1,
                      groupValue: id,
                      onChanged: (val) {
                        setState(() {
                          radioButtonItem = gender[0];
                          id = 1;
                        });
                      },
                    ),
                    Text(
                      gender[0],
                      style: TextStyle(
                        color: Colors.black54,
                        fontFamily: textFont,
                        fontSize: textFieldSize,
                      ),),

                    Radio(
                      value: 2,
                      groupValue: id,
                      onChanged: (val) {
                        setState(() {
                          radioButtonItem = gender[1];
                          id = 2;
                        });
                      },
                    ),
                    Text(
                      gender[1],
                      style:  TextStyle(
                        color: Colors.black54,
                        fontFamily: textFont,
                        fontSize: textFieldSize,
                      ),),

                    Radio(
                      value: 3,
                      groupValue: id,
                      onChanged: (val) {
                        setState(() {
                          radioButtonItem = gender[2];
                          id = 3;
                        });
                      },
                    ),
                    Text(
                      gender[2],
                      style: TextStyle(
                        color: Colors.black54,
                        fontFamily: textFont,
                        fontSize: textFieldSize,
                      ),),
                  ],
                ),),
            SizedBox(height:10),
            Container(
                margin: const EdgeInsets.only(left:22.0),
                child:Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        activeColor: green,//Colors.blue,
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },),
                      Text(agreement,
                          style:TextStyle(
                            fontSize:loginSize,
                            fontFamily: textFont,
                          )),
                      Text(agreement1,
                          style:TextStyle(
                            color: Colors.blue,
                            fontSize:loginSize,
                            fontFamily: textFont,
                            fontWeight: FontWeight.bold,
                          )),
                    ])
            ),
            SizedBox(height:20),
            Container(
              margin: const EdgeInsets.only(left:170),
                child:FloatingActionButton.extended(
                  backgroundColor: blueGrey3,
                  foregroundColor: Colors.white,
                  onPressed: () {
                    // Respond to button press
                  },
                  label: Row(
                    children: <Widget>[Text("SIGN UP"), SizedBox(width:5),Icon(Icons.arrow_forward)],
                  ),
                )
            )

            ]),
      );
    });
    },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(bottonSheetRadius),
      ),
      backgroundColor: textfieldColor,
      isScrollControlled: true,
    );
  }
}