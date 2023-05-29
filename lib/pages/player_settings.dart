import 'package:flutter/cupertino.dart';

class Player_Settings extends StatefulWidget {
  const Player_Settings({Key? key}) : super(key: key);

  @override
  State<Player_Settings> createState() => _Player_SettingsState();
}

class _Player_SettingsState extends State<Player_Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Settings Page"),
      ),
    );
  }
}
