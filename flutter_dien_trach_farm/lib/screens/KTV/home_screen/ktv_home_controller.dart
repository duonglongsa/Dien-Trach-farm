import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dien_trach_farm/screens/KTV/home_screen/ktv_home_screen.dart';
import 'package:flutter_dien_trach_farm/screens/KTV/qlqt/quytrinh_list/qlqt_screen.dart';
import 'package:flutter_dien_trach_farm/services/firebase_services.dart';
import 'package:get/get.dart';

class KTVHomeController extends GetxController{

  void onQLQTTap(){
    Get.to(() => const QLQTScreen());
  }

}