import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/Employee.dart';
import '../data/Employee_dao.dart';
import 'HomePage.dart';
import 'package:firebase_database/firebase_database.dart';



const kTextFieldDecoration = InputDecoration(
    hintText: 'Enter a value',
    hintStyle: TextStyle(color: Colors.grey),
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ));



class LoginPageState extends State<LoginPage> {
  late String username;
  late String password;
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => _scrollToBottom());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Peker App'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('Peker App',
                style:TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
            keyboardType: TextInputType.name,
            textAlign: TextAlign.center,
            onChanged: (value) {
              username = value;
            },
            decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your Name')),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                  keyboardType: TextInputType.visiblePassword,
                  textAlign: TextAlign.center,
                  cursorColor: Colors.black,

                  onChanged: (value) {
                  password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password')),
              SizedBox(
                height: 8.0,
          ),
          ///IconButton(
              ///icon: Icon(
                 /// CupertinoIcons.upload_circle),
              ///onPressed: () async {
                ///_sendEmployee(username, password);
             /// }
          ///),
              IconButton(
                  icon: Icon(
                   CupertinoIcons.arrow_right_circle_fill),
                  onPressed: () async {
                    var check_login = await _checkVerification(username, password);
                    if (check_login) {
                      [Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(username, password)))];
                    }
                  }
              )],
      ),
    ),

    );
  }

  _sendEmployee(username, password) {
    final employee = Employee("",username, password,"","","","","","","","","","","","",false,"",false,false,"","","","",false);
    widget.employeeDao.saveEmployee(employee);
    setState(() {});
  }
  _updateEmployee(username, password, key, value) {
    final employee = Employee("",username, password,"","","","","","","","","","","","",false,"",false,false,"","","","",false);
    widget.employeeDao.updateEmployee(employee, key, value);
    setState(() {});

  }
  _checkVerification(username, password) async {
    final ref = FirebaseDatabase.instance.reference();
    final snapshot = await ref.child('Companies').child('Peker').child('Employee').child(username).child('Login_Info').get();
    String password_check = password.toString();
    String username_check = username.toString();
    String check_username_v1 = ("username: " + username_check );
    String check_username = check_username_v1.toString();
    String check_password_v1 = ( "password: " + password_check);
    String check_password = check_password_v1.toString();
    bool check_contain = false;
    if (snapshot != null) {
      String info = snapshot.value.toString();
      print(info);
      if (info.contains(check_username) && info.contains(check_password)) {
        check_contain = true;
      }

      print(check_contain);
    } else {
      print('No data available.');
    }
    return check_contain;
  }
  bool _canPushEmployee() => username.isNotEmpty;


  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }


}
class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  final employeeDao = EmployeeDao();

  @override
  LoginPageState createState() => LoginPageState();
}
