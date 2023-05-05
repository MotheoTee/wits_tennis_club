import 'package:flutter/material.dart';

class Player_Home extends StatefulWidget {
  const Player_Home({Key? key}) : super(key: key);

  @override
  State<Player_Home> createState() => _Player_HomeState();
}

class _Player_HomeState extends State<Player_Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('signed in')),
    );
  }
}
