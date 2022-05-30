import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/sidebar_widget.dart';
import '../data/Employee_dao.dart';

class HomePageState extends State<HomePage> {
  ScrollController _scrollController = ScrollController();

  final String username;
  final String password;

  HomePageState(this.username,this.password);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => _scrollToBottom());

    return Scaffold(
      drawer:SideBar(username, password),
      appBar: AppBar(
        title: const Text('Home Page', textAlign: TextAlign.center),
        backgroundColor: Color.fromRGBO(2, 24, 89, 1),
      ),
      body: ListView(
        children: <Widget>[
          Image.asset('lib/assets/images/logo2.png', scale:0.8),
          Text("Welcome")
        ]
        ,
      ),
    );
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }
}


class HomePage extends StatefulWidget {
  final String username;
  final String password;

  HomePage(this.username, this.password);
  final messageDao = EmployeeDao();

  get employeeDao => EmployeeDao();

  @override
  HomePageState createState() => HomePageState(username, password);

}