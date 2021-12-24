import 'package:flutter/cupertino.dart';
import 'package:flutter_dien_trach_farm/models/giaidoan_model.dart';
import 'package:flutter_dien_trach_farm/models/quytrinh_model.dart';
import 'package:flutter_dien_trach_farm/services/firebase_services.dart';
import 'package:get/get.dart';

class QLQTEditController extends GetxController{

  QuyTrinhModel? quyTrinhModel;
  bool? isAdding;
  final formKey = GlobalKey<FormState>();


  void addGiaiDoan(){
    quyTrinhModel!.cacGiaiDoan.add(GiaiDoanModel());
    update();
  }

  void addBuoc(int index){
    quyTrinhModel!.cacGiaiDoan[index].cacBuoc.add("");
    update();
  }

  void onConfirmTap(){
    formKey.currentState!.save();
    if(isAdding!){
      upLoadQuyTrinh(quyTrinhModel!);
      Get.back();
    } else{
      Get.back(result: [{"quytrinh": quyTrinhModel}]);
    }
  }

  void onCancelEditTap(){
    Get.back();
  }
}