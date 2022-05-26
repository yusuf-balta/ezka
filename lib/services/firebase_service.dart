import 'package:ezka/widgets/app_dialogs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FireBaseService {
  FirebaseDatabase ref = FirebaseDatabase.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> setData({required String endPoint, required dynamic data}) async {
    try {
      await ref.ref(endPoint).child(firebaseAuth.currentUser!.uid).set(data);
    } catch (e) {
      AppDialogs.failedSnackbar(e.toString());
    }
  }

  Future<void> logOut() async {
    firebaseAuth.signOut();
  }
}
