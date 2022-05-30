import 'package:flutter/material.dart';
import 'MyProfilePage.dart';
import '../widgets/sidebar_widget.dart';
import '../widgets/dutydetails.dart';

const numwid = 2;

class FutureJobsPage extends StatefulWidget {

  final String username;
  final String password;

  FutureJobsPage(this.username,this.password);

  @override
  _FutureJobsPageState createState() => _FutureJobsPageState(username, password);
}

class _FutureJobsPageState extends State<FutureJobsPage> {

  final String username;
  final String password;

 _FutureJobsPageState(this.username,this.password);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(username, password),
      appBar: AppBar(
          title: Text('My Tasks', textAlign: TextAlign.center),
          backgroundColor: Color.fromRGBO(2, 24, 89, 1),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          DutyDetails(username, password),
        ],
      )
    );
  }
}