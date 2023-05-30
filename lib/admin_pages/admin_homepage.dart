import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Admin_HomePage extends StatefulWidget {
  const Admin_HomePage({Key? key}) : super(key: key);

  @override
  State<Admin_HomePage> createState() => _Admin_HomePageState();
}

class _Admin_HomePageState extends State<Admin_HomePage> {

  final user = FirebaseAuth.instance.currentUser!;
  
  //document IDs
  
  List<String> docIDs = [];
  
  //get docIDs
  Future getDocId() async{
    await FirebaseFirestore.instance.collection('announcements').orderBy('TimeStamp', descending: true).get().then(
            (snapshot) => snapshot.docs.forEach((document) {
              print(document.reference);
              docIDs.add(document.reference.id);
            }));
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Admin Home Page"),
      ),
    );
  }
}
