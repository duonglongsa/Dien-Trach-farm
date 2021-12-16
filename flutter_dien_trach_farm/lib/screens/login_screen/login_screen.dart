import 'package:flutter/material.dart';
import 'package:flutter_dien_trach_farm/constants/color_constants.dart';
import 'package:flutter_dien_trach_farm/constants/style_constants.dart';
import 'package:flutter_dien_trach_farm/main.dart';
import 'package:flutter_dien_trach_farm/screens/KTV/home_screen/ktv_home_screen.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String dropdownValue = "Kỹ thuật viên";
  @override
  Widget build(BuildContext context) {
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
                  _loginForm(
                    title: "Tên đăng nhập",
                    isObscure: false,
                  ),
                  _loginForm(title: "Mật khẩu", isObscure: true),
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
                                value: dropdownValue,
                                elevation: 16,
                                style: const TextStyle(color: Colors.black),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
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
                        const SizedBox(height: 20,),
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
                                minimumSize: Size.fromHeight(0),
                              ),
                              onPressed: () {
                                Get.to(() => const KTVHome());
                              },
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

Widget _loginForm({
  required String title,
  required bool isObscure,
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
            obscureText: isObscure,
            onChanged: (value) {},
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
