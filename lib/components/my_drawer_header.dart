import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({Key? key}) : super(key: key);

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[900],
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('images/witsimage.png'),
              )
            ),
          ),
          Text('Wits Tennis Club', style: TextStyle(color: Colors.white, fontSize: 25),),
          Text(user.email!, style: TextStyle(color: Colors.white, fontSize: 14),),
        ],
      )
    );
  }
}
