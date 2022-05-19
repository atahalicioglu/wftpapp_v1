import 'package:firebase_database/firebase_database.dart';
import 'Employee.dart';

class EmployeeDao {
  final DatabaseReference _EmployeeRef =
  FirebaseDatabase.instance.reference().child('Employee');

  updateEmployee(Employee employee, key_2, updated) async{
    final ref = FirebaseDatabase.instance.reference();
    final snapshot = await ref.child('Employee').get();
    String password_check = employee.password.toString();
    String username_check = employee.username.toString();
    String check_username_v1 = ("username: " + username_check );
    String check_username = check_username_v1.toString();
    String check_password_v1 = ( "password: " + password_check);
    String check_password = check_password_v1.toString();
    if (snapshot != null) {
      String info = snapshot.value.toString();
      List info_v2 = info.split('}, -');
      for (int i = 0; i < info_v2.length; i++) {
        if (info_v2[i].contains(check_username) && info_v2[i].contains(check_password)) {
          String key = ("-" + info_v2[i].split(":")[0].split("[, ")[0].toString());
          print(key);
          Map<String,dynamic> childrenPathValueMap = {};
          childrenPathValueMap["Employee/$key/$key_2"] = updated;
          FirebaseDatabase.instance.reference().update(childrenPathValueMap);
        }
      }
    }
  }

  getEmployeeData(username, password) async {
    final ref = FirebaseDatabase.instance.reference();
    final snapshot = await ref.child('Employee').get();
    String password_check = password.toString();
    String username_check = username.toString();
    String check_username_v1 = ("username: " + username_check );
    String check_username = check_username_v1.toString();
    String check_password_v1 = ( "password: " + password_check);
    String check_password = check_password_v1.toString();
    if (snapshot != null) {
      String info = snapshot.value.toString();
      List info_v2 = info.split('}, -');
      for (int i = 0; i < info_v2.length; i++) {
        if (info_v2[i].contains(check_username) && info_v2[i].contains(check_password)) {
          print(info_v2[i]);
        }
      }
    }
  }

  saveEmployee(Employee employee) async {
    final ref = FirebaseDatabase.instance.reference();
    final snapshot = await ref.child('Employee').get();
    String password_check = employee.password.toString();
    String username_check = employee.username.toString();
    String check_username_v1 = ("username: " + username_check );
    String check_username = check_username_v1.toString();
    String check_password_v1 = ( "password: " + password_check);
    String check_password = check_password_v1.toString();
    bool check_contain = false;
    if (snapshot != null) {
      String info = snapshot.value.toString();
      List info_v2 = info.split('}, -');
      for (int i = 0; i < info_v2.length; i++) {
        if (info_v2[i].contains(check_username) && info_v2[i].contains(check_password)) {
          check_contain = true;
        }
      }
      if (check_contain == false) {
        _EmployeeRef.push().set(employee.toJson());
      } else {
        print("already signed up");
    }

    }
  }

  Query getEmployeeQuery() {
    return _EmployeeRef;
  }


}
