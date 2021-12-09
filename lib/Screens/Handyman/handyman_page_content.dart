import 'package:beta_hustle/models/colors.dart';
import 'package:beta_hustle/models/job_descriptions.dart';
import 'package:beta_hustle/Screens/Both/requestui.dart';
import 'package:beta_hustle/models/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



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

                            child: Text("${job.jobTitle.toUpperCase()}",style: TextStyle(
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
        Navigator.push(context, MaterialPageRoute(builder: (context)=>JobsListViewDetails(
            jobName:job.jobTitle,job: job )));

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

class JobsListViewDetails extends StatelessWidget {

  final String jobName;
  final Job? job;
  const JobsListViewDetails({Key? key,this.jobName='',this.job}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: ListView(
        children: [

          JobDetailsThumbnail(thumbnail: job!.poster),
          JobDetailsHaderWithPoster(job: job),
          HorizontalLine(),
          JobsDetailsCast(job: job,),

          HorizontalLine(),
          JobDetailsExtraPosters(posters: job!.images,)

        ],

      ),
      // body: Container(
      //   child: Center(
      //     child: RaisedButton(
      //       child: Text(this.movie!.director),
      //       onPressed: (){
      //         Navigator.pop(context);
      //
      //                    },
      //     ),
      //   ),
      //
      // ),
    );
  }

}


