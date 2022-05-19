import 'package:firebase_database/firebase_database.dart';
import 'job.dart';

class JobDao{


  saveJob(Job job,username, password) async {
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
          String node_id = ("-" + info_v2[i].split(':')[0].toString());
          final DatabaseReference _JobReference = FirebaseDatabase.instance.reference().child('Employee').child(node_id);
          _JobReference.push().set(job.toJson());
        }
      }
    }
  }
}