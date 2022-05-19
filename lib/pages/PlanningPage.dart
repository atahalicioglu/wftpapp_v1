
import 'package:flutter/material.dart';
import '../widgets/planning_widget.dart';
import '../widgets/sidebar_widget.dart';

class PlanningPage extends StatefulWidget {

  final String username;
  final String password;

  PlanningPage(this.username,this.password);

  @override
  _PlanningPageState createState() => _PlanningPageState(username, password);
}

class _PlanningPageState extends State<PlanningPage> {

  final String username;
  final String password;

  _PlanningPageState(this.username,this.password);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(username, password),
      appBar: AppBar(
        title: Text('Planning',
            textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Planning()),
    );
  }
}

