import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostAnnouncement extends StatelessWidget {

  final String announcement;
  final String user;
  final String time;

  const PostAnnouncement({Key? key, required this.announcement, required this.user, required this.time}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue[200],
            borderRadius: BorderRadius.circular(8),
        ),
        margin: EdgeInsets.only(top: 25, left: 25, right: 25),
        padding: EdgeInsets.all(25),
        child: Row(
          children: [
            //profile pic
            Container(
              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              padding: EdgeInsets.all(10),
              child: Icon(
                  Icons.person,
                color: Colors.blue[400],
              ),
            ),
            const SizedBox(width: 20,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  const SizedBox(width: 20,),
                  Row(
                    children: [
                      Text(
                          user,
                          style: TextStyle(
                            color: Colors.blue[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                      ),

                    ],
                  ),
                  const SizedBox(height: 10,),
                  Text(
                      time,
                      style: TextStyle(
                        color: Colors.blue[350],
                        fontSize: 13,
                      ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    announcement,
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
