import 'package:firebase_database/firebase_database.dart';

DatabaseReference usersRef =
    FirebaseDatabase.instance.reference().child('users');
DatabaseReference jobsRef = FirebaseDatabase.instance.reference().child('jobs');
