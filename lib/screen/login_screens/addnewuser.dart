import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:petaraa_vender/api/authapi.dart';
import 'package:petaraa_vender/constant/color.dart';
import 'package:petaraa_vender/provider/imagecropper.dart';
import 'package:petaraa_vender/screen/navbar.dart';
import 'package:petaraa_vender/widget/miscellaneous/decoration.dart';
import 'package:petaraa_vender/widget/miscellaneous/toastui.dart';

class AddNewUser extends ConsumerStatefulWidget {
  final String phoneno;
  const AddNewUser({super.key, required this.phoneno});

  @override
  ConsumerState<AddNewUser> createState() => _AddNewUserState();
}

class _AddNewUserState extends ConsumerState<AddNewUser> {
  //textediting controllers
  final TextEditingController _userName = TextEditingController(),
      _email = TextEditingController();

  //key
  final GlobalKey<FormState> _emailInputBoxKey = GlobalKey<FormState>();

  //provider
  StateProvider customProfileImageProvider = StateProvider((ref) => '');
  StateProvider<String> dateofbirthProvider = StateProvider((ref) => '');

  //take image function
  Future<dynamic> takeImages({required source}) async {
    try {
      final XFile? image = await ImagePicker().pickImage(source: source);
      String cropFile = await userImage(pickedFile: image);
      ref.watch(customProfileImageProvider.notifier).state = cropFile;
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
      DateFormat outputFormat = DateFormat('yyyy-MM-dd');
      String formattedDatetoday = outputFormat.format(tempdateofbirth);
      ref.watch(dateofbirthProvider.notifier).state = formattedDatetoday;
    }
  }

  //add user functiom
  adduserbtnfuncation() async {
    if (_userName.text.isNotEmpty &&
        _email.text.isNotEmpty &&
        ref.watch(dateofbirthProvider).toString() != "" &&
        ref.watch(customProfileImageProvider).toString() != "") {
      FormData requestdata = FormData.fromMap({
        'venderName': _userName.text,
        'emailId': _email.text,
        'dob': ref.watch(dateofbirthProvider),
        'phoneNo': widget.phoneno,
        'profileImage': await MultipartFile.fromFile(
            ref.watch(customProfileImageProvider).toString(),
            filename: 'profilepic')
      });
      if (!mounted) return;
      Auth()
          .createprofile(requestdata: requestdata, ref: ref, context: context)
          .then((value) {
        if (value) {
          if (value) {
            Auth().getuserdetails(ref: ref, context: context).whenComplete(() =>
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const NavigationBarScreen()),
                    (route) => false));
          }
        }
      });
    } else {
      toast(msg: "All Field Requried", context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
        body: SingleChildScrollView(
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
                    onTap: () => takeImages(source: ImageSource.camera),
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        ref.watch(customProfileImageProvider) == ""
                            ? Icon(
                                CupertinoIcons.person_alt_circle,
                                size: 100,
                                color: Colors.grey.shade400,
                              )
                            : CircleAvatar(
                                backgroundColor: primary3Color,
                                radius: 50,
                                foregroundImage: FileImage(File(ref
                                    .watch(customProfileImageProvider)
                                    .toString())),
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
                TextField(
                  controller: _userName,
                  textCapitalization: TextCapitalization.words,
                  style: text16_400,
                  decoration: InputDecoration(
                      filled: true,
                      contentPadding: const EdgeInsets.all(18),
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x1A333333),
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x1A333333),
                          ),
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(height: 20),
                Text(
                  "Email ID",
                  style: text18_400,
                ),
                Form(
                  key: _emailInputBoxKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: TextField(
                    autofillHints: const [AutofillHints.email],
                    onChanged: (val) {
                      _emailInputBoxKey.currentState?.validate();
                    },
                    controller: _email,
                    textCapitalization: TextCapitalization.words,
                    style: text16_400,
                    decoration: InputDecoration(
                        filled: true,
                        contentPadding: const EdgeInsets.all(18),
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x1A333333),
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x1A333333),
                            ),
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Phone no.",
                  style: text18_400,
                ),
                TextField(
                  readOnly: true,
                  textCapitalization: TextCapitalization.words,
                  style: text16_400,
                  decoration: InputDecoration(
                      hintText: widget.phoneno,
                      hintStyle: text16_400,
                      filled: true,
                      contentPadding: const EdgeInsets.all(18),
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x1A333333),
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x1A333333),
                          ),
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(height: 20),
                Text(
                  "Date Of Birth",
                  style: text18_400,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 20),
                  child: GestureDetector(
                    onTap: pickdate,
                    child: Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width,
                        decoration: shadowdecoration,
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            ref.watch(dateofbirthProvider).toString() == ""
                                ? "Select DOB"
                                : ref.watch(dateofbirthProvider).toString(),
                            style: text16_400,
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 35),
          child: ElevatedButton(
              onPressed: adduserbtnfuncation,
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
      ),
    );
  }
}
