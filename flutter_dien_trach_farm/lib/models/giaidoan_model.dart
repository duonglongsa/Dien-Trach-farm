
import 'package:cloud_firestore/cloud_firestore.dart';

class GiaiDoanModel{
  String? id;
  int? stt;
  int? thoiGian;
  List<String> cacBuoc = [];

  GiaiDoanModel();

  GiaiDoanModel.fromDocumentSnapshot(
      QueryDocumentSnapshot snapshot,
      ) {
    id = snapshot.id;
    stt = snapshot.get('stt');
    thoiGian = snapshot.get('thời gian');
    cacBuoc = List.from(snapshot.get("các bước"));
  }

  Map<String, Object?> toJson(){
    return {
      'stt': stt,
      'thời gian': thoiGian,
      'các bước': cacBuoc,
    };
  }
}