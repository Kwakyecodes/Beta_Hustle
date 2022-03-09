import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//creating the collection to store the users
CollectionReference usersColl = FirebaseFirestore.instance.collection('Users');

DatabaseReference usersRef =
    FirebaseDatabase.instance.reference().child('users');
DatabaseReference jobsRef = FirebaseDatabase.instance.reference().child('jobs');
 