import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import 'package:beta_hustle/models/colors.dart';
import 'package:beta_hustle/models/constants.dart';
import 'package:beta_hustle/models/db_ref.dart';
import 'package:beta_hustle/models/strings.dart';

class UserProfile extends StatefulWidget {
  @override
  UserProfileState createState() => UserProfileState();
}

class UserProfileState extends State<UserProfile> {
  bool hideOldPassword = true;
  bool hideNewPassword = true;
  bool hideConfirmedPassword = true;
  List userinfo = [];

  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back),
            iconSize: cancelIconSize,
            color: Colors.white,
          ),
          centerTitle: true,
          title: const Text(profile,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: textFont,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: blueGrey4,
        ),
        body: SingleChildScrollView(
            child: SafeArea(
                child: Container(
                    child: Column(children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  margin: const EdgeInsets.only(left: 20, top: 40, right: 20),
                  child: Row(children: [
                    Stack(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 35.0,
                          backgroundImage: AssetImage('assets/images/greg.jpg'),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            margin: const EdgeInsets.only(left: 55, top: 45),
                            child: Icon(Icons.camera_alt,
                                color: Colors
                                    .blue, //Colors.black87,//Colors.deepOrangeAccent,
                                size: 20),
                          ),
                        )
                      ],
                    ),
                    SingleChildScrollView(
                      child: Column(children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: StreamBuilder(
                                stream:
                                    usersRef.child(firebaseUser.uid).onValue,
                                builder:
                                    (context, AsyncSnapshot<Event> snapshot) {
                                  if (snapshot.hasData) {
                                    print("Error on the way");
                                    userinfo.clear();
                                    DataSnapshot dataValues =
                                        snapshot.data!.snapshot;
                                    Map<String, dynamic> values =
                                        Map<String, dynamic>.from(
                                            dataValues.value);
                                    if (values != null) {
                                      values.forEach((key, values) {
                                        userinfo.add(values);
                                      });
                                    }
                                    return Container(
                                        margin: const EdgeInsets.only(
                                            left: 1, bottom: 10),
                                        child: Text(
                                          userinfo[1] + "  " + userinfo[4],
                                          style: TextStyle(
                                            fontFamily: textFont,
                                            color: Colors.black,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ));
                                  }

                                  return Text("user...");
                                })),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                                margin: const EdgeInsets.only(right: 50),
                                child: Text(
                                  "  " + userinfo[3],
                                  style: TextStyle(
                                    fontFamily: textFont,
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ))),
                      ]),
                    )
                  ]))),
          SizedBox(height: 15),
          Container(
              margin: const EdgeInsets.only(right: 20, left: 20),
              height: 1,
              color: textFieldColor),
          SizedBox(height: 14),
          Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(children: [
                    Icon(Icons.email_outlined, color: Colors.black38, size: 23),
                    SizedBox(width: 15),
                    Text(
                      userinfo[0],
                      style: TextStyle(
                        fontFamily: textFont,
                        color: Colors.black,
                        fontSize: 15,
                      ),
                      overflow: TextOverflow.ellipsis,
                    )
                  ]))),
          SizedBox(height: 20),
          Container(height: 5, color: textFieldColor),
          SizedBox(height: 20),
          Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: InkWell(
                      onTap: () {
                        editProfile(context);
                      },
                      child: Text("Edit profile/Change password",
                          style: TextStyle(
                            fontFamily: textFont,
                            color: Colors.green,
                            fontSize: textFieldSize,
                          ))))),
          // Align(
          //     alignment: Alignment.centerLeft,
          //     child: Container(
          //         margin: const EdgeInsets.only(left:20,right:20),
          //         child: Text("Change password",
          //             style: TextStyle(
          //               fontFamily: textFont,
          //               color:Colors.green,
          //               fontSize: textFieldSize,
          //             ))
          //     )
          // ),
          SizedBox(height: 25),
          Container(height: 5, color: textFieldColor),
          SizedBox(height: 20),
        ])))));
  }

  void editProfile(context) {
    //this the bottom sheet
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return StatefulBuilder(builder: (BuildContext context,
            StateSetter setState /*You can rename this!*/) {
          return Container(
              height: MediaQuery.of(context).size.height * .90,
              child: SingleChildScrollView(
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
                              margin: const EdgeInsets.only(left: 85.0),
                              child: Text("Edit Profile",
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
                SizedBox(height: 30),
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
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white)),
                            labelText: hintFirstName,
                            labelStyle: TextStyle(
                              color: Colors.black54,
                              fontSize: labelSize,
                              fontFamily: textFont,
                            )),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(5))),
                ),
                SizedBox(height: 15),
                Align(
                    alignment: Alignment.center,
                    child: Container(
                        //margin: const EdgeInsets.only(left: 20, right:20),
                        height: textFieldHeight,
                        width: textFieldWidth,
                        child: TextField(
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: textFont,
                            fontSize: textFieldSize,
                          ),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                //borderRadius: BorderRadius.circular(30)
                              ),
                              labelText: hintLastName,
                              labelStyle: TextStyle(
                                color: Colors.black54,
                                fontSize: labelSize,
                                fontFamily: textFont,
                              )),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(5)))),
                SizedBox(height: 15),
                Align(
                    alignment: Alignment.center,
                    child: Container(
                        //margin: const EdgeInsets.only(left: 20, right:20),
                        height: textFieldHeight,
                        width: textFieldWidth,
                        child: TextField(
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: textFont,
                            fontSize: textFieldSize,
                          ),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                //borderRadius: BorderRadius.circular(30)
                              ),
                              hintText: "+233200000080",
                              hintStyle: TextStyle(
                                fontFamily: textFont,
                                color: Colors.black54,
                                fontSize: 14,
                              ),
                              labelText: hintPhoneNumber,
                              labelStyle: TextStyle(
                                color: Colors.black54,
                                fontSize: labelSize,
                                fontFamily: textFont,
                              )),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(5)))),
                SizedBox(height: 15),
                Align(
                    alignment: Alignment.center,
                    child: Container(
                        //margin: const EdgeInsets.only(left: 20, right:20),
                        height: textFieldHeight,
                        width: textFieldWidth,
                        child: TextField(
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: textFont,
                            fontSize: textFieldSize,
                          ),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                              ),
                              labelText: hintEmail,
                              labelStyle: TextStyle(
                                color: Colors.black54,
                                fontSize: labelSize,
                                fontFamily: textFont,
                              )),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(5)))),
                SizedBox(height: 30),
                Container(
                  height: 5,
                  color: textFieldColor,
                ),
                SizedBox(height: 15),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        margin: const EdgeInsets.only(left: 30),
                        child: Text("Change password",
                            style: TextStyle(
                              fontFamily: textFont,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 18,
                            )))),
                SizedBox(height: 20),
                Align(
                    alignment: Alignment.center,
                    child: Container(
                        //margin: const EdgeInsets.only(left: 20, right:20),
                        height: textFieldHeight,
                        width: textFieldWidth,
                        child: TextField(
                          obscureText: hideOldPassword,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: textFont,
                            fontSize: textFieldSize,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            labelText: "Old password",
                            labelStyle: TextStyle(
                              color: Colors.black54,
                              fontSize: labelSize,
                              fontFamily: textFont,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                hideOldPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                //color: Colors.blue,
                              ),
                              onPressed: () {
                                setState(() {
                                  hideOldPassword = !hideOldPassword;
                                });
                              }
                              // Update the state i.e. toggle the state of passwordVisible variable
                              ,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(5)))),
                SizedBox(height: 15),
                Align(
                    alignment: Alignment.center,
                    child: Container(
                        //margin: const EdgeInsets.only(left: 20, right:20),
                        height: textFieldHeight,
                        width: textFieldWidth,
                        child: TextField(
                          obscureText: hideNewPassword,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: textFont,
                            fontSize: textFieldSize,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            labelText: "New password",
                            labelStyle: TextStyle(
                              color: Colors.black54,
                              fontSize: labelSize,
                              fontFamily: textFont,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                hideNewPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                //color: Colors.blue,
                              ),
                              onPressed: () {
                                setState(() {
                                  hideNewPassword = !hideNewPassword;
                                });
                              }
                              // Update the state i.e. toggle the state of passwordVisible variable
                              ,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(5)))),
                SizedBox(height: 15),
                Align(
                    alignment: Alignment.center,
                    child: Container(
                        //margin: const EdgeInsets.only(left: 20, right:20),
                        height: textFieldHeight,
                        width: textFieldWidth,
                        child: TextField(
                          obscureText: hideConfirmedPassword,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: textFont,
                            fontSize: textFieldSize,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            labelText: "Confirm new password",
                            labelStyle: TextStyle(
                              color: Colors.black54,
                              fontSize: labelSize,
                              fontFamily: textFont,
                            ),
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
                                  hideConfirmedPassword =
                                      !hideConfirmedPassword;
                                });
                              }
                              // Update the state i.e. toggle the state of passwordVisible variable
                              ,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(5)))),
                SizedBox(height: 30),
                Container(
                  height: 5,
                  color: textFieldColor,
                ),
                SizedBox(height: 30),
                Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                        margin: const EdgeInsets.only(right: 30),
                        child: FloatingActionButton.extended(
                            backgroundColor: blueGrey3,
                            foregroundColor: Colors.white,
                            onPressed: () {
                              // Respond to button press
                            },
                            label: Text("UPDATE INFORMATION")))),
                SizedBox(height: 70),
                SizedBox(height: 70),
                SizedBox(height: 70),
                SizedBox(height: 70),
              ])));
        });
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(bottonSheetRadius),
      ),
      backgroundColor: Colors.white,
      isScrollControlled: true,
    );
  }
}
