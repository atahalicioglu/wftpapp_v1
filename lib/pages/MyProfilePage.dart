import 'package:flutter/material.dart';
import '../data/job_dao.dart';
import '../widgets/sidebar_widget.dart';
import 'package:firebase_database/firebase_database.dart';



class MyProfilePage extends StatefulWidget {

  final String username;
  final String password;

  MyProfilePage(this.username,this.password);

  final jobdao = JobDao();

  @override
  _MyProfilePageState createState() => _MyProfilePageState(username, password);
}

class _MyProfilePageState extends State<MyProfilePage> {


  final String username;
  final String password;

  _MyProfilePageState(this.username,this.password);

  String? Name;
  String? Company;
  String? Nationality;
  String? Duty;

  _getEmployeeData(username, password) async {
    final ref = FirebaseDatabase.instance.reference();
    final snapshot_info = await ref.child('Companies').child('Peker').child('Employee').child(username).child('Info').get();
    if ((snapshot_info != null)){
      var info_info = Map <String, dynamic> .from(snapshot_info.value);
      Name = info_info['name'];
      Company = info_info['company'];
      Nationality = info_info['nationality'];
    };
    String data_return = Name! + "-" + Company! + "-" + Nationality!;
    return data_return;
  }
  late String data;
  @override
  void initState() {
    _getEmployeeData(username, password).then((dynamic value) {
      setState(() {
        data = value.toString();
        List data_list = data.split('-');
        Name = data_list[0] ?? "Name not found";
        Company = data_list[1] ?? "Surname not found";
        Nationality = data_list[2] ?? "Nationality not found";
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(username, password),
      appBar: AppBar(
        title: Text('My Profile',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color.fromRGBO(2, 24, 89, 1),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 25),
                Container(
                  height: 50,
                  color: Colors.grey,
                  child: Center(
                    child: Text('Name:' + Name!))),
                SizedBox(height: 15),
                Container(
                    height: 50,
                    color: Colors.grey,
                    child: Center(
                        child:  Text('Company: ' + Company!))),
                SizedBox(height: 15),
                Container(
                    height: 50,
                    color: Colors.grey,
                    child: Center(
                        child: Text('Nationality: ' + Nationality!))),
                SizedBox(height: 15),
                Container(
                    height: 50,
                    color: Colors.grey,
                    child: Center(
                        child: Text('Duty: ')))
              ]
            );
          }
      ),
    );
  }
}

