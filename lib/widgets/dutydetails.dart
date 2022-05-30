import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:wftpapp.com/data/job_dao.dart';


class DutyDetails extends StatefulWidget {

  final String username;
  final String password;

  DutyDetails(this.username,this.password);

  final jobdao = JobDao();

  @override
  _DutyDetailsState createState() => _DutyDetailsState(username, password);
}

class _DutyDetailsState extends State<DutyDetails> {

  final String username;
  final String password;

  _DutyDetailsState(this.username,this.password);

  String? ProjectNumber;
  String? BoardingPlace;
  String? JobStartDate;
  String? JobEndDate;
  String? AssigmentDetails;
  String? Function;
  String? Workshift;
  String? JobStartMonth;
  String? JobStartDay;
  String? JobStartYear;
  String? JobEndMonth;
  String? JobEndDay;
  String? JobEndYear;

  _getDutyData(username, password) async {
    final ref = FirebaseDatabase.instance.reference();
    final snapshot_duties = await ref.child('Companies').child('Peker').child('Employee').child(username).child('Duties').get();
    final snapshot_info = await ref.child('Companies').child('Peker').child('Employee').child(username).child('Info').get();
    if ((snapshot_duties != null) && (snapshot_info != null)){
      String info_info = snapshot_info.value.toString();
      //print(info_info);
      String duties_id = snapshot_duties.value.toString();
      List duties_id_v2 = duties_id.split("--");
      print(duties_id_v2);
        print(duties_id_v2[1]);
        final snapshot_duties_end_date = await ref.child('Companies').child('Peker').child('Employee').child(username).child('Duties').child("--" + duties_id_v2[1] + "--").child('End_Date').get();
        final snapshot_duties_start_date = await ref.child('Companies').child('Peker').child('Employee').child(username).child('Duties').child("--" + duties_id_v2[1] + "--").child('Start_Date').get();
        final snapshot_duties_info = await ref.child('Companies').child('Peker').child('Employee').child(username).child('Duties').child("--" + duties_id_v2[1] + "--").child('Info').get();
        if ((snapshot_duties_start_date != null) && (snapshot_duties_end_date != null) && (snapshot_duties_info != null)) {
          String info_duties_end_date = snapshot_duties_end_date.value.toString();
          String info_duties_start_date = snapshot_duties_start_date.value.toString();
          String info_duties_info = snapshot_duties_info.value.toString();
          List info_info_duties_info = info_duties_info.split(",");
          List info_info_duties_end_date = info_duties_end_date.split(",");
          List info_info_duties_start_date = info_duties_start_date.split(",");

          for(int i = 0; i < info_info_duties_info.length; i++) {
            if (info_info_duties_info[i].contains("project_number: ")) {
              ProjectNumber = info_info_duties_info[i].split(":")[1];
            }
            if (info_info_duties_info[i].contains("boarding_place: ")) {
              BoardingPlace = info_info_duties_info[i].split(":")[1];
            }
            if (info_info_duties_info[i].contains("assignment_details: ")) {
              AssigmentDetails = info_info_duties_info[i].split(":")[1];
            }
            if (info_info_duties_info[i].contains("function: ")) {
              Function = info_info_duties_info[i].split(":")[1];
            }

            if (info_info_duties_info[i].contains("workshift: ")) {
              Workshift = info_info_duties_info[i].split(":")[1];
            }
          }
          for (int i = 0; i < info_info_duties_start_date.length; i++){
            if (info_info_duties_start_date[i].contains("month_start: ")) {
              JobStartMonth = info_info_duties_start_date[i].split(":")[1];
            }
            if (info_info_duties_start_date[i].contains("day_start: ")) {
              JobStartDay = info_info_duties_start_date[i].split(":")[1];
            }
            if (info_info_duties_start_date[i].contains("year_start: ")) {
              JobStartYear = info_info_duties_start_date[i].split(":")[1];
            }
          }
          for (int i = 0; i < info_info_duties_end_date.length; i++){
            if (info_info_duties_end_date[i].contains("month_end: ")) {
              JobEndMonth = info_info_duties_end_date[i].split(":")[1];
            }
            if (info_info_duties_end_date[i].contains("day_end: ")) {
              JobEndDay = info_info_duties_end_date[i].split(":")[1];
            }
            if (info_info_duties_end_date[i].contains("year_end: ")) {
              JobEndYear = info_info_duties_end_date[i].split(":")[1];
            }
          }
          print(info_duties_start_date);
          print(info_duties_end_date);
          print(info_duties_info);

        }

    };
    String data_return = ProjectNumber! + "-" + BoardingPlace! + "-" + AssigmentDetails! + "-" + Function! + "-" + Workshift! + "-" + JobStartDay! + "-" + JobStartMonth!+ "-" + JobStartYear!+ "-" + JobEndDay!+ "-" + JobEndMonth! + "-" + JobEndYear!;
    return data_return;
  }
  late String data;
  @override
  void initState() {
    _getDutyData(username, password).then((dynamic value) {
      setState(() {
        data = value.toString();
        if (data != null) {
          List data_list = data.split('-');
          ProjectNumber = data_list[0] ?? "Name not found";
          BoardingPlace = data_list[1] ?? "Surname not found";
          AssigmentDetails = data_list[2] ?? "Nationality not found";
          Function = data_list[3] ?? "Name not found";
          Workshift = data_list[4] ?? "Surname not found";
          JobStartDay = data_list[5] ?? "Nationality not found";
          JobStartMonth = data_list[6] ?? "Name not found";
          JobStartYear = data_list[7] ?? "Surname not found";
          JobEndDay = data_list[8] ?? "Nationality not found";
          JobEndMonth = data_list[9] ?? "Nationality not found";
          JobEndYear = data_list[10] ?? "Nationality not found";
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog(
          context: context,
          builder: (_) => new AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.all(
                    Radius.circular(10.0))),
            content: Builder(
              builder: (context) {
                // Get available height and width of the build area of this widget. Make a choice depending on the size.
                var height = MediaQuery.of(context).size.height;
                var width = MediaQuery.of(context).size.width;

                return Container(
                  height: height - 200,
                  width: width - 100,
                  child: ListView(

                    children: <Widget>[
                      Text('Task Details',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,),
                      SizedBox(height: 15),
                      Text('Project Number:' + ProjectNumber!),
                      SizedBox(height: 10),
                      Text('Boarding Place:' + BoardingPlace!),
                      SizedBox(height: 10),
                      Text('Job Start Date' + JobStartDay! + "-" + JobStartMonth! + "-" + JobStartYear!),
                      SizedBox(height: 10),
                      Text('Job End Date:' + JobEndDay! + "-" + JobEndMonth! + "-" + JobEndYear!),
                      SizedBox(height: 10),
                      Text('Assignment Details:' + AssigmentDetails!),
                      SizedBox(height: 10),
                      Text('Function:' + Function!),
                      SizedBox(height: 10),
                      Text('Work Shift:' + Workshift!)
                    ],
                  ),
                );
              },
            ),
          )
      ),
      child: const Text('Duty 1', style: TextStyle(color: Colors.black)),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
      ),
    );
  }
}

