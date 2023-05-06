import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wits_tennis_club/pages/sign_in.dart';

class Player_Home extends StatefulWidget {
  const Player_Home({Key? key}) : super(key: key);

  @override
  State<Player_Home> createState() => _Player_HomeState();
}

class _Player_HomeState extends State<Player_Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () {
          FirebaseAuth.instance.signOut().then((value) =>
              Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  Sign_In())).onError((error, stackTrace) =>
                  print("Error ${error.toString()}")));
              print("Signed Out Successfully");
        },child: const Center(
            child: Text(
              'LogOut',
              style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15
              ),
            )),),
      ),
    );
  }
}
