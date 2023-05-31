import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreatePlayer extends StatefulWidget {
  const CreatePlayer({Key? key}) : super(key: key);

  @override
  State<CreatePlayer> createState() => _CreatePlayerState();
}

class _CreatePlayerState extends State<CreatePlayer> {

  final _ademailController = TextEditingController();
  final _adnameController = TextEditingController();
  final _adsurnameController = TextEditingController();

//authentication of players
  Future addPlayer() async{
    if(_ademailController.text.isNotEmpty){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _ademailController.text.trim(),
        password: 'tennis123',
      );
      //add player details to firebase database
      addDetails(
          _ademailController.text.trim().toString(),
          _adnameController.text.trim().toString(),
          _adsurnameController.text.trim().toString(),
          'Player'
      );
    }
  }

  Future addDetails(String playerEmail, String playerName, String playerSurname, String playerRole) async {
    await FirebaseFirestore.instance.collection('players').add({
      'email': playerEmail ,
      'name': playerName,
      'surname': playerSurname,
      'role': playerRole,
    });

  }
  @override
  void dispose() {
    _ademailController.dispose();
    _adnameController.dispose();
    _adsurnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('ADD PLAYER',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 27,
                      color: Colors.blue.shade900,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  //Wits logo
                  const SizedBox(height: 70),

                  //Email text above it's text-field
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Email',
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontSize: 17,
                              decoration: TextDecoration.underline
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 7),

                  //email text-field below
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue.shade900),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: TextField(

                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'example@domain.com',
                            prefixIcon: Icon(Icons.email),
                          ),
                          controller: _ademailController,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Name',
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontSize: 17,
                              decoration: TextDecoration.underline
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 7),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue.shade900),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.person),
                          ),
                          controller: _adnameController,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Surname',
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontSize: 17,
                              decoration: TextDecoration.underline
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 7),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue.shade900),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: _adsurnameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  //password text above it's textfield

                  const SizedBox(height: 10),

                  //add in button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 110.0),
                    child: GestureDetector(
                      onTap: () {
                        addPlayer();
                        setState(() {
                          _ademailController.clear();
                          _adnameController.clear();
                          _adsurnameController.clear();
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(color: Colors.blue[900],
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: const Center(
                            child: Text(
                              'Add',
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
            ),
          )
      ) ,
    );
  }
}
