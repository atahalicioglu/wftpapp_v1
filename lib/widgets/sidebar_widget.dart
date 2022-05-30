import 'package:flutter/material.dart';
import '../pages/MyProfilePage.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';
import '../pages/PlanningPage.dart';
import '../main.dart';
import '../pages/FutureJobsPage.dart';



class SideBar extends StatelessWidget {

  final String username;
  final String password;

  SideBar(this.username,this.password);

  @override
  Widget build(BuildContext context) {
    return MultiLevelDrawer(
      backgroundColor: Colors.white,
      rippleColor: Colors.white,
      subMenuBackgroundColor: Colors.grey.shade100,
      header: Container(                  // Header for Drawer
        height: MediaQuery.of(context).size.height * 0.25,
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 60,),
            Container(
              height: 100,
              width: 100,
              child:Image.asset('lib/assets/images/logo3.png', scale:0.4))
          ],
        )),
      ),
      children: [
        MLMenuItem(
          leading: Icon(Icons.person),
          content: Text("My Profile"),
          onClick: () {Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => MyProfilePage(username, password)));},
        ),
        MLMenuItem(
          leading: Icon(Icons.border_color),
          content: Text("My Tasks"),
          onClick: () {Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => FutureJobsPage(username, password)));},
        ),
        MLMenuItem(
          leading: Icon(Icons.logout),
          content: Text("Log Out"),
          onClick: () {Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyApp()));},
        ),
      ],
    );
  }
}