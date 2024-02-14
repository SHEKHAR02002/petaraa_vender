import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petaraa_vender/api/authapi.dart';
import 'package:petaraa_vender/constant/color.dart';
import 'package:petaraa_vender/provider/imagecropper.dart';
import 'package:petaraa_vender/screen/navbar.dart';
import 'package:petaraa_vender/widget/miscellaneous/decoration.dart';

class AddNewUser extends ConsumerStatefulWidget {
  final String phoneno;
  const AddNewUser({super.key, required this.phoneno});

  @override
  ConsumerState<AddNewUser> createState() => _AddNewUserState();
}

class _AddNewUserState extends ConsumerState<AddNewUser> {
  final TextEditingController _userName = TextEditingController(),
      _email = TextEditingController();

  final GlobalKey<FormState> _emailInputBoxKey = GlobalKey<FormState>();

  //take image function
  DateTime dateofbirth =
      DateTime.now().subtract(const Duration(days: 18 * 365));

  String customProfileImage = '';
  Future<dynamic> takeImages({required source}) async {
    try {
      final XFile? image = await ImagePicker().pickImage(source: source);
      String cropFile = await userImage(pickedFile: image);
      setState(() {
        customProfileImage = cropFile;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  //date picker
  pickdate() async {
    var tempdateofbirth = await showDatePicker(
      context: context,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
                primary: primaryColor,
                onPrimary: Colors.white,
                onSurface: primaryColor),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  foregroundColor: primaryColor // button text color
                  ),
            ),
          ),
          child: child!,
        );
      },
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (tempdateofbirth != null) {
      setState(() {
        dateofbirth = tempdateofbirth;
      });
    }
  }

  //
  adduserbtnfuncation() async {
    FormData requestdata = FormData.fromMap({
      'venderName': _userName.text,
      'emailId': _email.text,
      'dob': dateofbirth,
      'phoneNo': widget.phoneno,
      'profileImage': await MultipartFile.fromFile(customProfileImage,
          filename: 'profilepic')
    });
    Auth().createprofile(requestdata: requestdata);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("CREATE PROFILE",
            style: TextStyle(
                fontFamily: "Autour",
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: primary4Color)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: GestureDetector(
                    // onTap: () => bottomSheet(height: height),
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        customProfileImage == ""
                            ? Icon(
                                CupertinoIcons.person_alt_circle,
                                size: 100,
                                color: Colors.grey.shade400,
                              )
                            : CircleAvatar(
                                backgroundColor: primary3Color,
                                radius: 70,
                                foregroundImage:
                                    FileImage(File(customProfileImage)),
                              ),
                        Positioned(
                          bottom: 2,
                          right: 8,
                          child: Icon(
                            Icons.add_circle_outlined,
                            size: 30,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text("Name",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 20),
                  child: Container(
                    height: 50,
                    decoration: shadowdecoration,
                    child: TextField(
                      controller: _userName,
                      textCapitalization: TextCapitalization.words,
                      style: text20_400,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(15),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Email ID",
                  style: text18_400,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 20),
                  child: Container(
                    decoration: shadowdecoration,
                    width: width,
                    child: Form(
                      key: _emailInputBoxKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: TextField(
                        autofillHints: const [AutofillHints.email],
                        onChanged: (val) {
                          _emailInputBoxKey.currentState?.validate();
                        },
                        style: text20_400,
                        controller: _email,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(15),
                          filled: true,
                          fillColor: Colors.white,
                          errorBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.red)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Phone no.",
                  style: text18_400,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 20),
                  child: Container(
                    height: 50,
                    decoration: shadowdecoration,
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        label: Text(widget.phoneno),
                        labelStyle: text20_400,
                        contentPadding: const EdgeInsets.all(15),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Date Of Birth",
                  style: text18_400,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 20),
                  child: GestureDetector(
                    onTap: pickdate,
                    child: Container(
                        height: 50,
                        decoration: shadowdecoration,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "Date Of Birth",
                            style: text20_400,
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 35),
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const NavigationBarScreen()),
                  (route) => false);
            },
            style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: primaryColor,
                minimumSize: Size(width, 50)),
            child: const Text(
              "Create",
              style: TextStyle(
                  fontFamily: "Overpass",
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            )),
      ),
    );
  }
}