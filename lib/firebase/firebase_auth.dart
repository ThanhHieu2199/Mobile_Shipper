import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirAuth {
  final FirebaseAuth _fireBaseAuth = FirebaseAuth.instance;
//tao user pass
  void signUp(String email, String pass, String name, String phone,
      Function onSuccess) {
    _fireBaseAuth
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((user) {
      //

      // _createUser(user.uid, name, phone, onSuccess);
      print(user);
    }).catchError((err) {

    });
  }
//luu thong tin len firebase
  _createUser(String userId, String name, String phone, Function onSuccess) {
    var user = {"name": name, "phone": phone};
    var ref = FirebaseDatabase.instance.reference().child("users");
    ref.child(userId).set(user).then((user) {
      onSuccess();
    }).catchError((err) {

    });
  }
}
