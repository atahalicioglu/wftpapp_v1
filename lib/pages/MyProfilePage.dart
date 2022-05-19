import 'package:flutter/material.dart';
import 'package:wftpapp_v1/data/job_dao.dart';
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
    final snapshot_duties = await ref.child('Companies').child('Peker').child('Employee').child(username).child('Duties').get();
    final snapshot_info = await ref.child('Companies').child('Peker').child('Employee').child(username).child('Info').get();
    if ((snapshot_duties != null) && (snapshot_info != null)){
      String info_info = snapshot_info.value.toString();
      print(info_info);
      List info_info_v2 = info_info.split(",");
      for (int i = 0; i < info_info_v2.length; i = i + 1) {
        if (info_info_v2[i].contains("name: ")) {
          Name = info_info_v2[i].split(": ")[1];
          print("Name");
        };
        if (info_info_v2[i].contains("company: ")) {
          Company = info_info_v2[i].split(": ")[1];
        };
        if (info_info_v2[i].contains("nationality: ")) {
          Nationality = info_info_v2[i].split(": ")[1];
        };

      }
      String duties_id = snapshot_duties.value.toString();
      List duties_id_v2 = duties_id.split("--");
      for (int i = 1; i < duties_id_v2.length; i = i + 2) {
        print(duties_id_v2[i]);
        final snapshot_duties_end_date = await ref.child('Companies').child('Peker').child('Employee').child(username).child('Duties').child("--" + duties_id_v2[i] + "--").child('End_Date').get();
        final snapshot_duties_start_date = await ref.child('Companies').child('Peker').child('Employee').child(username).child('Duties').child("--" + duties_id_v2[i] + "--").child('Start_Date').get();
        final snapshot_duties_info = await ref.child('Companies').child('Peker').child('Employee').child(username).child('Duties').child("--" + duties_id_v2[i] + "--").child('Info').get();
        if ((snapshot_duties_start_date != null) && (snapshot_duties_end_date != null) && (snapshot_duties_info != null)) {
          String info_duties_end_date = snapshot_duties_end_date.value.toString();
          String info_duties_start_date = snapshot_duties_start_date.value.toString();
          String info_duties_info = snapshot_duties_info.value.toString();
          print(info_duties_start_date);
          print(info_duties_end_date);
          print(info_duties_info);

        }
      };
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
        backgroundColor: Colors.black,
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
                SizedBox(height: 25),
                Container(
                    height: 50,
                    color: Colors.grey,
                    child: Center(
                        child:  Text('Company: ' + Company!))),
                SizedBox(height: 25),
                Container(
                    height: 50,
                    color: Colors.grey,
                    child: Center(
                        child: Text('Nationality: ' + Nationality!))),
                SizedBox(height: 25),
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

