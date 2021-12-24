import 'package:flutter/material.dart';
import 'package:flutter_dien_trach_farm/constants/color_constants.dart';
import 'package:flutter_dien_trach_farm/constants/style_constants.dart';
import 'package:flutter_dien_trach_farm/main.dart';
import 'package:flutter_dien_trach_farm/screens/KTV/home_screen/ktv_home_screen.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    loginController.scaffoldContext = context;
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            height: double.infinity,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Image(
                    image: AssetImage("assets/logo.png"),
                    width: 200,
                    height: 200,
                  ),
                  _usernameForm(
                    title: "Tên đăng nhập",
                    usernameController: loginController.usernameController,
                  ),
                  GetBuilder<LoginController>(
                    builder: (loginController) {
                      return _passwordForm(
                        title: "Mật khẩu", 
                        isObscure: loginController.isObscure,
                        passwordController: loginController.passwordController,
                        onObscureTap: loginController.onObscureTap,
                      );
                    }
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Vai trò",
                          style: TextStyle(
                            color: greyTextColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Material(
                          borderRadius: BorderRadius.circular(30.0),
                          elevation: 5.0,
                          shadowColor: mainGreenColor,
                          child: InputDecorator(
                            decoration: loginFormDecoration,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                isDense: true,
                                isExpanded: true,
                                value: loginController.role,
                                elevation: 16,
                                style: const TextStyle(color: Colors.black),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    loginController.role = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Kỹ thuật viên',
                                  'Kế toán',
                                  'Quản lý vườn'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Quên mật khẩu?",
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: greyTextColor,
                                  fontFamily: 'OpenSans',
                                ),
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(30.0),
                          elevation: 5.0,
                          shadowColor: mainGreenColor,
                          child: Container(
                            decoration: BoxDecoration(
                              color: mainGreenColor,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                minimumSize: const Size.fromHeight(0),
                              ),
                              onPressed: () => loginController.login(),
                              child: const Text(
                                "Đăng nhập",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _usernameForm({
  required String title,
  required TextEditingController usernameController
}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            color: greyTextColor,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
        const SizedBox(height: 10.0),
        Material(
          borderRadius: BorderRadius.circular(30.0),
          elevation: 5.0,
          shadowColor: mainGreenColor,
          child: TextFormField(
            controller: usernameController,
            keyboardType: TextInputType.name,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: loginFormDecoration,
          ),
        ),
      ],
    ),
  );
}

Widget _passwordForm({
  required String title,
  required bool isObscure,
  required TextEditingController passwordController,
  required VoidCallback onObscureTap
}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            color: greyTextColor,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
        const SizedBox(height: 10.0),
        Material(
          borderRadius: BorderRadius.circular(30.0),
          elevation: 5.0,
          shadowColor: mainGreenColor,
          child: TextFormField(
            controller: passwordController,
            obscureText: isObscure,
            keyboardType: TextInputType.name,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  isObscure?Icons.remove_red_eye_outlined:Icons.remove_red_eye,
                  color: greyTextColor,
                ),
                onPressed: () => onObscureTap(),
              ),
              errorStyle: kErrorStyle,
              fillColor: Colors.white24,
              filled: true,
              contentPadding: const EdgeInsets.fromLTRB(20.0, 14.0, 20.0, 0),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(
                  width: 1.0,
                  color: mainGreenColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(
                  width: 1.0,
                  color: mainGreenColor,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1.0,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1.0,
                ),
              )),
          ),
        ),
      ],
    ),
  );
}
