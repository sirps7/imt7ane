

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../models/colors.dart';


final defaultPinTheme = PinTheme(
  width: 56,
  height: 60,
  textStyle: TextStyle(fontSize: 20,color: MyColor.mainColor),
  decoration: BoxDecoration(
    color: Color.fromRGBO(222, 231, 240, .57),
    borderRadius: BorderRadius.circular(8),
    border: Border.all(color: Colors.transparent),
  ),
);

// final focusedPinTheme = defaultPinTheme.copyDecorationWith(
//   border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
//   borderRadius: BorderRadius.circular(8),
// );
//
// final submittedPinTheme = defaultPinTheme.copyWith(
//   decoration: defaultPinTheme.decoration?.copyWith(
//     color: Color.fromRGBO(234, 239, 243, 1),
//   ),
// );
