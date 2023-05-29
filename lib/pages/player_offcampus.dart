import 'package:flutter/cupertino.dart';

class Player_OffCampus extends StatefulWidget {
  const Player_OffCampus({Key? key}) : super(key: key);

  @override
  State<Player_OffCampus> createState() => _Player_OffCampusState();
}

class _Player_OffCampusState extends State<Player_OffCampus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Off Campus Page"),
      ),
    );
  }
}
