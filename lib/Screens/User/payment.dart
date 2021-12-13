import 'package:beta_hustle/models/colors.dart';
import 'package:beta_hustle/models/constants.dart';
import 'package:beta_hustle/models/strings.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class Payment extends StatefulWidget {
  @override
  _Payment createState() => _Payment();
}

class _Payment extends State<Payment> {
  bool momoVisible = true;


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
          title: const Text(payment,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: textFont,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: blueGrey4,
        ),

        body: SafeArea(
          child: Container(
              child: Column (
                children: [
                  SizedBox(height:50),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.only(left: 25),
                      child:Text("Payment methods",
                          style: TextStyle(
                            fontFamily: textFont,
                            fontWeight: FontWeight.bold,
                            fontSize: textFieldSize,
                            color: Colors.black,
                          )
                      )
                    )
                  ),
                  SizedBox(height:25),
                  Align(
                    alignment: Alignment.centerLeft,
                    child:Container(
                      margin:const EdgeInsets.only(left: 25,right:25,bottom:12),
                      child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                          Icon(
                            Icons.payments_outlined,
                            color: Colors.black54,
                            size: cancelIconSize,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: Text("Cash",
                            style: TextStyle(
                              fontSize: textFieldSize,
                              fontFamily: textFont,
                              color: Colors.black,
                            )),
                          ),
                          SizedBox(width:170),
                          Icon(
                            Icons.verified,
                            color: Colors.green,
                            size: cancelIconSize,
                          ),
                        ]
                      ))
                  ),
                  Container(
                      height:1,
                      width:345,
                      color: textFieldColor
                  ),
                  Visibility(
                    visible: momoVisible,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child:Container(
                            margin:const EdgeInsets.only(left: 25,right:25,top:12,bottom:12),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:[
                                  Icon(
                                    Icons.payment,
                                    color: Colors.black54,
                                    size: cancelIconSize,
                                  ),
                                  Text("Mobile money",
                                      style: TextStyle(
                                        fontSize: textFieldSize,
                                        fontFamily: textFont,
                                        color: Colors.black,
                                      )),
                                  SizedBox(width:100),
                                  Icon(
                                    Icons.verified,
                                    color: Colors.green,
                                    size: cancelIconSize,
                                  ),
                                ]
                            ))
                    ),
                  ),
                  Visibility(
                    visible: momoVisible,
                    child:Container(
                        height:1,
                        width:345,
                        color: textFieldColor
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child:Container(
                          margin:const EdgeInsets.only(left: 25,right:25,top:12),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                Icon(
                                  Icons.payment,
                                  color: Colors.black54,
                                  size: cancelIconSize,
                                ),
                                Text("Add mobile money account",
                                    style: TextStyle(
                                      fontSize: textFieldSize,
                                      fontFamily: textFont,
                                      color: Colors.black,
                                    )),
                                //SizedBox(width:20),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Colors.black54,
                                  size: cancelIconSize,
                                ),
                              ]
                          ))
                  ),


                ]
              )
          ),

        )

    );
  }

}
