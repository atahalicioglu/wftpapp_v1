import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'weektable_widget.dart';

class Planning extends StatefulWidget {
  const Planning({Key? key}) : super(key: key);

  @override
  State<Planning> createState() => _PlanningState();
}

var dt = DateTime.now();
var newFormat = DateFormat("yy-MM-dd");
String updatedDt = newFormat.format(dt);
final splitDt = updatedDt.split('-');


class _PlanningState extends State<Planning> {
  int weeknumber = 1;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment:MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.navigate_before),
              onPressed: () {setState(() {
                if(weeknumber >= 2){
                  weeknumber--;}
              });
              },
            ),
            SizedBox(width: 50),
            Text('Week $weeknumber'),
            SizedBox(width: 50),
            IconButton(
              icon: const Icon(Icons.navigate_next),
              onPressed: () {setState(() {
                weeknumber++;
              });
              },
            ),

          ]
        ),
        WeekTable()
      ],
    );
  }
}


