import 'package:flutter/cupertino.dart';

class Announcements extends StatefulWidget {
  const Announcements({Key? key}) : super(key: key);

  @override
  State<Announcements> createState() => _AnnouncementsState();
}

class _AnnouncementsState extends State<Announcements> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Announcements Page"),
      ),
    );
  }
}
