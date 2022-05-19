import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class WeekTable extends StatefulWidget {
  const WeekTable({Key? key}) : super(key: key);

  @override
  State<WeekTable> createState() => _WeekTableState();
}

class _WeekTableState extends State<WeekTable> {

  @override
  Widget build(BuildContext context) {
    return Table(
          columnWidths: const <int, TableColumnWidth>{
            0: FixedColumnWidth(100),
            1: FixedColumnWidth(100),
            2: FixedColumnWidth(103),
            3: FixedColumnWidth(100),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: <TableRow>[
            TableRow(
              children: <Widget>[
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(height: 64,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                    height: 64,
                    child: Center(
                        child: Text('Morning')
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                    height: 64,
                    child: Center(
                        child: Text('Afternoon')
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                    height: 64,
                    child: Center(
                        child: Text('Night')
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                    height: 64,
                    child: Center(
                        child: Text('Monday')
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                      height: 64,
                      child: Icon(
                        WeatherIcons.day_sunny,
                        color: Colors.black,
                        size: 24.0,)
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                      height: 64,
                      child: Icon(
                        WeatherIcons.sunset,
                        color: Colors.black,
                        size: 24.0,)
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                      height: 64,
                      child: Icon(
                        Icons.dark_mode,
                        color: Colors.black,
                        size: 24.0,)
                  ),
                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                    height: 64,
                    child: Center(
                        child: Text('Tuesday')
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                      height: 64,
                      child: Icon(
                        WeatherIcons.day_sunny,
                        color: Colors.black,
                        size: 24.0,)
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                      height: 64,
                      child: Icon(
                        WeatherIcons.sunset,
                        color: Colors.black,
                        size: 24.0,)
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                      height: 64,
                      child: Icon(
                        Icons.dark_mode,
                        color: Colors.black,
                        size: 24.0,)
                  ),
                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                    height: 64,
                    child: Center(
                        child: Text('Wednesday')
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                      height: 64,
                      child: Icon(
                        WeatherIcons.day_sunny,
                        color: Colors.black,
                        size: 24.0,)
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                      height: 64,
                      child: Icon(
                        WeatherIcons.sunset,
                        color: Colors.black,
                        size: 24.0,)
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                      height: 64,
                      child: Icon(
                        Icons.dark_mode,
                        color: Colors.black,
                        size: 24.0,)
                  ),
                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                    height: 64,
                    child: Center(
                        child: Text('Thursday')
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                      height: 64,
                      child: Icon(
                        WeatherIcons.day_sunny,
                        color: Colors.black,
                        size: 24.0,)
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                      height: 64,
                      child: Icon(
                        WeatherIcons.sunset,
                        color: Colors.black,
                        size: 24.0,)
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                      height: 64,
                      child: Icon(
                        Icons.dark_mode,
                        color: Colors.black,
                        size: 24.0,)
                  ),
                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                    height: 64,
                    child: Center(
                        child: Text('Friday')
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                      height: 64,
                      child: Icon(
                        WeatherIcons.day_sunny,
                        color: Colors.black,
                        size: 24.0,)
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                      height: 64,
                      child: Icon(
                        WeatherIcons.sunset,
                        color: Colors.black,
                        size: 24.0,)
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                      height: 64,
                      child: Icon(
                        Icons.dark_mode,
                        color: Colors.black,
                        size: 24.0,)
                  ),
                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                    height: 64,
                    child: Center(
                        child: Text('Saturday')
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                      height: 64,
                      child: Icon(
                        WeatherIcons.day_sunny,
                        color: Colors.black,
                        size: 24.0,)
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                      height: 64,
                      child: Icon(
                        WeatherIcons.sunset,
                        color: Colors.black,
                        size: 24.0,)
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                      height: 64,
                      child: Icon(
                        Icons.dark_mode,
                        color: Colors.black,
                        size: 24.0,)
                  ),
                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                    height: 64,
                    child: Center(
                        child: Text('Sunday')
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                      height: 64,
                      child: Icon(
                        WeatherIcons.day_sunny,
                        color: Colors.black,
                        size: 24.0,)
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                      height: 64,
                      child: Icon(
                        WeatherIcons.sunset,
                        color: Colors.black,
                        size: 24.0,)
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                      height: 64,
                      child: Icon(
                        Icons.dark_mode,
                        color: Colors.black,
                        size: 24.0,)
                  ),
                ),
              ],
            ),
          ],
      );
  }
}

