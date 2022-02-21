
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dien_trach_farm/models/giaidoan_model.dart';
import 'package:flutter_dien_trach_farm/models/quytrinh_model.dart';

Future<bool> firebaseLogin(String username, String password, String role) async{
  final querySnapshot = await FirebaseFirestore.instance
    .collection('users')
    .doc('users')
    .collection(role)
    .where('username', isEqualTo: username)
    .where('password', isEqualTo: password)
    .get();

  if(querySnapshot.docs.length == 1){
    return true;
  }
  return false;
}

Stream <List<QuyTrinhModel>> quyTrinhListStream(){
  final snapshot = FirebaseFirestore.instance.collection('Quy trình')
      .snapshots();
  return snapshot.map((qShot) => qShot.docs.map(
          (doc) => QuyTrinhModel.fromDocumentSnapshot(doc)).toList()
  );
}

Future<void> getGiaiDoanList(QuyTrinhModel quyTrinhModel) async {
  final snapshot = await FirebaseFirestore.instance.collection('Quy trình')
      .doc(quyTrinhModel.id)
      .collection("Các giai đoạn")
      .orderBy("stt", descending: false)
      .get();
  quyTrinhModel.cacGiaiDoan = snapshot.docs.map((data) => GiaiDoanModel.fromDocumentSnapshot(data)).toList();
  print(quyTrinhModel.cacGiaiDoan!.length);
}

Future<void> upLoadQuyTrinh(QuyTrinhModel quyTrinhModel) async {
  DocumentReference docRef = await FirebaseFirestore.instance.collection('Quy trình')
  .add(quyTrinhModel.toJson());
  for(GiaiDoanModel giaiDoan in quyTrinhModel.cacGiaiDoan!){
    FirebaseFirestore.instance.collection('Quy trình')
    .doc(docRef.id)
    .collection("Các giai đoạn")
    .add(giaiDoan.toJson());
  }
}

