import 'package:flutter/material.dart';
import 'MyProfilePage.dart';
import '../widgets/sidebar_widget.dart';

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
        title: Text('Future Jobs', textAlign: TextAlign.center),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          InkWell(
          onTap: () {
            Navigator.push(context,MaterialPageRoute(builder: (context) => MyProfilePage(username, password),
            ),
          );
        },
            child:Container(
              height: 50,
              color: Colors.amber[600],
              child: const Center(child: Text('Duty 1')),
            ),
          ),
          Container(
            height: 50,
            color: Colors.amber[500],
            child: const Center(child: Text('Duty 2')),
          ),
          Container(
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('Duty 3')),
          ),
        ],
      )
    );
  }
}