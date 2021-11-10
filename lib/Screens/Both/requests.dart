import 'dart:math';

import 'package:flutter/material.dart';
import 'package:beta_hustle/colors.dart';
import 'package:beta_hustle/constants.dart';
import 'package:flutter/rendering.dart';
import '../../strings.dart';
import 'package:beta_hustle/lists.dart';

class Requests extends StatefulWidget {
  @override
  _RequestsState createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  ScrollController _scrollBottomBarController = new ScrollController();
  int _value = 1;
  bool seeTextBox = false;


  Widget containerContent(int name, int date, int time, int amount,bool cancelled){
    return Container(
      height: requestsContainerSize,
      //color: Colors.cyanAccent,
      margin: const EdgeInsets.only(left:30.0,right: 30.0,top: 8, bottom: 8,),
      width: MediaQuery.of(context).size.width - 100,
    child: InkWell(
    onTap: () {
    jobDetails(context,name, date, time, amount);
    },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Container(
                  //margin: const EdgeInsets.only(left:20),
                  child:Text(nameOfJobs[name],
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: listTopStringsSize,
                      fontFamily: textFont,
                      //fontWeight: FontWeight.bold,
                    ),),
                ),

                //SizedBox(width: 50),
                  Text("GH₵ "+costs[amount],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: listTopStringsSize,
                      fontFamily: textFont,
                      fontWeight: FontWeight.bold,
                    ),),

              ]
            ),
            SizedBox(height:10),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Container(
                    //margin: const EdgeInsets.only(left:20),
                    child:Text(dates[date]+", "+times[time],
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: listBottomStringsSize,
                        fontFamily: textFont,
                        //fontWeight: FontWeight.bold,
                      ),),
                  ),

                  //SizedBox(width: 50),
                  if (cancelled) Text("Job cancelled",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: listBottomStringsSize,
                      fontFamily: textFont,
                    ),) ,
                ]),

          ]
        )

      ),
    ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
        bottom: BorderSide(width: 0.8,color: Colors.black12)
        )
        // borderRadius: const BorderRadius.only(
        //   topLeft: const Radius.circular(5),
        //   topRight: const Radius.circular(5),
        // ),
      ),
    );
  }
  Widget listContainer(){
    return Container(
          child: ListView(
            controller: _scrollBottomBarController,
            children: <Widget>[
              containerContent(0,0,0,0,true),
              containerContent(0,1,1,1,true),
              containerContent(0,2,2,2,false),
              containerContent(1,3,3,3,false),
              containerContent(1,4,4,4,false),
              containerContent(1,5,5,5,false),
              containerContent(2,6,6,6,false),
              containerContent(2,7,7,7,false),
              containerContent(2,8,8,8,true),
              containerContent(3,9,9,9,true),
              containerContent(3,10,10,10,false),
              containerContent(4,11,11,11,false),
              containerContent(4,12,12,12,false),
              containerContent(4,13,13,13,false),
            ],
          ),
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
            bottom: const TabBar(
              indicatorColor: green,
              labelPadding: const EdgeInsets.only(bottom:7),
              unselectedLabelColor: Colors.white,
              labelColor: green,
              tabs: [
                Text("Pending",
                style: TextStyle(
                  fontFamily: textFont,
                  fontSize:forgotPasswordSize,
            )),
                Text("Ongoing",
                    style: TextStyle(
                      fontFamily: textFont,
                      fontSize:forgotPasswordSize,
                    )),
                Text("History",
                    style: TextStyle(
                      fontFamily: textFont,
                      fontSize:forgotPasswordSize,
                    )),
              ],
            ),
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back),
              iconSize: cancelIconSize,
              color:Colors.white,
            ),
            centerTitle: true,
            title: const Text(jobRequestsTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: textFont,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                )),
            backgroundColor: blueGrey5,
          ),
          body: TabBarView(
            children: [
              listContainer(),
              listContainer(),
              listContainer(),
            ],
          ),
        ),
      ),
    );

  }
  void jobDetails(context,int name, int date, int time, int amount) {// this is the start of the bottom sheet
    showModalBottomSheet(context: context, builder: (BuildContext bc,) {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState /*You can rename this!*/) {
        return Container(
            height: MediaQuery
            .of(context)
            .size
            .height * .90,
          child: ListView(
            controller: _scrollBottomBarController,
            children: <Widget>[
              Align(
                alignment : Alignment.centerLeft,
              child:IconButton(
                icon: Icon(Icons.clear_outlined, color: Colors.black,
                    size: cancelIconSize),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              ),
              SizedBox(height:25),
              Container (
                margin: const EdgeInsets.only(left:20,right: 20),
                child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(nameOfJobs[name],
                          style: TextStyle(
                            fontFamily: textFont,
                            fontSize: jobDetailsTitleSize,
                            fontWeight: FontWeight.bold,
                          )),
                      Text("by, "+"Handyman",
                          style:TextStyle(
                            fontFamily: textFont,
                            fontSize:forgotPasswordSize,
                          )),
                    ]
                ),
              ),
              SizedBox(height:20),
              Align(
                alignment: Alignment.centerLeft,
                child:Container (
                  margin: const EdgeInsets.only(left:20,right: 20),
                  child:Text("Start: "+dates[date]+", "+times[time],
                      style: TextStyle(
                        fontFamily: textFont,
                        fontSize: listBottomStringsSize,//forgotPasswordSize,
                      )),),
              ),
              SizedBox(height:20),
              Align(
                alignment: Alignment.centerLeft,
                child:Container (
                  margin: const EdgeInsets.only(left:20,right: 20,bottom:20),
                  child:Text("End: "+dates[date]+", "+times[time],
                      style: TextStyle(
                        fontFamily: textFont,
                        fontSize: listBottomStringsSize,//forgotPasswordSize,
                      )),)),
              Container(
                height:5,
                color: textfieldColor
              ),
              SizedBox(height:35),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    margin: const EdgeInsets.only(left:20,right: 20),
                  child: Text(payment,
                    style: TextStyle(
                      fontFamily: textFont,
                      fontWeight: FontWeight.bold,
                      fontSize: textFieldSize,
                    )))),
              SizedBox(height:20),
              Container(
                  margin: const EdgeInsets.only(left:20,right: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
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
                      )
                      ),
                    ]
                  )),
              SizedBox(height:7),
              Container(
                  width: 355,
                  height:1,
                  color: textfieldColor
              ),
              SizedBox(height:7),
              Container(
                  margin: const EdgeInsets.only(left:20,right: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
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
                            )
                        ),
                      ]
                  )),
              SizedBox(height:7),
              Container(
                  width: 355,
                  height:1,
                  color: textfieldColor
              ),
              SizedBox(height:7),
              Container(
                  margin: const EdgeInsets.only(left:20,right: 20,bottom: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
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
                            )
                        ),
                      ]
                  )),
              Container(
                  height:5,
                  color: textfieldColor
              ),
              SizedBox(height:35),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      margin: const EdgeInsets.only(left:20,right: 20),
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
                margin: const EdgeInsets.only(left: 20,right:20),
                child: ButtonTheme(
                  alignedDropdown: true,
                  child:DropdownButton(
                    isExpanded: true,
                    value: _value,
                    items: [
                      DropdownMenuItem(
                        child: Text("Select the issue you have with this job"),
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
                        _value = value!;
                        if (_value==4){
                          seeTextBox = true;}
                        else{
                          seeTextBox = false;}
            });
                    },
                  ),

                )

              )
            ),
              Visibility(
                visible: seeTextBox,
                child:  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height:100,
                      width: 340,
                      child: Padding(padding: EdgeInsets.only(left:10,right:10),
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: textFont,
                            fontSize: textFieldSize,
                          ),
                          showCursor: false,
                          //cursorColor: Colors.blue,
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
                ),
              ),
              SizedBox(height: 10),
              Container(
                  //width: 50,
                  margin: const EdgeInsets.only(left:250,right: 10),
                  child:FloatingActionButton.extended(
                    backgroundColor: blueGrey3,
                    foregroundColor: Colors.white,
                    onPressed: () {
                      // Respond to button press
                    },
                    label:Text("SEND REPORT")
                  )
              ),
              SizedBox(height: 50),
              SizedBox(height: 50),
              SizedBox(height: 50),
              SizedBox(height: 50),
              // listContainer(),

            ]
          )
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

