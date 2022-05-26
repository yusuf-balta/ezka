import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezka/constans/enums/end_point.dart';
import 'package:ezka/model/user_model.dart';
import 'package:ezka/widgets/app_dialogs.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseService {
  FirebaseFirestore ref = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> setData({required String endPoint, required dynamic data}) async {
    try {
      await ref.collection(endPoint).doc(firebaseAuth.currentUser?.uid).set(data);
    } catch (e) {
      AppDialogs.failedSnackbar(e.toString());
    }
  }

  Future<void> setAdress({required String endPoint, required dynamic data}) async {
    try {
      await ref.collection(endPoint).doc(firebaseAuth.currentUser!.uid).update(data);
    } catch (e) {
      AppDialogs.failedSnackbar(e.toString());
    }
  }

  Future<UserModel?> getAdress({required String name, required String surName, required String cityName}) async {
    try {
      final response = await ref.collection(EndPoint.users.path).where("cityName", isEqualTo: cityName).where("surName", isEqualTo: surName).where("name", isEqualTo: name).get();
      final data = response.docs.first.data();
      return UserModel.fromMap(data);
    } catch (e) {
      AppDialogs.failedSnackbar(e.toString());
    }
    return null;
  }

  Future<void> logOut() async {
    firebaseAuth.signOut();
  }
}
