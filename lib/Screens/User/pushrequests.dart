import 'package:beta_hustle/models/colors.dart';
import 'package:beta_hustle/models/constants.dart';
import 'package:beta_hustle/models/form_validation.dart';
import 'package:beta_hustle/models/strings.dart';
import 'package:beta_hustle/models/text_editing_control.dart';
import 'package:beta_hustle/services/places.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class PushRequests extends StatefulWidget {
  @override
  _PushRequestsState createState() => _PushRequestsState();
}

class _PushRequestsState extends State<PushRequests> {
  int _value30 = 1;
  int _value31 = 1;

  // CustomPicker({DateTime currentTime, LocaleType locale}): super(locale: locale){
  //   this.currentTime = currentTime ?? DateTime.now();
  //   this.setLeftIndex(this.currentTime.hour);
  //   this.setMiddleIndex(this.currentTime.minute);
  //   this.setRightIndex(this.currentTime.second);
  // }

  Widget build(BuildContext context) {
    //looks like the keyboard is covering the text field again and there is
    return Scaffold(
        //some bottom overflow problem. can someone(Eben) please do your trick to fix it? thanks :)
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back),
            iconSize: cancelIconSize,
            color: Colors.white,
          ),
          centerTitle: true,
          title: const Text(createRequest,
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
                  width: 170,
                  margin: const EdgeInsets.only(left: 10, top: 20),
                  child: Row(children: [
                    SizedBox(width: 8),
                    Icon(
                      Icons.location_on,
                      color: blueGrey1,
                      size: cancelIconSize,
                    ),
                    Container(
                      width: 120,
                      child: TextFormField(
                        onChanged: (val) {
                          final Places places;
                          places = Places();
                          places.findPlace(destination.text);
                        },
                        keyboardType: TextInputType.text,
                        controller: destination,
                        decoration: InputDecoration(
                          hintText: "Where is the work Destination?",
                        ),
                      ),
                    )
                  ]),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: blueGrey5,
                    ),
                    color: blueGrey5,
                    borderRadius: BorderRadius.circular(30),
                  ),
                )),
            SizedBox(height: 60),
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Container(
                    width: 320,
                    child: TextFormField(
                      onChanged: (val) {},
                      keyboardType: TextInputType.text,
                      controller: title,
                      decoration: InputDecoration(
                        hintText: "Title of Job?",
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                  ),
                )),
            SizedBox(height: 20),
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  height: 110,
                  width: 340,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: TextField(
                      controller: description,
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
                        hintText: "Short Description of job",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black45,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                  ),
                )),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(children: [
                    Text("Max number of handymen",
                        style: TextStyle(
                          fontSize: textFieldSize,
                          fontFamily: textFont,
                          color: Colors.black,
                        )),
                    SizedBox(width: 15),
                    Container(
                      width: 80,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: TextField(
                          keyboardType: TextInputType.number,
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
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ])),
            ),
            SizedBox(height: 20),
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 190,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                maxLines: null,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: textFont,
                                  fontSize: textFieldSize,
                                ),
                                showCursor: true,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  hintText: "Price in Ghana cedis",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black45,
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                          Transform.scale(
                              scale: 0.8,
                              child: LiteRollingSwitch(
                                value: true,
                                textOn: "Negotiable",
                                textOff: "Fixed",
                                colorOn: blueGrey5,
                                colorOff: blueGrey3,
                                iconOn: Icons.change_circle_outlined,
                                iconOff: Icons.check,
                                animationDuration: Duration(milliseconds: 600),
                                onChanged: (bool state) {
                                  print('turned ${(state) ? 'yes' : 'no'}');
                                },
                              )),
                        ]))),
            SizedBox(height: 20),
            Align(
                //backend person should implement a date and time setter for this.
                alignment: Alignment
                    .centerLeft, //you can create textViews under this to
                child: Container(
                    //to display the date and time
                    margin: const EdgeInsets.only(
                        left: 22, top: 10), //use an implementer that allows you
                    child: Text(
                        "Set the deadline for this job", //to do both date and time together
                        style: TextStyle(
                          fontFamily: textFont,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: blueGrey2,
                        )))),
            SizedBox(height: 100),
            Align(
                alignment: Alignment.center,
                child: Container(
                    width: 250,
                    child: FloatingActionButton.extended(
                        backgroundColor: blueGrey3,
                        foregroundColor: Colors.black,
                        onPressed: () {
                          // Respond to button press

                          final formValidate validate = formValidate(
                              jobtitle: title.text,
                              jobDescription: description.text,
                              maxNumofmen: int.tryParse(maxNumofmen.text),
                              price: double.tryParse(price.text));
                          bool valid = validate.pushRequestform();
                          if (valid = true) {
                            print("Good form!!");
                          }
                        },
                        label: Text("PUSH SERVICE REQUEST"))))
          ])),
        )));
  }
}
