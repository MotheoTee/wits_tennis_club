import 'package:flutter/cupertino.dart';

class Player_OnCampus extends StatefulWidget {
  const Player_OnCampus({Key? key}) : super(key: key);

  @override
  State<Player_OnCampus> createState() => _Player_OnCampusState();
}

class _Player_OnCampusState extends State<Player_OnCampus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("On Campus Page"),
      ),
    );
  }
}
