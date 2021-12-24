
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dien_trach_farm/models/giaidoan_model.dart';

class QuyTrinhModel{
  String? id;
  String? ten;
  String? loaiCayTrong;
  List<GiaiDoanModel> cacGiaiDoan = [];

  QuyTrinhModel();

    QuyTrinhModel.fromDocumentSnapshot(
      QueryDocumentSnapshot snapshot,
      ) {
    id = snapshot.id;
    ten = snapshot.get('tên');
    loaiCayTrong = snapshot.get("loại cây trồng");
  }

  Map<String, Object?> toJson(){
    return {
      'loại cây trồng': loaiCayTrong,
      'tên': ten, 
    };
  }
}