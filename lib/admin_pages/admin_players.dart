import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wits_tennis_club/components/get_player_name.dart';

class Admin_Players extends StatefulWidget {
  const Admin_Players({Key? key}) : super(key: key);

  @override
  State<Admin_Players> createState() => _Admin_PlayersState();
}

class _Admin_PlayersState extends State<Admin_Players> {

  //database function to add student details

  /*
  Future<void> addStudent() async {
    final String email = _emailController.text;
    final String fName = _nameController.text;
    final String lName = _lastameController.text;
    final int age = int.parse(_ageController.text);

    final studentData = {
      'email': email,
      'first name': fName,
      'last name': lName,
      'age': age,
    };

    //await studentsCollection.add(studentData);

    // Clear the form fields after submission
    _nameController.clear();
    _ageController.clear();

    // Show a success message or navigate to a different page
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Student added successfully.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );

    @override
    Widget build(BuildContext context) {
      return Container(
        child: Center(
          child: Text("All Players Page"),
        ),
      );
    }
  }
  */
  final user = FirebaseAuth.instance.currentUser!;

  List<String> docIDs = [];

  //get doc  IDs

  Future getDocID() async {
    await FirebaseFirestore.instance.collection('players').get().then(
            (snapshot) => snapshot.docs.forEach((element) {
              print(element.reference);
              docIDs.add(element.reference.id);
            })
    );
  }

  //layout for page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20,),

            Text(
              "Players",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: FutureBuilder(
                future: getDocID() ,
                builder: (context, snapshot){

                return ListView.builder(
                    itemCount: docIDs.length,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Row(
                            children: [
                              const SizedBox(height: 20,),
                              Container(

                                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                                padding: EdgeInsets.all(10),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.blue[400],
                                ),
                              ),
                              const SizedBox(width: 20,),
                              GetPlayerName(documentId: docIDs[index]),
                            ],
                          ),
                          tileColor: Colors.blue[300],
                        ),
                      );
                    });
              },),
            ),
            const SizedBox(height: 20,),

          ],
        ),
      ),

    );
  }
}

/*
body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an email address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'First Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _lastameController,
                decoration: InputDecoration(labelText: 'Surname'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the surname';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an age';
                  }
                  return null;
                },
              ),
              /*SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    addStudent();
                  }
                },
                child: Text('Add Student'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    addStudent();
                  }
                },
                child: Text('Remove Student'),
              ), */
            ],
          ),
        ),
      ),
*/