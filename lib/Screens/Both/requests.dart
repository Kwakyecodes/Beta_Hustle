import 'package:beta_hustle/models/db_ref.dart';
import 'package:beta_hustle/models/text_editing_control.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/models/colors.dart';
import '/models/constants.dart';
import 'package:flutter/rendering.dart';
import '/models/strings.dart';
import '/models/lists.dart';

List jobinfo = [];

class Requests extends StatefulWidget {
  @override
  _RequestsState createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  ScrollController _scrollBottomBarController = new ScrollController();
  List<String> methodOfPayment = ["Cash", "Momo", "Bundle"];
  String radioButtonItem = "Cash";
  int id = 1;

  int _value20 = 1;
  int _value00 = 1;
  bool seeTextBox = false;
  bool seeProfileLink = false;

  Widget containerContent(String name, String describe, String pricetype,
      String amount, String enddate, String endtime, BuildContext context) {
    final firebaseUser = Provider.of<User>(context, listen: false);
    return Container(
        height: requestsContainerSize,
        //color: Colors.cyanAccent,
        margin: const EdgeInsets.only(
          left: 30.0,
          right: 30.0,
          top: 8,
          bottom: 8,
        ),
        width: MediaQuery.of(context).size.width - 100,
        child: InkWell(
          onTap: () {
            completedJobsDetails(
                context, name, describe, enddate, pricetype, amount);
          },
          child: Align(
              alignment: Alignment.centerLeft,
              child: Column(children: <Widget>[
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //margin: const EdgeInsets.only(left:20),
                        Text(
                          name,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: listTopStringsSize,
                            fontFamily: textFont,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),

                        //SizedBox(width: 50),
                        Text(
                          "GH₵ " + amount + "( " + pricetype + " )",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: listTopStringsSize,
                            fontFamily: textFont,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                ),
                SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                      ),
                      Container(
                        //margin: const EdgeInsets.only(left:20),
                        child: Text(
                          "Deadline: " + enddate + " " + endtime,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: listBottomStringsSize,
                            fontFamily: textFont,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ]),
              ])),
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(bottom: BorderSide(width: 0.8, color: Colors.black12))
            // borderRadius: const BorderRadius.only(
            //   topLeft: const Radius.circular(5),
            //   topRight: const Radius.circular(5),
            // ),
            ));
  }

  Widget listContainer(String status, BuildContext context) {
    final firebaseUser = Provider.of<User>(context, listen: false);
    return Container(
      child: StreamBuilder(
          stream: jobsRef
              .child(firebaseUser.uid)
              .orderByChild("status/value")
              .equalTo(status)
              .onValue,
          builder: (context, AsyncSnapshot<Event> snapshot) {
            if (snapshot.hasData) {
              print("Error on the way");
              jobinfo.clear();
              DataSnapshot dataValues = snapshot.data!.snapshot;
              Map<String, dynamic> values =
                  Map<String, dynamic>.from(dataValues.value);
              if (values.isEmpty) {
                return CircularProgressIndicator();
              } else {
                values.forEach((key, values) {
                  jobinfo.add(values);
                });
                return ListView.builder(
                    padding: EdgeInsets.only(bottom: 55),
                    shrinkWrap: true,
                    itemCount: jobinfo == null ? 0 : jobinfo.length,
                    itemBuilder: (context, index) {
                      return containerContent(
                          jobinfo[index]["title"],
                          jobinfo[index]["description"],
                          jobinfo[index]["price"]["type"],
                          jobinfo[index]["price"]["value"],
                          jobinfo[index]["deadline"]["date"],
                          jobinfo[index]["deadline"]["time"],
                          context);
                    });
              }
            }
            return CircularProgressIndicator();
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          //resizeToAvoidBottomInset: true,
          appBar: AppBar(
            toolbarHeight: 18,
            backgroundColor: blueGrey5,
            flexibleSpace: TabBar(
              indicatorColor: green,
              labelPadding: const EdgeInsets.only(top: 10, bottom: 10),
              unselectedLabelColor: Colors.white,
              labelColor: green,
              tabs: [
                Text("Pending",
                    style: TextStyle(
                      fontFamily: textFont,
                      fontSize: forgotPasswordSize,
                    )),
                Text("Ongoing",
                    style: TextStyle(
                      fontFamily: textFont,
                      fontSize: forgotPasswordSize,
                    )),
                Text("History",
                    style: TextStyle(
                      fontFamily: textFont,
                      fontSize: forgotPasswordSize,
                    )),
              ],
            ),
          ),

          body: TabBarView(
            children: [
              listContainer("pending", context),
              listContainer("ongoing", context),
              listContainer("history", context),
            ],
          ),
        ),
      ),
    );
  }

  void completedJobsDetails(context, String name, String describe,
      String enddate, String pricetype, String amount) {
    // this is the start of the bottom sheet
    showModalBottomSheet(
      context: context,
      builder: (
        BuildContext bc,
      ) {
        return StatefulBuilder(builder: (BuildContext context,
            StateSetter setState /*You can rename this!*/) {
          return Container(
              height: MediaQuery.of(context).size.height * .90,
              child: ListView(
                  controller: _scrollBottomBarController,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: Icon(Icons.clear_outlined,
                            color: Colors.black, size: cancelIconSize),
                        onPressed: () {
                          Navigator.pushNamed(context, '/jobRequest');
                        },
                      ),
                    ),
                    SizedBox(height: 25),
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(name,
                                style: TextStyle(
                                  fontFamily: textFont,
                                  fontSize: jobDetailsTitleSize,
                                  fontWeight: FontWeight.bold,
                                )),
                            Text("by, " + "Handyman",
                                style: TextStyle(
                                  fontFamily: textFont,
                                  fontSize: forgotPasswordSize,
                                )),
                          ]),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: Text("Start: ",
                            style: TextStyle(
                              fontFamily: textFont,
                              fontSize:
                                  listBottomStringsSize, //forgotPasswordSize,
                            )),
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          child: Text("End: " + enddate,
                              style: TextStyle(
                                fontFamily: textFont,
                                fontSize:
                                    listBottomStringsSize, //forgotPasswordSize,
                              )),
                        )),
                    SizedBox(height: 20),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          child: Flex(
                            direction: Axis.vertical,
                            children: [
                              Flexible(
                                child: Text(
                                    "Description: " +
                                        (describe.length > 10
                                            ? describe.substring(0, 10) + "..."
                                            : "Description: " + describe),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontFamily: textFont,
                                      fontSize:
                                          listBottomStringsSize, //forgotPasswordSize,
                                    )),
                              ),
                            ],
                          ),
                        )),
                    Container(height: 5, color: textFieldColor),
                    SizedBox(height: 35),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            child: Text(payment,
                                style: TextStyle(
                                  fontFamily: textFont,
                                  fontWeight: FontWeight.bold,
                                  fontSize: textFieldSize,
                                )))),
                    SizedBox(height: 20),
                    Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(serviceFee,
                                  style: TextStyle(
                                    fontFamily: textFont,
                                    fontSize: forgotPasswordSize,
                                  )),
                              Text("GH₵ 75.00",
                                  style: TextStyle(
                                    fontFamily: textFont,
                                    fontSize: forgotPasswordSize,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ])),
                    SizedBox(height: 7),
                    Container(width: 355, height: 1, color: textFieldColor),
                    SizedBox(height: 7),
                    Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(otherCost,
                                  style: TextStyle(
                                    fontFamily: textFont,
                                    fontSize: forgotPasswordSize,
                                  )),
                              Text("GH₵ 100.00",
                                  style: TextStyle(
                                    fontFamily: textFont,
                                    fontSize: forgotPasswordSize,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ])),
                    SizedBox(height: 7),
                    Container(width: 355, height: 1, color: textFieldColor),
                    SizedBox(height: 7),
                    Container(
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Method of Payment",
                                  style: TextStyle(
                                    fontFamily: textFont,
                                    fontSize: forgotPasswordSize,
                                  )),
                              Text("GH₵ 175.00",
                                  style: TextStyle(
                                    fontFamily: textFont,
                                    fontSize: forgotPasswordSize,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ])),
                    Container(height: 5, color: textFieldColor),
                    SizedBox(height: 35),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            child: Text("Report an issue",
                                style: TextStyle(
                                  fontFamily: textFont,
                                  fontWeight: FontWeight.bold,
                                  fontSize: textFieldSize,
                                )))),
                    SizedBox(height: 10),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton(
                                isExpanded: true,
                                value: _value20,
                                items: [
                                  DropdownMenuItem(
                                    child: Text(
                                        "Select the issue you have with this job"),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Issue 2"),
                                    value: 2,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Issue 3"),
                                    value: 3,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Other"),
                                    value: 4,
                                  )
                                ],
                                onChanged: (int? value) {
                                  setState(() {
                                    _value20 = value!;
                                    if (_value20 == 4) {
                                      seeTextBox = true;
                                    } else {
                                      seeTextBox = false;
                                    }
                                  });
                                },
                              ),
                            ))),
                    Visibility(
                      visible: seeTextBox,
                      child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 100,
                            width: 340,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
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
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black45,
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          )),
                    ),
                    SizedBox(height: 10),
                    Container(
                        //width: 50,
                        margin: const EdgeInsets.only(left: 250, right: 10),
                        child: FloatingActionButton.extended(
                            backgroundColor: blueGrey3,
                            foregroundColor: Colors.white,
                            onPressed: () {
                              // Respond to button press
                            },
                            label: Text("SEND REPORT"))),
                    SizedBox(height: 50),
                    SizedBox(height: 50),
                    SizedBox(height: 50),
                    SizedBox(height: 50),
                    // listContainer(),
                  ]));
        });
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(bottonSheetRadius),
      ),
      backgroundColor: Colors.white,
      isScrollControlled: true,
    );
  }

  void pendingJobsDetails(context, int name, int date, int time, int amount) {
    // this is the start of the bottom sheet
    showModalBottomSheet(
      context: context,
      builder: (
        BuildContext bc,
      ) {
        return StatefulBuilder(builder: (BuildContext context,
            StateSetter setState /*You can rename this!*/) {
          return Container(
              height: MediaQuery.of(context).size.height * .75,
              child:
                  ListView(controller: _scrollBottomBarController, children: <
                      Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(Icons.clear_outlined,
                        color: Colors.black, size: cancelIconSize),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(nameOfJobs[name],
                              style: TextStyle(
                                fontFamily: textFont,
                                fontSize: jobDetailsTitleSize,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Text(dates[date] + ", " + times[time],
                            style: TextStyle(
                              fontFamily: textFont,
                              fontSize:
                                  listBottomStringsSize, //forgotPasswordSize,
                            )),
                      ]),
                ),
                SizedBox(height: 10),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 15),
                      child: Text(longSentence,
                          style: TextStyle(
                            fontFamily: textFont,
                            fontSize:
                                listBottomStringsSize, //forgotPasswordSize,
                          )),
                    )),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: Text("Service Fee:" + " " + "GH₵ 100.00",
                          style: TextStyle(
                            fontFamily: textFont,
                            fontSize: forgotPasswordSize, //forgotPasswordSize,
                          )),
                    )),
                Container(height: 5, color: textFieldColor),
                SizedBox(height: 35),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: Text(handymen,
                            style: TextStyle(
                              fontFamily: textFont,
                              fontWeight: FontWeight.bold,
                              fontSize: textFieldSize,
                            )))),
                SizedBox(height: 15),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 100),
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton(
                            isExpanded: true,
                            value: _value00,
                            items: [
                              DropdownMenuItem(
                                child:
                                    Text("Select the handyman of your choice"),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text("handyman 1" + "," + " bid"),
                                value: 2,
                              ),
                              DropdownMenuItem(
                                child: Text("handyman 2" + "," + " bid"),
                                value: 3,
                              ),
                              DropdownMenuItem(
                                child: Text("handyman 3" + "," + " bid"),
                                value: 4,
                              )
                            ],
                            onChanged: (int? value) {
                              setState(() {
                                _value00 = value!;
                                if (_value00 != 1) {
                                  seeProfileLink = true;
                                } else {
                                  seeProfileLink = false;
                                }
                              });
                            },
                          ),
                        ))),
                Visibility(
                    visible: seeProfileLink,
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: const EdgeInsets.only(right: 30, bottom: 10),
                          child: Text("Visit handyman $_value00's profile page",
                              style: TextStyle(
                                fontFamily: textFont,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: blueGrey3,
                              )),
                        ))),

                Container(height: 5, color: textFieldColor),
                SizedBox(height: 35),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 15),
                        child: Text(finalisePrice,
                            style: TextStyle(
                              fontFamily: textFont,
                              fontWeight: FontWeight.bold,
                              fontSize: textFieldSize,
                            )))),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        margin: const EdgeInsets.only(
                            left: 30, right: 30, bottom: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(serviceFee + ":",
                                  style: TextStyle(
                                    fontFamily: textFont,
                                    fontSize: forgotPasswordSize,
                                  )),
                              Container(
                                height: 30,
                                width: 100,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: TextField(
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: textFont,
                                      fontSize: textFieldSize,
                                    ),
                                    showCursor: true,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black45,
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              )
                            ]))),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        margin: const EdgeInsets.only(
                            left: 30, right: 30, bottom: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(otherCost + ":",
                                  style: TextStyle(
                                    fontFamily: textFont,
                                    fontSize: forgotPasswordSize,
                                  )),
                              Container(
                                height: 30,
                                width: 100,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                  ),
                                  child: TextField(
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: textFont,
                                      fontSize: textFieldSize,
                                    ),
                                    showCursor: true,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black45,
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              )
                            ]))),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        margin: const EdgeInsets.only(
                            left: 30, right: 40, bottom: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(total + ":",
                                  style: TextStyle(
                                    fontFamily: textFont,
                                    fontSize: forgotPasswordSize,
                                  )),
                              Text("GH₵ 100.00",
                                  style: TextStyle(
                                    fontFamily: textFont,
                                    fontSize: forgotPasswordSize,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ]))),
                Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Radio(
                        value: 1,
                        groupValue: id,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItem = methodOfPayment[0];
                            id = 1;
                          });
                        },
                      ),
                      Text(
                        methodOfPayment[0],
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
                            radioButtonItem = methodOfPayment[1];
                            id = 2;
                          });
                        },
                      ),
                      Text(
                        methodOfPayment[1],
                        style: TextStyle(
                          color: Colors.black54,
                          fontFamily: textFont,
                          fontSize: textFieldSize,
                        ),
                      ),
                      Radio(
                        value: 3,
                        groupValue: id,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItem = methodOfPayment[2];
                            id = 3;
                          });
                        },
                      ),
                      Text(
                        methodOfPayment[2],
                        style: TextStyle(
                          color: Colors.black54,
                          fontFamily: textFont,
                          fontSize: textFieldSize,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),
                SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 135,
                          child: FloatingActionButton.extended(
                              backgroundColor: blueGrey3,
                              foregroundColor: Colors.white,
                              onPressed: () {
                                // Respond to button press
                              },
                              label: Text("START JOB")),
                        ),
                        Container(
                          width: 135,
                          child: FloatingActionButton.extended(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            onPressed: () {
                              // Respond to button press
                            },
                            label: Row(
                              children: <Widget>[
                                Text("DELETE"),
                                SizedBox(width: 5),
                                Icon(Icons.delete_forever)
                              ],
                            ),
                          ),
                        )
                      ]),
                ),

                SizedBox(height: 50),
                SizedBox(height: 50),

                // listContainer(),
              ]));
        });
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(bottonSheetRadius),
      ),
      backgroundColor: Colors.white,
      isScrollControlled: true,
    );
  }

  void ongoingJobsDetails(context, int name, int date, int time, int amount) {
    // this is the start of the bottom sheet
    showModalBottomSheet(
      context: context,
      builder: (
        BuildContext bc,
      ) {
        return StatefulBuilder(builder: (BuildContext context,
            StateSetter setState /*You can rename this!*/) {
          return Container(
              height: MediaQuery.of(context).size.height * .90,
              child: ListView(
                  controller: _scrollBottomBarController,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: Icon(Icons.clear_outlined,
                            color: Colors.black, size: cancelIconSize),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    SizedBox(height: 25),
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(nameOfJobs[name],
                                style: TextStyle(
                                  fontFamily: textFont,
                                  fontSize: jobDetailsTitleSize,
                                  fontWeight: FontWeight.bold,
                                )),
                            Text(dates[date] + ", " + times[time],
                                style: TextStyle(
                                  fontFamily: textFont,
                                  fontSize:
                                      listBottomStringsSize, //forgotPasswordSize,
                                )),
                          ]),
                    ),
                    SizedBox(height: 10),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 35),
                          child: Text(longSentence,
                              style: TextStyle(
                                fontFamily: textFont,
                                fontSize:
                                    listBottomStringsSize, //forgotPasswordSize,
                              )),
                        )),
                    Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(serviceFee,
                                  style: TextStyle(
                                    fontFamily: textFont,
                                    fontSize: listBottomStringsSize,
                                  )),
                              Text("GH₵ 75.00",
                                  style: TextStyle(
                                    fontFamily: textFont,
                                    fontSize: listBottomStringsSize,
                                  )),
                            ])),
                    SizedBox(height: 7),
                    Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(otherCost,
                                  style: TextStyle(
                                    fontFamily: textFont,
                                    fontSize: listBottomStringsSize,
                                  )),
                              Text("GH₵ 100.00",
                                  style: TextStyle(
                                    fontFamily: textFont,
                                    fontSize: listBottomStringsSize,
                                  )),
                            ])),
                    SizedBox(height: 4),
                    Container(
                        margin: const EdgeInsets.only(left: 18, right: 18),
                        width: 200,
                        height: 1,
                        color: textFieldColor),
                    SizedBox(height: 4),
                    Container(
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 30),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Method of Payment",
                                  style: TextStyle(
                                    fontFamily: textFont,
                                    fontSize: listBottomStringsSize,
                                  )),
                              Text("GH₵ 175.00",
                                  style: TextStyle(
                                    fontFamily: textFont,
                                    fontSize: listBottomStringsSize,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ])),
                    Container(height: 5, color: textFieldColor),
                    SizedBox(height: 35),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(children: [
                              Text("Contact ",
                                  style: TextStyle(
                                    fontFamily: textFont,
                                    fontSize: textFieldSize,
                                  )),
                              Text("Name of Handyman",
                                  style: TextStyle(
                                    fontFamily: textFont,
                                    fontWeight: FontWeight.bold,
                                    fontSize: textFieldSize,
                                  )),
                            ]))),
                    SizedBox(height: 15),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            margin: const EdgeInsets.only(
                                left: 40, right: 20, bottom: 80),
                            child: Row(children: [
                              Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://googleflutter.com/sample_image.jpg'),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              SizedBox(width: 100),
                              Column(children: [
                                Container(
                                  //width:120,
                                  child: FloatingActionButton.extended(
                                    backgroundColor: blueGrey3,
                                    foregroundColor: Colors.white,
                                    onPressed: () {
                                      // Respond to button press
                                    },
                                    label: Icon(Icons.message_outlined),
                                  ),
                                ),
                                SizedBox(height: 15),
                                Container(
                                  //width:100,
                                  child: FloatingActionButton.extended(
                                    backgroundColor: blueGrey3,
                                    foregroundColor: Colors.white,
                                    onPressed: () {
                                      // Respond to button press
                                    },
                                    label: Icon(Icons.call),
                                  ),
                                )
                              ]),
                            ]))),
                    Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 350,
                          child: FloatingActionButton.extended(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            onPressed: () {
                              // Respond to button press
                            },
                            label: Text("CANCEL JOB"),
                          ),
                        )),

                    SizedBox(height: 50),
                    SizedBox(height: 50),
                    SizedBox(height: 50),
                    SizedBox(height: 50),
                    // listContainer(),
                  ]));
        });
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(bottonSheetRadius),
      ),
      backgroundColor: Colors.white,
      isScrollControlled: true,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<BuildContext>('context', context));
    properties.add(DiagnosticsProperty<BuildContext>('context', context));
  }
}
