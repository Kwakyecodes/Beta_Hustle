import 'package:beta_hustle/models/colors.dart';
import 'package:beta_hustle/models/constants.dart';
import 'package:beta_hustle/models/job_descriptions.dart';
import 'package:beta_hustle/Screens/Both/requestui.dart';
import 'package:beta_hustle/models/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateTime selectedDate=DateTime.now();
ScrollController _scrollBottomBarController = new ScrollController();
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double percent =0.0;
  String _selectedItem="";
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final List<Job> jobList = Job.getJob();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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

                    child: ListView.builder(

                        padding: EdgeInsets.only(bottom: 55),
                        shrinkWrap: true,

                        itemCount: jobList.length,
                        itemBuilder: (BuildContext context,int index){
                          int number= jobList.length;
                          return index==0?HandCard(context,number):

                          Stack(
                              children:[

                                JobCard(jobList[index],context),
                                Favorite(),
                                Positioned(
                                    top: 25.0,
                                    left:30,
                                    child: JobImage(jobList[index].poster)

                                ),




                              ]
                          );

                        }),
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
Widget HandCard(BuildContext context,int number){
  return Padding(
    padding: const EdgeInsets.only(top:5.0, bottom: 6),
    child: Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border( top: BorderSide(
            color: Colors.grey,
            width: 0.6,
          ),
              bottom: BorderSide(
                  width: 0.6,
                  color: Colors.grey
              )
          )


      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Icon(Icons.account_circle,size: 50,),
          ),
          SizedBox(width: 8,),
          Container(
            alignment: Alignment.center,
            width: 230,
            child: Text("You have ${number-1} Orders Available",style: TextStyle(
                fontFamily: textFont,
                fontSize: 16.5,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey.shade900
            ),)
          )
        ],
      ),

    ),
  );
}


