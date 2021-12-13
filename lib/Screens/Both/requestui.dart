
import 'package:beta_hustle/models/job_descriptions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobDetailsThumbnail extends StatelessWidget {
  final String thumbnail;



  const JobDetailsThumbnail({Key? key,this.thumbnail=''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height:170,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(thumbnail),
                    fit: BoxFit.cover,
                  )

              ),

            ),
            Icon(Icons.play_circle_outline,size: 100,color: Colors.white,)
          ],
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0x00f5f5),Color(0xfff5f5f5)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,

              )

          ),
          height: 80,
        )

      ],
    );

  }
}
class JobDetailsHaderWithPoster extends StatelessWidget {
  final Job? job;
  const JobDetailsHaderWithPoster({Key? key,this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          JobPoster(poster: job!.images[1].toString() ),
          SizedBox(width: 16),

          Expanded(child: JobDetailsHeader(job: job,))
        ],

      ),
    );
  }
}

class JobPoster extends StatelessWidget {
  final String  poster;
  const JobPoster({Key? key,this.poster=''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius=BorderRadius.all(Radius.circular(8));
    return Card(

      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width/4,
          height: 150,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(poster),
                fit: BoxFit.cover,
              )
          ),
        ),
      ),
    );
  }
}
class JobDetailsHeader extends StatelessWidget {
  final Job? job;
  const JobDetailsHeader({Key? key,this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${job!.username} . ${job!.endDate.toUpperCase()}",style: TextStyle(
          fontWeight: FontWeight.bold,
          color:Colors.cyan,

        ),),
        Text("${job!.jobTitle}",style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 32,

        ),),
        Text.rich(TextSpan(
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500
            ),
            children: [
              TextSpan(
                  text: job!.plot
              ),
              TextSpan(
                  text: "  More..",
                  style: TextStyle(
                      color: Colors.indigo
                  )
              )
            ]
        ))
      ],
    );
  }
}
class JobsDetailsCast extends StatelessWidget {
  final Job? job;
  const JobsDetailsCast({Key? key,this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          JobField(field: "Cast", value: job!.actors),
          JobField(field: "Directors", value: job!.requestTitle),
          JobField(field: "Awards",value: job!.awards)
        ],
      ),
    );
  }
}
class JobField extends StatelessWidget {
  final String field;
  final String value;
  const JobField({Key? key,this.field='',this.value=''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$field: ",style: TextStyle(
          color: Colors.black,
          fontSize: 12,

        ),),
        Flexible(
          child: Text(value,style: TextStyle(
            color: Colors.black38,
            fontSize: 12,
          ),),
        )
      ],
    );
  }
}
class HorizontalLine extends StatelessWidget {
  const HorizontalLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
      child: Container(

        height: 0.5,
        color: Colors.grey,
      ),
    );
  }
}
class JobDetailsExtraPosters extends StatelessWidget {
  final List<String>? posters;
  const JobDetailsExtraPosters({Key? key,this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text("More Job Posters".toUpperCase(),style: TextStyle(
            color: Colors.black26,
            fontSize: 14,
          ),),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          height: 160,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,

            separatorBuilder: (context,index)=>SizedBox(width: 8,),
            itemCount: posters!.length,
            itemBuilder: (context,index)=>ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                width: MediaQuery.of(context).size.width/4,
                height: 160,
                decoration: BoxDecoration(


                    image: DecorationImage(
                        image: NetworkImage(posters![index]),
                        fit: BoxFit.cover
                    )
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}