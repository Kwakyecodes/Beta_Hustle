//both handymen and users will be able to see this.
//that is why it is in the both folder
//however only handymen will be able change(edit) the information here
//just like a facebook profile, others can view your profile but only you see the option to make changes to the information there
import 'package:beta_hustle/models/colors.dart';
import 'package:beta_hustle/models/constants.dart';
import 'package:beta_hustle/models/strings.dart';
import 'package:flutter/material.dart';

class HandymanProfile extends StatefulWidget {
  @override
  HandymanProfileState createState() => HandymanProfileState();
}

class HandymanProfileState extends State<HandymanProfile> {
  bool isOwner = false; // when this is true, anyone(should be the handyman) viewing the screen will be able make edits to the skills and about texts
  bool hideOldPassword = true;
  bool hideNewPassword = true;
  bool hideConfirmedPassword = true;
  // if (isOwner){
  //   String title = "something";
  // }else{
  //   String title = "something else";
  // }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back),
            iconSize: cancelIconSize,
            color:Colors.white,
          ),
          centerTitle: true,
          title: Text('${isOwner ? profile : "Anthony's Profile"}',
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
                    child: Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  margin: const EdgeInsets.only(left:20,top:40,right:20),
                                  child:Row(
                                      children: [
                                        Stack(
                                          children: <Widget>[
                                            CircleAvatar(
                                              radius: 35.0,
                                              backgroundImage: AssetImage('assets/images/greg.jpg'),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child:Container(
                                                margin: const EdgeInsets.only(left:55,top:45),
                                                child:Icon(
                                                    Icons.camera_alt,
                                                    color: Colors.blue,//Colors.black87,//Colors.deepOrangeAccent,
                                                    size: 20),
                                              ),)
                                          ],
                                        ),
                                        Column(
                                            children:[
                                              Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Container(
                                                      margin: const EdgeInsets.only(left:10,bottom:10),
                                                      child: Text(userName,
                                                        style:TextStyle(
                                                          fontFamily: textFont,
                                                          color: Colors.black,
                                                          fontSize:22,
                                                          fontWeight:FontWeight.bold,
                                                        ),
                                                        overflow: TextOverflow.ellipsis,
                                                      )
                                                  )),
                                              Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Container(
                                                      margin: const EdgeInsets.only(right:50),
                                                      child: Row(
                                                        children:[
                                                          Text(rating,
                                                            style:TextStyle(
                                                              fontFamily: textFont,
                                                              color: Colors.black,
                                                              fontSize:18,
                                                            )),
                                                            Icon(
                                                              Icons.star_rate_rounded,
                                                              color: deepBlue,//Colors.yellowAccent,
                                                              size: cancelIconSize,
                                                            ),
                                                        ])
                                                  )),
                                            ])
                                      ])
                              )),
                          SizedBox(height:15),
                          Container(
                              margin: const EdgeInsets.only(right:20,left:20),
                              height:1,
                              color: textFieldColor
                          ),
                          SizedBox(height:14),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                margin: const EdgeInsets.only(left:20,right:20),
                                    child:Text("Running errands, Math tutoring, Fashion designing, Graphic design.",
                                      style:TextStyle(
                                        fontFamily: textFont,
                                        color: Colors.black,
                                        fontSize:15,
                                      ),
                                      maxLines: null,
                                )
                              )
                          ),
                          SizedBox(height: 20),
                          Container(
                              height:5,
                              color: textFieldColor
                          ),
                          SizedBox(height:15),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin: const EdgeInsets.only(left:20, right: 20,bottom:15),
                              child: Text("About",
                                style:TextStyle(
                                  fontFamily: textFont,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize:15,
                                ),
                            )
                          )),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  margin: const EdgeInsets.only(left:20,right:20),
                                  child:Text("If given an opportunity I will show all my skills and abilities to achieve organisation objectives with full determination "
                                      "and commitment and enhance my skills with time for personal growth as well. To prove myself as a sincere and energetic person through"
                                      "dedication, hard work and continuous learning that benefits not only myself by my organization too.",
                                    style:TextStyle(
                                      fontFamily: textFont,
                                      color: Colors.black,
                                      fontSize:15,
                                    ),
                                    maxLines: null,
                                  )
                              )
                          ),
                          SizedBox(height:20),
                          Container(
                              height:5,
                              color: textFieldColor
                          ),
                          SizedBox(height:20),
                          Visibility(
                            visible: isOwner,
                            child:Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                    margin: const EdgeInsets.only(left:20,right:20),
                                    child: InkWell(
                                        onTap: (){
                                          editProfile(context);
                                        },
                                        child: Text("Edit skills/about",
                                            style: TextStyle(
                                              fontFamily: textFont,
                                              color:Colors.green,
                                              fontSize: textFieldSize,
                                            ))
                                    )
                                )
                            )),
                          Visibility(
                            visible: isOwner,
                            child:SizedBox(height:20)
                          ),
                          Visibility(
                            visible: isOwner,
                            child:Container(
                                height:5,
                                color: textFieldColor
                            )
                          ),
                          Visibility(
                            visible: isOwner,
                            child:SizedBox(height:15)
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin: const EdgeInsets.only(left:20,right:20),
                              child: Text("Ratings & Reviews",
                                style:TextStyle(
                                  fontFamily: textFont,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize:15,
                                ),
                            )
                          )),
                          SizedBox(height:20),
                          Align( //note for backend person: you can make a widget of this to makes things easier for you :)
                            alignment: Alignment.centerLeft,
                            child: Container(
                              color: textFieldColor,
                              margin: const EdgeInsets.only(left:20,right:20,bottom:10),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                      children: [
                                        Row(
                                            children: [
                                              Text("Ama",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: textFont,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  )),
                                              SizedBox(width:50),
                                              Text(rating,
                                                  style:TextStyle(
                                                    fontFamily: textFont,
                                                    color: Colors.black,
                                                    fontSize:15,
                                                  )),
                                              Icon(
                                                Icons.star_rate_rounded,
                                                color: deepBlue,//Colors.yellowAccent,
                                                size: 18,
                                              ),
                                            ]
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("Thank you man. I really loved your design for my website. And it only took 3 days!",
                                            style:TextStyle(
                                              fontFamily: textFont,
                                              color: Colors.black,
                                              fontSize:15,
                                            ),
                                            maxLines: null,
                                          ),
                                        )
                                      ])
                              )
                            )
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  color: textFieldColor,
                                  margin: const EdgeInsets.only(left:20,right:20,bottom:10),
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                          children: [
                                            Row(
                                                children: [
                                                  Text("Adwoa",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontFamily: textFont,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black,
                                                      )),
                                                  SizedBox(width:50),
                                                  Text(rating,
                                                      style:TextStyle(
                                                        fontFamily: textFont,
                                                        color: Colors.black,
                                                        fontSize:15,
                                                      )),
                                                  Icon(
                                                    Icons.star_rate_rounded,
                                                    color: deepBlue,//Colors.yellowAccent,
                                                    size: 18,
                                                  ),
                                                ]
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child:Text("Great math teacher.",
                                                style:TextStyle(
                                                  fontFamily: textFont,
                                                  color: Colors.black,
                                                  fontSize:15,
                                                ),
                                                maxLines: null,
                                              ),
                                            )
                                          ])
                                  )
                              )
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  color: textFieldColor,
                                  margin: const EdgeInsets.only(left:20,right:20,bottom:10),
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                          children: [
                                            Row(
                                                children: [
                                                  Text("Issah",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontFamily: textFont,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black,
                                                      )),
                                                  SizedBox(width:50),
                                                  Text(rating,
                                                      style:TextStyle(
                                                        fontFamily: textFont,
                                                        color: Colors.black,
                                                        fontSize:15,
                                                      )),
                                                  Icon(
                                                    Icons.star_rate_rounded,
                                                    color: deepBlue,//Colors.yellowAccent,
                                                    size: 18,
                                                  ),
                                                ]
                                            ),
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child:Text("",
                                                  style:TextStyle(
                                                    fontFamily: textFont,
                                                    color: Colors.black,
                                                    fontSize:15,
                                                  ),
                                                  maxLines: null,
                                                ),
                                            )
                                          ])
                                  )
                              )
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  color: textFieldColor,
                                  margin: const EdgeInsets.only(left:20,right:20,bottom:10),
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                          children: [
                                            Row(
                                                children: [
                                                  Text("Torku",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontFamily: textFont,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black,
                                                      )),
                                                  SizedBox(width:50),
                                                  Text(rating,
                                                      style:TextStyle(
                                                        fontFamily: textFont,
                                                        color: Colors.black,
                                                        fontSize:15,
                                                      )),
                                                  Icon(
                                                    Icons.star_rate_rounded,
                                                    color: deepBlue,//Colors.yellowAccent,
                                                    size: 18,
                                                  ),
                                                ]
                                            ),
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child:Text("Terrible handyman. Completed the work two days after the deadline.",
                                                  style:TextStyle(
                                                    fontFamily: textFont,
                                                    color: Colors.black,
                                                    fontSize:15,
                                                  ),
                                                  maxLines: null,
                                                ),
                                            )
                                          ])
                                  )
                              )
                          ),
                          SizedBox(height:15),
                          Visibility(
                            visible: isOwner,
                            child:Container(
                                height:5,
                                color: textFieldColor
                            )
                          ),
                          Visibility(
                            visible: isOwner,
                            child:SizedBox(height:20),
                          ),
                          Visibility(
                            visible: isOwner,
                            child:Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                    margin: const EdgeInsets.only(left:20,right:20),
                                    child: Text("Log out",
                                        style: TextStyle(
                                          fontFamily: textFont,
                                          color:Colors.red,
                                          fontSize: textFieldSize,
                                        ))
                                )
                            ),
                          ),
                          SizedBox(height:50),
                        ]
                    )
                )
            )
        )

    );

  }

  void editProfile(context) { //this the bottom sheet
    showModalBottomSheet(context: context, builder: (BuildContext bc){
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState /*You can rename this!*/) {
            return Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * .90,
                child: SingleChildScrollView (
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
                                            margin: const EdgeInsets.only(left: 85.0),
                                            child: Text("Edit Profile",
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
                          SizedBox(height:30),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                margin: const EdgeInsets.only(left:20),
                                height:80,
                                width: textFieldWidth,
                                child: Padding(padding: EdgeInsets.only(left:10,right:10),
                                  child: TextField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: textFont,
                                      fontSize: textFieldSize,
                                    ),
                                    showCursor: true,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      hintText: "Skills",
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              )
                          ),
                          SizedBox(height:20),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                margin: const EdgeInsets.only(left:20),
                                height:150,
                                width: textFieldWidth,
                                child: Padding(padding: EdgeInsets.only(left:10,right:10),
                                  child: TextField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: textFont,
                                      fontSize: textFieldSize,
                                    ),
                                    showCursor: true,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      hintText: "About",
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              )
                          ),
                          SizedBox(height:40),
                          Align(
                              alignment: Alignment.centerRight,
                              child:Container(
                                  margin: const EdgeInsets.only(right:30),
                                  child:FloatingActionButton.extended(
                                      backgroundColor: blueGrey3,
                                      foregroundColor: Colors.white,
                                      onPressed: () {
                                        // Respond to button press
                                      },
                                      label: Text("UPDATE INFORMATION")
                                  )
                              )
                          ),
                        ]

                    ))
            );

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
