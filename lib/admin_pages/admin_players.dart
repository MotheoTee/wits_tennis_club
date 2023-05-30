import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Admin_Players extends StatefulWidget {
  const Admin_Players({Key? key}) : super(key: key);

  @override
  State<Admin_Players> createState() => _Admin_PlayersState();
}

class _Admin_PlayersState extends State<Admin_Players> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

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

  //layout for page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Student'),
      ),
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
    );
  }
}