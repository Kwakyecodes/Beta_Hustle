import 'package:beta_hustle/notifications/alerts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/src/provider.dart';

import 'package:beta_hustle/models/db_ref.dart';

class Job {
  String? title;
  String? description;
  String? maxNumofmen;
  String? price;
  String? priceType;
  String? enddate;
  String? endtime;
  Job(
      {this.title,
      this.description,
      this.maxNumofmen,
      this.price,
      this.priceType,
      this.enddate,
      this.endtime});
  final alerts = new Alerts();
  addJob(BuildContext context) async {
    final firebaseUser = Provider.of<User>(context, listen: false);

    Map jobData = {
      "title": this.title,
      "description": this.description,
      "servicemen": {"numberneeded": this.maxNumofmen, "details": {}},
      "status": {"value": "pending", "user": firebaseUser.uid},
      "price": {"type": this.priceType, "value": this.price},
      "deadline": {"date": this.enddate, "time": this.endtime}
    };
    await jobsRef
        .child(firebaseUser.uid)
        .push()
        .set(jobData)
        .whenComplete(() => alerts.user_toast("Request has been pushed"));
  }
}
