import 'package:flutter/cupertino.dart';

class Admin_Settings extends StatefulWidget {
  const Admin_Settings({Key? key}) : super(key: key);

  @override
  State<Admin_Settings> createState() => _Admin_SettingsState();
}

class _Admin_SettingsState extends State<Admin_Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Admin Settings Page"),
      ),
    );
  }
}
