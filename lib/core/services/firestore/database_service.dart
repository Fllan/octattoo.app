// TODO : rework

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:octattoo_app/src/features/users/domain/user.dart';

const String usersCollectionRef = "users";

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _usersRef;

  DatabaseService() {
    _usersRef = _firestore.collection(usersCollectionRef).withConverter<User>(
      fromFirestore: (snapshots, _) => User.fromJson(
        snapshots.data()!,
      ),
      toFirestore: (user, _) => user.toJson());
  }

  void addUser(User user) async {
    _usersRef.add(user);
  }

  void updateUser(String uid, User user) {
    _usersRef.doc(uid).update(user.toJson());
  }

  void deleteUser(String uid) {
    _usersRef.doc(uid).delete();
  }


// ????????????????????????????????????????????
 void getUser(String uid) {
  _usersRef.doc(uid).get();
 }



}