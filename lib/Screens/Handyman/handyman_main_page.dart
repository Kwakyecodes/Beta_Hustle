import 'package:beta_hustle/Screens/Both/requests.dart';
import 'package:beta_hustle/models/db_ref.dart';
import 'package:beta_hustle/models/job_descriptions.dart';

import 'package:beta_hustle/Screens/Both/requestui.dart';
import 'package:beta_hustle/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/src/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'handyman_page_content.dart';

bool userstate = true;
Future<void> main() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  userstate = prefs.getBool('userstate')!;
}

class HandyMainPage extends StatefulWidget {
  const HandyMainPage({Key? key}) : super(key: key);

  @override
  _HandyMainPageState createState() => _HandyMainPageState();
}

class _HandyMainPageState extends State<HandyMainPage> {
  int currentIndex = 0;
  IconData icon1 = Icons.home;
  IconData icon2 = Icons.favorite_border;
  IconData icon3 = Icons.add_box_outlined;
  IconData icon4 = Icons.history;
  IconData icon5 = Icons.settings_outlined;

  Color color1 = Colors.white;
  Color color2 = Colors.blueGrey;
  Color color3 = Colors.blueGrey;
  Color color4 = Colors.blueGrey;
  Color color5 = Colors.blueGrey;
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final List<Job> jobList = Job.getJob();
  List userinfo = [];
  @override
  Widget build(BuildContext context) {
    final NUser user = NUser();
    final box = GetStorage();
    final firebaseUser = context.watch<User>();
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: false,

      drawer: Container(
        color: Colors.white,
        width: 250.0,
        child: Drawer(
          child: ListView(
            children: [
              Container(
                height: 165.0,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.account_circle,
                        size: 60,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      StreamBuilder(
                          stream: usersRef.child(firebaseUser.uid).onValue,
                          builder: (context, AsyncSnapshot<Event> snapshot) {
                            if (snapshot.hasData) {
                              userinfo.clear();
                              DataSnapshot dataValues = snapshot.data!.snapshot;
                              Map<dynamic, dynamic> values = dataValues.value;
                              if (values != null) {
                                values.forEach((key, values) {
                                  userinfo.add(values);
                                });
                              }
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Welcome " +
                                        userinfo[1] +
                                        userstate.toString(),
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6.0,
                                  ),
                                  Text("Edit Profile"),
                                ],
                              );
                            }
                            return Text("User...");
                          })
                    ],
                  ),
                ),
              ),
              Divider(),
              SizedBox(
                height: 12,
              ),
              ListTile(
                leading: Icon(Icons.account_balance_wallet_outlined),
                title: Text(
                  "Wallet",
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              ListTile(
                leading: Icon(Icons.history),
                title: Text(
                  "My Orders",
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text(
                  "Messages",
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text(
                  "Help",
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text(
                  "About",
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              InkWell(
                child: ListTile(
                  leading: Icon(Icons.settings_power_outlined),
                  title: Text(
                    "Sign Out",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                onTap: () {
                  user.signout();
                },
              )
            ],
          ),
        ),
      ),

      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   iconTheme: IconThemeData(
      //     color: Colors.white
      //   ),
      //   actions: [
      //        Container(
      //          margin: EdgeInsets.only(left: 50),
      //          child: GestureDetector(
      //            child: Icon(Icons.message),
      //          ),
      //        ),
      //     SizedBox(width: 15,)
      //   ],
      // ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  height: 60,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          scaffoldKey.currentState!.openDrawer();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 6.0,
                                  spreadRadius: 0.5,
                                  offset: Offset(0.7, 0.7),
                                )
                              ]),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Text(
                              "B",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Lobster",
                                  fontSize: 26,
                                  color: Colors.blueGrey.shade900),
                            ),
                            radius: 22,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 110,
                      ),
                      Container(
                        child: IconButton(
                          icon: Icon(
                            Icons.notifications_active_outlined,
                            color: Colors.blueGrey.shade900,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        child: IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.blueGrey.shade900,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        child: IconButton(
                          icon: Icon(
                            Icons.message,
                            color: Colors.blueGrey.shade900,
                          ),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Navigator(
                    key: Job.mainListNav,
                    initialRoute: '/homepage',
                    onGenerateRoute: (RouteSettings settings) {
                      Widget page;
                      switch (settings.name) {
                        case '/homepage':
                          page = HomePage();
                          break;
                        case '/favoritespage':
                          page = HomePage();
                          break;
                        case '/shoppinglistpage':
                          page = HomePage();
                          break;
                        // case '/requestpage':
                        //   page=Requests();
                        //   break;
                        default:
                          page = HomePage();
                          break;
                      }
                      return PageRouteBuilder(
                          pageBuilder: (_, __, ___) => page,
                          transitionDuration: const Duration(seconds: 0));
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade900,
                ),

                height: 55,
                //padding: EdgeInsets.only(bottom: 10),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Material(
                        color: Colors.blueGrey.shade900,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        child: IconButton(
                          icon: Icon(
                            icon1,
                            color: color1,
                          ),
                          onPressed: () {
                            setState(() {
                              currentIndex = 1;
                              if (currentIndex == 1) {
                                icon1 = Icons.home;
                                icon2 = Icons.favorite_outline;
                                icon3 = Icons.add_box;
                                icon4 = Icons.history;
                                icon5 = Icons.settings_outlined;
                                color1 = Colors.white;
                                color2 = Colors.blueGrey;
                                color3 = Colors.blueGrey;
                                color4 = Colors.blueGrey;
                                color5 = Colors.blueGrey;
                              }
                            });

                            Job.mainListNav.currentState
                                ?.pushReplacementNamed('/homepage');
                          },
                        ),
                      ),
                    ),
                    Container(
                      child: Material(
                        color: Colors.blueGrey.shade900,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        child: IconButton(
                          icon: Icon(
                            icon2,
                            color: color2,
                          ),
                          onPressed: () {
                            setState(() {
                              currentIndex = 2;
                              if (currentIndex == 2) {
                                icon1 = Icons.home_outlined;
                                icon2 = Icons.favorite;
                                icon3 = Icons.add_box;
                                icon4 = Icons.history;
                                icon5 = Icons.settings_outlined;
                                color1 = Colors.blueGrey;
                                color2 = Colors.white;
                                color3 = Colors.blueGrey;
                                color4 = Colors.blueGrey;
                                color5 = Colors.blueGrey;
                              }
                            });

                            Job.mainListNav.currentState
                                ?.pushReplacementNamed('/favoritespage');
                          },
                        ),
                      ),
                    ),
                    Container(
                      child: Material(
                        color: Colors.blueGrey.shade900,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        child: IconButton(
                          icon: Icon(
                            icon3,
                            color: color3,
                          ),
                          onPressed: () {
                            setState(() {
                              currentIndex = 3;
                              if (currentIndex == 3) {
                                icon1 = Icons.home_outlined;
                                icon2 = Icons.favorite_outline;
                                icon3 = Icons.add_box;
                                icon4 = Icons.history;
                                icon5 = Icons.settings_outlined;
                                color1 = Colors.blueGrey;
                                color2 = Colors.blueGrey;
                                color3 = Colors.white;
                                color4 = Colors.blueGrey;
                                color5 = Colors.blueGrey;
                              }
                            });
                            Job.mainListNav.currentState
                                ?.pushReplacementNamed('/settingspage');
                          },
                        ),
                      ),
                    ),
                    Container(
                      child: Material(
                        color: Colors.blueGrey.shade900,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        child: IconButton(
                          icon: Icon(icon4, color: color4),
                          onPressed: () {
                            setState(() {
                              currentIndex = 4;
                              if (currentIndex == 4) {
                                icon1 = Icons.home_outlined;
                                icon2 = Icons.favorite_outline;
                                icon3 = Icons.add_box;
                                icon4 = Icons.history;
                                icon5 = Icons.settings_outlined;
                                color1 = Colors.blueGrey;
                                color2 = Colors.blueGrey;
                                color3 = Colors.blueGrey;
                                color4 = Colors.white;
                                color5 = Colors.blueGrey;
                              }
                            });
                            Job.mainListNav.currentState
                                ?.pushReplacementNamed('/requestpage');
                          },
                        ),
                      ),
                    ),
                    Container(
                      child: Material(
                        color: Colors.blueGrey.shade900,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        child: IconButton(
                          icon: Icon(
                            icon5,
                            color: color5,
                          ),
                          onPressed: () {
                            setState(() {
                              currentIndex = 5;
                              if (currentIndex == 5) {
                                icon1 = Icons.home_outlined;
                                icon2 = Icons.favorite_outline;
                                icon3 = Icons.add_box;
                                icon4 = Icons.history;
                                icon5 = Icons.settings;
                                color1 = Colors.blueGrey;
                                color2 = Colors.blueGrey;
                                color3 = Colors.blueGrey;
                                color4 = Colors.blueGrey;
                                color5 = Colors.white;
                              }
                            });

                            Job.mainListNav.currentState
                                ?.pushReplacementNamed('/settingspage');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   selectedIconTheme: IconThemeData(
      //     color: Colors.black
      //   ),
      //   backgroundColor: Colors.blueGrey.shade900,
      //    showSelectedLabels: false,
      //    showUnselectedLabels: false,
      //   currentIndex: currentIndex,
      //  selectedItemColor: Colors.white,
      //
      //  type: BottomNavigationBarType.fixed,
      //   onTap: (index)=>setState(()=>currentIndex=index),
      //   items: [
      //     BottomNavigationBarItem(
      //
      //         icon: InkWell(
      //             child: Icon(Icons.home_outlined),
      //           onTap: (){
      //          Job.mainListNav.currentState?.pushReplacementNamed('/homepage');
      //            }
      //         ),
      //         label: "Home",
      //         backgroundColor: Colors.blueGrey.shade900,
      //
      //     ),
      //     BottomNavigationBarItem(
      //         icon: InkWell(
      //           child: Icon(Icons.favorite_border_outlined),
      //           onTap: (){
      //             Job.mainListNav.currentState?.pushReplacementNamed('/homepage');
      //           },
      //         ),
      //         label: "Home",
      //         backgroundColor: Colors.blueGrey.shade900,
      //
      //     ),
      //     BottomNavigationBarItem(
      //         icon: InkWell(child: Icon(Icons.add_box_outlined),
      //             onTap: (){
      //               Job.mainListNav.currentState?.pushReplacementNamed('/homepage');
      //             }),
      //         label: "Home",
      //         backgroundColor: Colors.blueGrey.shade900
      //     ),
      //     BottomNavigationBarItem(
      //         icon: InkWell(child: Icon(Icons.history_outlined),
      //             onTap: (){
      //               Job.mainListNav.currentState?.pushReplacementNamed('/homepage');
      //             }),
      //
      //         label: "Home",
      //         backgroundColor: Colors.blueGrey.shade900
      //     ),
      //     BottomNavigationBarItem(
      //         icon: InkWell(child: Icon(Icons.settings_outlined),
      //             onTap: (){
      //               Job.mainListNav.currentState?.pushReplacementNamed('/homepage');
      //             }
      //         ),
      //         label: "Home",
      //         backgroundColor: Colors.blueGrey.shade900
      //     )
      //
      //   ],
      // ),
    );
  }
}
