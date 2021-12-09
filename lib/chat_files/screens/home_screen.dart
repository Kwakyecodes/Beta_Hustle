import 'package:beta_hustle/chat_files/widgets/recent_chats.dart';
import 'package:beta_hustle/models/colors.dart';
import 'package:beta_hustle/models/constants.dart';
import 'package:beta_hustle/models/strings.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueGrey4,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
          iconSize: cancelIconSize,
          color:Colors.white,
        ),
        centerTitle: true,
        title: Text('Chats',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontFamily: textFont,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        backgroundColor: blueGrey4,
      ),
      body: Column(
        children: <Widget>[
          //CategorySelector(),
          SizedBox(height:10),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  //FavoriteContacts(),
                  RecentChats(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
