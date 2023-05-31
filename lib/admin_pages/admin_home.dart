import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wits_tennis_club/admin_pages/admin_announcements.dart';
import 'package:wits_tennis_club/admin_pages/admin_create_player.dart';
import 'package:wits_tennis_club/admin_pages/admin_homepage.dart';
import 'package:wits_tennis_club/admin_pages/admin_offcampus.dart';
import 'package:wits_tennis_club/admin_pages/admin_oncampus.dart';
import 'package:wits_tennis_club/admin_pages/admin_players.dart';
import 'package:wits_tennis_club/pages/splash_screen.dart';

import '../components/my_drawer_header.dart';
import '../pages/player_contactus.dart';
import '../pages/player_privacypolicy.dart';
import 'admin_settings.dart';

class Admin_Home extends StatefulWidget {
  const Admin_Home({Key? key}) : super(key: key);

  @override
  State<Admin_Home> createState() => _Admin_HomeState();
}

class _Admin_HomeState extends State<Admin_Home> {

  final user = FirebaseAuth.instance.currentUser!;

  var currentPage = DrawerSections.homepage;

  Future logOut() async{
    await FirebaseAuth.instance.signOut().then((value) =>
        Navigator.push(context,
            new MaterialPageRoute(
                builder: (context) =>
                SplashScreen())).onError(
                (error, stackTrace) =>
            print("Error ${error.toString()}")));
    Navigator.pop(context);
    print("Signed Out Successfully");
  }

  @override
  Widget build(BuildContext context) {
    var admincontainer;
    if(currentPage == DrawerSections.homepage){
      admincontainer = Admin_HomePage();
    }
    else if(currentPage == DrawerSections.announcements){
      admincontainer = Admin_Announcements();
    }
    else if(currentPage == DrawerSections.oncampus){
      admincontainer = Admin_OnCampus();
    }
    else if(currentPage == DrawerSections.offcampus){
      admincontainer = Admin_OffCampus();
    }
    else if(currentPage == DrawerSections.viewplayers){
      admincontainer = Admin_Players();
    }
    else if(currentPage == DrawerSections.createplayers){
      admincontainer = CreatePlayer();
    }
    else if(currentPage == DrawerSections.settings){
      admincontainer = Admin_Settings();
    }
    else if(currentPage == DrawerSections.contacts){
      admincontainer = Player_ContactUs();
    }
    else if(currentPage == DrawerSections.privacy_policy){
      admincontainer = Player_PrivacyPolicy();
    }
    else{
      admincontainer = Admin_HomePage();
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text("Wits Tennis Club"),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
      body: admincontainer,

    );
  }
  Widget MyDrawerList(){
    return Container(
      padding: const EdgeInsets.only(top: 15,),
      child: Column(
        children: [
          menuItem(1, "HomePage", Icons.home,
              currentPage == DrawerSections.homepage? true : false),
          menuItem(2, "Announcements", Icons.announcement,
              currentPage == DrawerSections.announcements? true : false),
          menuItem(3, "On Campus", Icons.group,
              currentPage == DrawerSections.oncampus? true : false),
          menuItem(4, "Off Campus", Icons.group_off_outlined,
              currentPage == DrawerSections.offcampus? true : false),
          menuItem(5, "View Players", Icons.people,
              currentPage == DrawerSections.viewplayers? true : false),
          menuItem(6, "Create Player", Icons.people,
              currentPage == DrawerSections.createplayers? true : false),
          menuItem(7, "Settings", Icons.settings,
              currentPage == DrawerSections.settings? true : false),

          const Divider(color: Colors.blue,),

          menuItem(8, "Contact Us", Icons.people_alt_outlined,
              currentPage == DrawerSections.contacts? true : false),
          menuItem(9, "Privacy Policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacy_policy? true : false),
          menuItem(10, "LogOut", Icons.logout,
              currentPage == DrawerSections.logout? true : false),
        ],
      ),
    );
  }
  Widget menuItem(int id, String title, IconData icon, bool selected){
    return Material(
      color: selected ? Colors.blue[100] : Colors.transparent,
      child: InkWell(
        onTap: (){
          Navigator.pop(context);
          setState(() {
            if(id ==1){
              currentPage = DrawerSections.homepage;
            }
            else if(id ==2){
              currentPage = DrawerSections.announcements;
            }
            else if(id ==3){
              currentPage = DrawerSections.oncampus;
            }
            else if(id ==4){
              currentPage = DrawerSections.offcampus;
            }
            else if(id ==5){
              currentPage = DrawerSections.viewplayers;
            }
            else if(id ==6){
              currentPage = DrawerSections.createplayers;
            }
            else if(id ==7){
              currentPage = DrawerSections.settings;
            }
            else if(id ==8){
              currentPage = DrawerSections.contacts;
            }
            else if(id ==9){
              currentPage = DrawerSections.privacy_policy;
            }
            else{
              currentPage = DrawerSections.logout;
              logOut();
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size : 20,
                  color: Colors.grey[700],),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.blue[900],
                    fontSize: 16,),),)
            ],
          ),
        ),
      ),
    );
  }
}
enum DrawerSections{
  homepage,
  announcements,
  oncampus,
  offcampus,
  viewplayers,
  createplayers,
  settings,
  contacts,
  privacy_policy,
  logout
}

/*Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () {
          FirebaseAuth.instance.signOut().then((value) =>
              Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  Sign_In())).onError((error, stackTrace) =>
                  print("Error ${error.toString()}")));
              print("Signed Out Successfully");
        },child: const Center(
            child: Text(
              'LogOut',
              style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15
              ),
            )),),
      ),
    );*/
