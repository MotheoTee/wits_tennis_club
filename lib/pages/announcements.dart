import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/post_announcement.dart';

class Announcements extends StatefulWidget {
  const Announcements({Key? key}) : super(key: key);

  @override
  State<Announcements> createState() => _AnnouncementsState();
}

class _AnnouncementsState extends State<Announcements> {

  final currentUser = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const SizedBox(height: 20,),

                Text(
                  "Announcements",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                  ),
                ),

                Expanded(
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance.collection("announcements").orderBy(
                        "TimeStamp",
                        descending: false,
                      ).snapshots(),
                      builder: (context, snapshot){
                        if(snapshot.hasData){
                          return ListView.builder(
                              itemCount: snapshot.data!.docs.length ,
                              itemBuilder: (context, index){
                                //get announcement
                                final post = snapshot.data!.docs[index];

                                return PostAnnouncement(announcement: post["Post"], user: post["adminEmail"]);
                              });
                        }
                        else if(snapshot.hasError){
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ) ),


                const SizedBox(height: 15),

              ],
            ),
          )
      ) ,
    );
  }
}
