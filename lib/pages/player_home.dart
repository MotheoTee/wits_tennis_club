import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wits_tennis_club/pages/announcements.dart';
import 'package:wits_tennis_club/pages/player_contactus.dart';
import 'package:wits_tennis_club/pages/player_homepage.dart';
import 'package:wits_tennis_club/pages/player_makequery.dart';
import 'package:wits_tennis_club/pages/player_offcampus.dart';
import 'package:wits_tennis_club/pages/player_oncampus.dart';
import 'package:wits_tennis_club/pages/player_privacypolicy.dart';
import 'package:wits_tennis_club/pages/player_settings.dart';
import 'package:wits_tennis_club/pages/splash_screen.dart';

import '../components/my_drawer_header.dart';

class Player_Home extends StatefulWidget {
  const Player_Home({Key? key}) : super(key: key);

  @override
  State<Player_Home> createState() => _Player_HomeState();
}

class _Player_HomeState extends State<Player_Home> {

  final user = FirebaseAuth.instance.currentUser!;

  var currentPage = DrawerSections.homepage;

  Future logOut() async{
    await FirebaseAuth.instance.signOut().then((value) =>
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) =>
                SplashScreen())).onError((error, stackTrace) =>
            print("Error ${error.toString()}")));
        Navigator.pop(context);
    print("Signed Out Successfully");
  }

  @override
  Widget build(BuildContext context) {
    var container;
    if(currentPage == DrawerSections.homepage){
      container = PlayerHomePage2();
    }
    else if(currentPage == DrawerSections.announcements){
      container = Announcements();
    }
    else if(currentPage == DrawerSections.oncampus){
      container = Player_OnCampus();
    }
    else if(currentPage == DrawerSections.offcampus){
      container = Player_OffCampus();
    }
    else if(currentPage == DrawerSections.makequery){
      container = Player_MakeQuery();
    }
    else if(currentPage == DrawerSections.settings){
      container = Player_Settings();
    }
    else if(currentPage == DrawerSections.contacts){
      container = Player_ContactUs();
    }
    else if(currentPage == DrawerSections.privacy_policy){
      container = Player_PrivacyPolicy();
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
      body: container,
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
          menuItem(5, "Make A Query", Icons.question_mark,
              currentPage == DrawerSections.makequery? true : false),
          menuItem(6, "Settings", Icons.settings,
              currentPage == DrawerSections.settings? true : false),

          const Divider(color: Colors.blue,),

          menuItem(7, "Contact Us", Icons.people_alt_outlined,
              currentPage == DrawerSections.contacts? true : false),
          menuItem(8, "Privacy Policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacy_policy? true : false),
          menuItem(9, "LogOut", Icons.logout,
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
              currentPage = DrawerSections.makequery;
            }
            else if(id ==6){
              currentPage = DrawerSections.settings;
            }
            else if(id ==7){
              currentPage = DrawerSections.contacts;
            }
            else if(id ==8){
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
  makequery,
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
