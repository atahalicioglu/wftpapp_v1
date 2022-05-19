import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class EmployeeWidget extends StatelessWidget {
  final String username;
  final String password;

  EmployeeWidget(this.username, this.password);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 1, top: 5, right: 1, bottom: 2),
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[350]!,
                          blurRadius: 2.0,
                          offset: Offset(0, 1.0))
                    ],
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.white),
                child: MaterialButton(
                    disabledTextColor: Colors.black87,
                    padding: EdgeInsets.only(left: 18),
                    onPressed: null,
                    child: Wrap(
                      children: <Widget>[
                        Container(
                            child: Row(
                              children: [
                                Text(username),
                              ],
                            )),
                        Container(
                            child: Row(
                              children: [
                                Text(password),
                              ],
                            )),
                      ],
                    )))
          ]
        )
    );
  }
}
