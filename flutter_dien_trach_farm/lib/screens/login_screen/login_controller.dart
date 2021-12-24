import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dien_trach_farm/screens/KTV/home_screen/ktv_home_screen.dart';
import 'package:flutter_dien_trach_farm/services/firebase_services.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  BuildContext? scaffoldContext;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String role = "Kỹ thuật viên";

  bool isObscure = true;

  void onObscureTap(){
    isObscure = !isObscure;
    update();
  }

  void login() async {
    bool res = await firebaseLogin(usernameController.text, passwordController.text, role);
    if (res) {
      Get.to(()=> const KTVHome());
    } else {
      ScaffoldMessenger.of(scaffoldContext!).showSnackBar(const SnackBar(content: Text("Tên đăng nhập hoặc mật khẩu không chính xác!")));
    }
  }

}