Widget JobCard(Job job,BuildContext context){

  return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 1,right: 1),
        width: MediaQuery.of(context).size.width,
        height: 170,
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 17,

                left: 10.0
            ),
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

                        Padding(
                          padding: const EdgeInsets.only(left: 75.0),
                          child: Text(job.username,style: TextStyle(
                              fontFamily: "Lobster",
                              fontSize: 18,
                              color: Colors.blueGrey.shade400
                          ),),
                        ),

                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(left: 72.0),
                          child: Icon(Icons.location_on_outlined,size: 15,),
                        ),
                        Text(job.location,style: TextStyle(
                          fontFamily: textFont,
                          fontWeight: FontWeight.w500

                        ),)
                      ],

                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.only(left: 25,top: 20),

                            child: Text("${job.requestTitle.toUpperCase()}",style: TextStyle(
                              fontSize: 18,
                              color: Colors.blueGrey.shade900,
                              fontFamily: textFont,
                              fontWeight: FontWeight.bold
                            ),),
                          ),
                        ),


                      ],

                    ),
                    HorizontalLine(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('YOU\'ll EARN',style: TextStyle(
                          fontFamily: textFont,
                          fontSize: 13,
                          //color: Colors.blueGrey
                        ), ),
                        Text('DEADLINE          ',
                          style: TextStyle(
                          fontFamily: textFont,
                          fontSize: 13,
                          //color: Colors.blueGrey
                        ), ),

                      ],

                    ),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("GH₵ ${job.price}",

                          style: TextStyle(
                            fontFamily: textFont,
                            fontWeight: FontWeight.bold,
                            color: blueGrey5,


                          ),
                        ),
                        Text("${job.endDate}",

                          style: TextStyle(
                            fontFamily: textFont,
                            fontWeight: FontWeight.bold,
                            color: blueGrey5,


                          ),
                        ),
                      ],
                    ),
                    //SizedBox(height: 5,),
                    // Row(
                    //   children: [
                    //     Container(
                    //       child: IconButton(
                    //         icon:Icon(Icons.bookmark_add_outlined),
                    //         onPressed: (){},
                    //       ),
                    //     ),
                    //     Container(
                    //       child: IconButton(
                    //         icon:Icon(Icons.favorite_border_outlined),
                    //         onPressed: (){},
                    //       ),
                    //     )
                    //   ],
                    // )


                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      onTap: (){
        JobsListViewDetails(context,job);

      }
  );
}
Widget JobImage(String imageUrl){
  return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        shape: BoxShape.circle,

        image: DecorationImage(
          image: AssetImage(imageUrl

          ),
          fit: BoxFit.cover,
        ),
      ));
}
void JobsListViewDetails (context,Job job){

 Color color = Colors.green;
 if (job.negotiability=="Negotiable"){
   color = Colors.green;
 }
 else{
   color = Colors.black38;
 }

 showModalBottomSheet(context: context, builder:(BuildContext ab) {

   return StatefulBuilder(
       builder: (BuildContext context, StateSetter setState) {
         return Scaffold(
           resizeToAvoidBottomInset: true,
           body: Container(
            // height: MediaQuery.of(context).size.height*0.80,
             child:SingleChildScrollView(
               controller: ScrollController(),
               child:  Column(
                 children: [

                   Container(

                     decoration: BoxDecoration(
                       color: blueGrey4,
                       borderRadius: BorderRadius.only(topLeft: Radius.circular(bottonSheetRadius), topRight: Radius.circular(bottonSheetRadius)),
                     ),
                     child: Stack(


                       children: [

                         IconButton(
                           icon: Icon(Icons.clear_outlined, color: Colors.black,
                               size: cancelIconSize),
                           onPressed: () {
                             Navigator.of(context).pop();
                           },
                         ),



                         Center(
                           child: Padding(
                             padding: const EdgeInsets.only(top: 5.0),
                             child: Container (
                               alignment: Alignment.center,
                               height: 5,
                               width: 50,
                               decoration: BoxDecoration(
                                   color: Colors.black12,
                                   borderRadius: BorderRadius.circular(50)
                               ),
                             ),
                           ),
                         ),

                         Positioned(
                           top: 20,
                           left: 70,
                           child: Text(
                             "JOB REQUEST DETAILS",style: TextStyle(
                               fontFamily: textFont,
                               fontSize: 16,
                               fontWeight: FontWeight.bold
                           ),
                           ),
                         ),





                       ],),
                   ),
                   SizedBox(height: 10,),
                   Column(
                     children: [
                       Container(

                         child:Text("${job.requestTitle}",style: TextStyle(

                             fontFamily: textFont,
                             fontWeight: FontWeight.w600
                         ),
                         ),

                       ),
                       Container(
                         child: Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text("${job.jobDescription}",style: TextStyle(
                               fontFamily: textFont
                           ),),
                         ),
                       ),
                       HorizontalLine(),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children:[

                               Column(
                                 children: [
                                   Row(
                                     children: [
                                       Text("PROJECT BUDGET",style: TextStyle(
                                           fontFamily: textFont,
                                           fontWeight: FontWeight.w600
                                       ),)
                                     ],

                                   ),
                                   Padding(
                                     padding: const EdgeInsets.only(left: 4.0),
                                     child: Row(
                                       children: [
                                         Container(
                                           child: Text("GH₵ ${job.price}",style: TextStyle(
                                             fontFamily: textFont,
                                             // fontWeight: FontWeight.bold
                                           ),),

                                         ),
                                         SizedBox(width: 8,),
                                         Container(
                                           //  height: 20,
                                           // width: 60,
                                           decoration: BoxDecoration(
                                             color: color,
                                             borderRadius: BorderRadius.circular(50),

                                           ),
                                           child: Padding(
                                             padding: const EdgeInsets.all(3),
                                             child: Text("${job.negotiability}",style:TextStyle(
                                                 fontFamily: textFont
                                             )),
                                           ),



                                         ),

                                       ],


                                     ),
                                   )
                                 ],
                               ),
                               Column(
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.only(right: 5.0),
                                     child: Container(
                                       alignment: Alignment(1,0),
                                       child: Text("DEADLINE",style: TextStyle(
                                           fontFamily: textFont,
                                           fontWeight: FontWeight.bold
                                       )),
                                     ),

                                   ),
                                   Container(
                                     alignment: Alignment(1,0),
                                     child: Text("${job.endDate}",style: TextStyle(
                                         fontFamily: textFont,
                                         fontWeight: FontWeight.w300

                                     ),),
                                   )

                                 ],

                               )
                             ]

                         ),


                       ),

                       SizedBox(height: 20),
                       Padding(
                         padding: const EdgeInsets.only(left: 17.0),
                         child: Row(
                           children: [
                             Column(
                               children:[
                                 Text("REQUIRED SKILLS",style: TextStyle(
                                     fontFamily: textFont,
                                     fontWeight: FontWeight.w600

                                 ),),
                                 Text("${job.requiredSkills}",style: TextStyle(
                                     fontFamily: textFont
                                 ),),

                               ],
                             )
                           ],

                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: HorizontalLine(),
                       ),
                       Row(
                         children: [
                           Padding(
                             padding: const EdgeInsets.only(left: 17.0),
                             child: Text("How soon can you complete this task?", style: TextStyle(
                                 fontFamily: textFont,
                                 fontWeight: FontWeight.w600
                             ),),
                           ),


                         ],
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           ElevatedButton(
                             style: ElevatedButton.styleFrom(
                                 primary: blueGrey3,


                             ),
                             onPressed: () {

                               showDatePicker(
                                 context: context,
                                 initialDate: DateTime.now(),
                                 firstDate: DateTime(2010),
                                 lastDate: DateTime(2025),

                               ).then((date) {
                                 setState((){
                                   selectedDate=date!;

                                 });

                               });

                             },
                             child: Text("Choose Date"),
                           ),

                           Text(selectedDate==null?"No date has been selected":DateFormat("dd MMMM yyyy").format(selectedDate),style: TextStyle(
                             fontFamily: textFont,
                           ),),

                         ],
                       ),
                       SizedBox(height: 10,),
                       Row(
                         children: [

                           Padding(
                             padding: const EdgeInsets.only(left :17.0, bottom: 10),
                             child: Text("Message (optional)",style: TextStyle(
                               fontFamily: textFont,
                               fontWeight: FontWeight.w600,
                             ),),
                           ),


                         ],
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           SizedBox(width: 40,),
                           Center(
                             child: Container(
                               height:100,
                               width: 240,
                               child: TextField(
                                 style: TextStyle(
                                   color: Colors.black,
                                   fontFamily: textFont,
                                   fontSize: textFieldSize,
                                 ),

                                 showCursor: true,
                                 cursorColor: Colors.black,
                                 decoration: InputDecoration(
                                   hintText: " Send a message to the employer to \n highlight your qualifications. ",
                                   hintMaxLines: 2,
                                   hintStyle: TextStyle(
                                     fontFamily: textFont,
                                     fontSize: 14
                                   ),
                                   border: InputBorder.none,
                                 ),

                               ),
                               decoration: BoxDecoration(
                                 border: Border.all(
                                   color: Colors.black45,
                                 ),
                                 color: Colors.white,
                                 borderRadius: BorderRadius.circular(5),
                               ),
                             ),
                           )
                         ],
                       ),
                       SizedBox(height: 10,),
                       ElevatedButton(
                         child: Text("                  PLACE A BID                  ",style: TextStyle(
                           color: Colors.white
                         ),),
                         style: ElevatedButton.styleFrom(
                           primary: blueGrey3,
                         ),
                         onPressed: (){

                         }
                         ,
                       ),
                       SizedBox(height: 80,)
                     ],
                   )

                 ],
               ),
             ),

           ),
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
// class JobsListViewDetails extends StatelessWidget {
//
//   final String jobName;
//   final Job? job;
//   const JobsListViewDetails({Key? key,this.jobName='',this.job}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//
//       body: ListView(
//         children: [
//
//           JobDetailsThumbnail(thumbnail: job!.images[1]),
//           JobDetailsHaderWithPoster(job: job),
//           HorizontalLine(),
//           JobsDetailsCast(job: job,),
//
//           HorizontalLine(),
//           JobDetailsExtraPosters(posters: job!.images,)
//
//         ],
//
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
//
// }

class Favorite extends StatefulWidget {

  const Favorite({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  IconData likeIcon=Icons.favorite_border_outlined;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(1,0),
      child: IconButton(
        icon:Icon(likeIcon,color: blueGrey5,),
        onPressed: (){


          setState(() {
            likeIcon = (likeIcon==Icons.favorite)?
            likeIcon=Icons.favorite_border_outlined:likeIcon=Icons.favorite;

          });

        },
      ),
//
    );
  }
}

// Widget Favorite(BuildContext context,int index){
//  IconData likeIcon=Icons.favorite_border_outlined;
//   return Container(
//
//   alignment: Alignment(1,0),
//       child: IconButton(
//         icon:Icon(likeIcon),
//         onPressed: (){
//
//           print(index);
//
//
//         },
//       ),
//
//     );
//
//
// }
