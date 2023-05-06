import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wits_tennis_club/pages/sign_in.dart';

import '../components/my_drawer_header.dart';

class Player_Home extends StatefulWidget {
  const Player_Home({Key? key}) : super(key: key);

  @override
  State<Player_Home> createState() => _Player_HomeState();
}

class _Player_HomeState extends State<Player_Home> {

  final user = FirebaseAuth.instance.currentUser!;

  Future logOut() async{
    await FirebaseAuth.instance.signOut().then((value) =>
        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>
                Sign_In())).onError((error, stackTrace) =>
            print("Error ${error.toString()}")));
    print("Signed Out Successfully");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text("Wits Tennis Club"),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
      body:SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text('Signed in as: ' + user.email!),

                  const SizedBox(height: 15),


                  //Reset button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 110.0),
                    child: GestureDetector(
                      onTap: () {

                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(color: Colors.blue[900],
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Center(
                            child: MaterialButton(
                              onPressed: () {
                                logOut();
                              },
                              child: const Text(
                                'LogOut',
                                style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15
                                ),
                              ),
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          )
      ) ,
    );
  }
  Widget MyDrawerList(){
    return Container();
  }
}

/*Scaffold(
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
    );*/
