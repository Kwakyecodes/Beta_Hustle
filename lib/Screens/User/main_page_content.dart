import 'dart:convert';

import 'package:beta_hustle/Screens/User/pushrequests.dart';
import 'package:beta_hustle/models/db_ref.dart';
import 'package:beta_hustle/models/job_descriptions.dart';
import 'package:beta_hustle/Screens/Both/requestui.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List jobinfo = [];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double percent = 0.0;
  String _selectedItem = "";

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final List<Job> jobList = Job.getJob();
  @override
  Widget build(BuildContext context) {
    final firebaseUser = Provider.of<User>(context, listen: false);

    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: false,
      backgroundColor: Color(0xFFE5E5E5),
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: StreamBuilder(
                      stream: jobsRef.child(firebaseUser.uid).onValue,
                      builder: (context, AsyncSnapshot<Event> snapshot) {
                        if (snapshot.hasData) {
                          print("Data on the way");
                          jobinfo.clear();
                          DataSnapshot dataValues = snapshot.data!.snapshot;
                          Map<String, dynamic> values = {};
                          values = Map<String, dynamic>.from(dataValues.value);
                          if (values.isNotEmpty || values.length != 0) {
                            values.forEach((key, values) {
                              jobinfo.add(values);
                            });
                          }
                          return ListView.builder(
                              padding: EdgeInsets.only(bottom: 55),
                              shrinkWrap: true,
                              itemCount: jobinfo.length,
                              itemBuilder: (BuildContext context, int index) {
                                return index == 0
                                    ? HandCard(context)
                                    : Stack(children: [
                                        JobCard(index, context),
                                        Positioned(
                                            top: 35.0,
                                            right: 15,
                                            child: JobImage(
                                                jobList[index].images[1])),
                                      ]);
                              });
                        } else if (snapshot.hasError) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          Text("List...");
                        }
                        return Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
                ],
              ),
              //SizedBox(height: 100,),
            ],
          ),
        ),
      ),
    );
  }
}

Widget HandCard(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 5.0, bottom: 6),
    child: Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              top: BorderSide(
                color: Colors.grey,
                width: 0.6,
              ),
              bottom: BorderSide(width: 0.6, color: Colors.grey))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Icon(
              Icons.account_circle,
              size: 50,
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Container(
            width: 230,
            child: ElevatedButton(
              child: Text(
                "Need A Hand?",
                style: TextStyle(
                    fontFamily: 'Lobster',
                    fontSize: 16,
                    color: Colors.blueGrey.shade900),
              ),
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/pushrequests', (route) => false),
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed))
                      return Colors.blueGrey.shade700;
                    return Colors.white;
                  }),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0))),
                  side: MaterialStateProperty.all(
                      BorderSide(color: Colors.black54))),
            ),
          )
        ],
      ),
    ),
  );
}

Widget JobCard(int index, BuildContext context) {
  return InkWell(
      child: Container(
    margin: EdgeInsets.only(left: 1, right: 1),
    width: MediaQuery.of(context).size.width,
    height: 170,
    child: Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 5.0),
        child: Container(
          width: 200,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      jobinfo[index]["title"],
                      style: TextStyle(
                          fontFamily: "Lobster",
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.blueGrey.shade900),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Container(
                        width: 200,
                        child: Flexible(
                          child: Text(
                            jobinfo[index]["description"],
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Container(
                      child: IconButton(
                        icon: Icon(Icons.bookmark_add_outlined),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      child: IconButton(
                        icon: Icon(Icons.favorite_border_outlined),
                        onPressed: () {},
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ),
  ));

  onTap:
  () {
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => //JobsListViewDetails(
    //             //jobName: jobinfo[0]["title"], job: jobinfo[1]["description"])));
  };
}

Widget JobImage(String imageUrl) {
  return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ));
}

// class JobsListViewDetails extends StatelessWidget {
//   final String jobName;
//   final Job? job;
//   const JobsListViewDetails({Key? key, this.jobName = '', this.job})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           JobDetailsThumbnail(thumbnail: job!.images[1]),
//           JobDetailsHaderWithPoster(job: job),
//           HorizontalLine(),
//           JobsDetailsCast(
//             job: job,
//           ),
//           HorizontalLine(),
//           JobDetailsExtraPosters(
//             posters: job!.images,
//           )
//         ],
//       ),
//       // body: Container(
//       //   child: Center(
//       //     child: RaisedButton(
//       //       child: Text(this.movie!.director),
//       //       onPressed: (){
//       //         Navigator.pop(context);
//       //
//       //                    },
//       //     ),
//       //   ),
//       //
//       // ),
//     );
//   }
// }
