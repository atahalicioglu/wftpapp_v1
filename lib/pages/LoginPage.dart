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



class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  late String username;
  late String password;
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => _scrollToBottom());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('wftpapp.com'),
        backgroundColor: Color.fromRGBO(2, 24, 89, 1),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 20,),
              Container(
                height: 150.0,
                width: 150.0,
                child: Container(
                    child: new Center(
                      child: new Image.asset('lib/assets/images/logo3.png', fit:BoxFit.fill)
                )),
              ),
              Text('wftpapp.com',
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
                hintText: 'username')),
              SizedBox(
                height: 8.0
              ),
              TextField(
                  keyboardType: TextInputType.visiblePassword,
                  textAlign: TextAlign.center,
                  cursorColor: Colors.black,
                  onChanged: (value) {
                  password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                  hintText: 'password')),
              SizedBox(
                height: 8.0,
          ),
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
    bool check_contain = false;
    if (snapshot != null) {
      var info = Map <String, dynamic>.from(snapshot.value as Map);
      if ((info['username'] == username) && (info['password'] == password)) {
        check_contain = true;
      }
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
