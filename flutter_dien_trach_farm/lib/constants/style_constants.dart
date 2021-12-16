import 'package:flutter/material.dart';
import 'package:flutter_dien_trach_farm/constants/color_constants.dart';

const kPageHeadingStye = TextStyle(
  fontSize: 20,
  color: Colors.white,
  fontFamily: 'OpenSans',
);

final kHintTextStyle = TextStyle(
  color: greyTextColor,
  fontFamily: 'OpenSans',
);

const kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

const kErrorStyle =  TextStyle(
  color: Colors.amber,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: const Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(20.0),
  boxShadow:  const [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final nameInputDecoration = InputDecoration(
    errorStyle: kErrorStyle,
    fillColor: Colors.white24,
    filled: true,
    hintText: 'Enter your Name',
    hintStyle: kHintTextStyle,
    contentPadding: const EdgeInsets.only(top: 14.0),
    prefixIcon: const Icon(
      Icons.account_box,
      color: Colors.white,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        width: 0.0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        width: 0.0,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1.0,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1.0,
      ),
    )
);

final loginFormDecoration = InputDecoration(
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
    )
);

final normalFormDecoration = InputDecoration(
    errorStyle: kErrorStyle,
    fillColor: Colors.white24,
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(20.0, 14.0, 20.0, 0),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        width: 1.0,
        color: mainGreenColor,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        width: 1.0,
        color: mainGreenColor,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1.0,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1.0,
      ),
    )
);


final passwordInputDecoration = InputDecoration(
    errorStyle: kErrorStyle,
    fillColor: Colors.white24,
    filled: true,
    contentPadding: const EdgeInsets.only(top: 14.0),
    prefixIcon: const Icon(
      Icons.lock,
      color: Colors.white,
    ),
    hintText: 'Enter Password',
    hintStyle: kHintTextStyle,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        width: 0.0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        width: 0.0,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1.0,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1.0,
      ),
    )
);