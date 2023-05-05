import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wits_tennis_club/pages/sign_in.dart';
import 'package:wits_tennis_club/pages/player_home.dart';

import '../pages/player_home.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Player_Home();
          }else{
            return Sign_In();
          }
        },
      ),
    );;
  }
}
