import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> create() async {
  await Firebase.initializeApp();
  CollectionReference ref = FirebaseFirestore.instance.collection('Users');
  ref.doc('5678').set({"name": "test2"});
  return;
}

Future<void> read() async {
  await Firebase.initializeApp();

  FirebaseFirestore.instance
      .collection('Users')
      .where('name', isEqualTo: "test2")
      .get()
      .then((snapshot) {
    if (snapshot != null) {
      snapshot.docs.forEach((element) {
        print(element.id);
        print(element.data().toString());
      });
    } else {
      print("No data found");
    }
  });
  return;
}

Future<void> update() async {
  await Firebase.initializeApp();
  CollectionReference ref = FirebaseFirestore.instance.collection('Users');
  ref
      .doc('1234')
      .update({"name": "test1"})
      .then((value) => print("Success"))
      .catchError((error) => print(error.toString()));
  return;
}

Future<void> delete() async {
  await Firebase.initializeApp();
  CollectionReference ref = FirebaseFirestore.instance.collection('Users');
  ref
      .doc('9123')
      .delete()
      .then((value) => print("Success"))
      .catchError((error) => print(error.toString()));
  return;
}
