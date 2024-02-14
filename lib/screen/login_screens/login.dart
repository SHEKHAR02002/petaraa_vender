import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:petaraa_vender/api/authapi.dart';
import 'package:petaraa_vender/constant/color.dart';
import 'package:petaraa_vender/screen/login_screens/otppopup.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _phoneNo = TextEditingController();

  loginbtnfunction() {
    if (_phoneNo.text.isNotEmpty) {
      Map<String, String> requestBody = {
        'phoneNo': _phoneNo.text,
      };
      Auth().login(requestBody: requestBody, ref: ref).then((value) {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => OtpPopUp(
                  phoneno: _phoneNo.text,
                ));
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "petaraa",
                    style: TextStyle(
                        color: primary4Color,
                        fontSize: 26,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Autour"),
                  ),
                  Text(
                    "SHOP",
                    style: TextStyle(
                        color: primary4Color,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Autour"),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: SvgPicture.asset(
                  "assets/images/login.svg",
                  // height: height / 2.2,
                  width: width,
                ),
              ),
              const Text(
                'Enter your mobile number to continue',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 0, top: 30, left: 15, right: 15),
                child: IntlPhoneField(
                  dropdownTextStyle: const TextStyle(fontSize: 14),
                  style: const TextStyle(fontSize: 14),
                  initialCountryCode: "IN",
                  showDropdownIcon: false,
                  showCountryFlag: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  controller: _phoneNo,
                  onChanged: (value) {
                    if (_phoneNo.text.length == 10) {
                      FocusScopeNode currentFocus = FocusScope.of(context);

                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                    }
                  },
                  onCountryChanged: (country) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
                child: ElevatedButton(
                    onPressed: loginbtnfunction,
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: primaryColor,
                        minimumSize: Size(width, 50)),
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}