import 'package:flutter/material.dart';

BoxDecoration shadowdecoration = BoxDecoration(
  color: Colors.white,
  // border: Border.all(width: 1, color: Colors.grey),
  borderRadius: BorderRadius.circular(10),
  boxShadow: const [
    BoxShadow(
        color: Color(
          0x3f000000,
        ), //New
        blurRadius: 1.0,
        offset: Offset(0, 0))
  ],
);

TextStyle text14_400 = const TextStyle(
    fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.5);

TextStyle text16_400 = const TextStyle(
    fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5);
TextStyle text18_400 = const TextStyle(
    fontSize: 18, fontWeight: FontWeight.w400, letterSpacing: 0.5);
TextStyle text20_400 = const TextStyle(
    fontSize: 18, fontWeight: FontWeight.w400, letterSpacing: 0.5);

InputDecoration textfielddecoration = const InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 0.5, color: Colors.black), //<-- SEE HERE
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 0.5, color: Colors.black), //<-- SEE HERE
    ),
    contentPadding: EdgeInsets.all(5));
