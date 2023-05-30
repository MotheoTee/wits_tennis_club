import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wits_tennis_club/components/post_announcement.dart';

import '../components/helper_methods.dart';

class Admin_Announcements extends StatefulWidget {
  const Admin_Announcements({Key? key}) : super(key: key);

  @override
  State<Admin_Announcements> createState() => _Admin_AnnouncementsState();
}

class _Admin_AnnouncementsState extends State<Admin_Announcements> {

  //user
  final currentUser = FirebaseAuth.instance.currentUser!;

  final textController = TextEditingController();

  //post announcement
  void postAnnouncement(){
    //only post when there is something in the textfield
    if(textController.text.isNotEmpty){
      //store it in firebase
      FirebaseFirestore.instance.collection("announcements").add({
        "adminEmail": currentUser.email,
        "Post": textController.text,
        "TimeStamp": Timestamp.now(),
      });
    }
  }
  
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

                                return PostAnnouncement(
                                    announcement: post["Post"],
                                    user: post["adminEmail"],
                                  time: formatDate(post['TimeStamp']),);

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

                //announcement text-field below
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.yellow.shade900),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: textController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Write Your Announcement Here',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                //Sign in button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 120.0),
                  child: GestureDetector(
                    onTap: () {
                      postAnnouncement();
                      setState(() {
                        textController.clear();
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(color: Colors.blue[900],
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: const Center(
                          child: Text(
                            'Post',
                            style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                            ),
                          )),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          )
      ) ,
    );
  }
}
