import 'package:flutter/cupertino.dart';

class Admin_HomePage extends StatefulWidget {
  const Admin_HomePage({Key? key}) : super(key: key);

  @override
  State<Admin_HomePage> createState() => _Admin_HomePageState();
}

class _Admin_HomePageState extends State<Admin_HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Admin Home Page"),
      ),
    );
  }
}
