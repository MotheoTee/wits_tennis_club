import 'package:flutter/cupertino.dart';

class Admin_Announcements extends StatefulWidget {
  const Admin_Announcements({Key? key}) : super(key: key);

  @override
  State<Admin_Announcements> createState() => _Admin_AnnouncementsState();
}

class _Admin_AnnouncementsState extends State<Admin_Announcements> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Admin Announcements Page"),
      ),
    );
  }
}
