import 'package:flutter/material.dart';
import 'package:flutter_dien_trach_farm/models/quytrinh_model.dart';
import 'package:flutter_dien_trach_farm/screens/KTV/qlqt/quytrinh_edit/qlqt_edit_screen.dart';
import 'package:flutter_dien_trach_farm/services/firebase_services.dart';
import 'package:get/get.dart';

class QLQTViewController extends GetxController{

  QuyTrinhModel? quyTrinhModel;
  bool? isEditing;
  String loaiCayTrong = "Dưa hoàng hậu";
  final formKey = GlobalKey<FormState>();

  void onEditTap(){
    Get.to(() => QLQTEditScreen(quytrinh: quyTrinhModel!, isAdding: false))!
    .then((result) {
      if(result[0] != null){
        quyTrinhModel = result[0]['quytrinh'];
        print(quyTrinhModel!.ten);
        formKey.currentState!.reset();
        update();
      }
    });
  }

}