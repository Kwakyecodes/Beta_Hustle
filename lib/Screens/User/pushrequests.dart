import 'package:beta_hustle/models/colors.dart';
import 'package:beta_hustle/models/constants.dart';
import 'package:beta_hustle/models/form_validation.dart';
import 'package:beta_hustle/models/job.dart';
import 'package:beta_hustle/models/strings.dart';
import 'package:beta_hustle/models/text_editing_control.dart';
import 'package:beta_hustle/notifications/alerts.dart';
import 'package:beta_hustle/services/location.dart';
import 'package:beta_hustle/services/places.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:provider/provider.dart';

class PushRequests extends StatefulWidget {
  @override
  _PushRequestsState createState() => _PushRequestsState();
}

class _PushRequestsState extends State<PushRequests> {
  int _value30 = 1;
  int _value31 = 1;
  String moneytype = "";
  final Alerts alerts = Alerts();
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
                  child: SingleChildScrollView(
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
                            // final Places places;
                            // places = Places();
                            // places.findPlace(destination.text);

                            final Locate locate;
                            locate = Locate();
                            locate.fetchLocation();
                          },
                          keyboardType: TextInputType.text,
                          controller: destination,
                          decoration: InputDecoration(
                            hintText: "Endpoint",
                          ),
                        ),
                      ),
                      Icon(
                        Icons.location_on,
                        color: blueGrey1,
                        size: cancelIconSize,
                      ),
                      Container(
                        width: 120,
                        child: TextFormField(
                          onChanged: (val) {},
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "StartUp point?",
                          ),
                        ),
                      ),
                    ]),
                  ),
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
                          controller: maxNumofmen,
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
                                controller: price,
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
                                  moneytype = state ? "negotiate" : "fixed";
                                },
                              )),
                        ]))),
            SizedBox(height: 20),
            Align(
              child: TextFormField(
                controller: Datetext,
                decoration: InputDecoration(
                  hintText: "Select Date",
                  border: OutlineInputBorder(),
                  hintStyle:
                      TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                readOnly: true,
                onTap: () async {
                  final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2022),
                      lastDate: DateTime(2032));
                  setState(() {
                    if (date == null) {
                      alerts.user_toast("Please select a date");
                    } else {
                      Datetext.text = "${date.day}-${date.month}-${date.year}";
                    }
                  });
                },
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Align(
              child: TextFormField(
                controller: TimeText,
                decoration: InputDecoration(
                  hintText: "Select Time",
                  border: OutlineInputBorder(),
                  hintStyle:
                      TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                readOnly: true,
                onTap: () async {
                  final time = await showTimePicker(
                      context: context, initialTime: TimeOfDay.now());

                  setState(() {
                    if (time == null) {
                      alerts.user_toast("Please select a time");
                    } else {
                      TimeText.text = time.format(context);
                    }
                  });
                },
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 100),
            Align(
                alignment: Alignment.center,
                child: Container(
                    width: 250,
                    child: FloatingActionButton.extended(
                        backgroundColor: blueGrey3,
                        foregroundColor: Colors.black,
                        onPressed: () async {
                          // Respond to button press

                          final formValidate validate = formValidate(
                              jobtitle: title.text,
                              jobDescription: description.text,
                              maxNumofmen: int.tryParse(maxNumofmen.text),
                              price: double.tryParse(price.text));
                          bool valid = validate.pushRequestform();

                          if (valid = true) {
                            final Job job = Job(
                                title: title.text,
                                description: description.text,
                                maxNumofmen: maxNumofmen.text,
                                price: price.text,
                                priceType: moneytype,
                                enddate: Datetext.text,
                                endtime: TimeText.text);
                            job.addJob(context);
                          }
                        },
                        label: Text("PUSH SERVICE REQUEST"))))
          ])),
        )));
  }
}
