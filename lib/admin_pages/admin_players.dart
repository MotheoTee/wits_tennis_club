import 'package:flutter/cupertino.dart';

class Admin_Players extends StatefulWidget {
  const Admin_Players({Key? key}) : super(key: key);

  @override
  State<Admin_Players> createState() => _Admin_PlayersState();
}

class _Admin_PlayersState extends State<Admin_Players> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("All Players Page"),
      ),
    );
  }
}
