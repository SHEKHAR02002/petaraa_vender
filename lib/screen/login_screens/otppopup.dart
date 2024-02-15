import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:petaraa_vender/api/authapi.dart';
import 'package:petaraa_vender/constant/color.dart';
import 'package:petaraa_vender/constant/variableconstat.dart';
import 'package:petaraa_vender/screen/login_screens/addnewuser.dart';
import 'package:petaraa_vender/screen/navbar.dart';
import 'package:pinput/pinput.dart';

class OtpPopUp extends ConsumerStatefulWidget {
  final String phoneno;
  const OtpPopUp({super.key, required this.phoneno});

  @override
  ConsumerState<OtpPopUp> createState() => _OtpPopUpState();
}

class _OtpPopUpState extends ConsumerState<OtpPopUp> {
  verifyotpbtnfunction() {
    Map<String, String> requestBody = {
      'phoneNo': widget.phoneno,
      'otpCode': ref.watch(optProvider).text
    };
    Auth().verifyotp(requestBody: requestBody, ref: ref).then((value) {
      if (value) {
        if (ref.watch(useretypeProvider)) {
          Auth().getuserdetails(ref: ref).whenComplete(() {
            Navigator.pushAndRemoveUntil(
                context,
                PageTransition(
                    duration: const Duration(seconds: 1),
                    type: PageTransitionType.fade,
                    child: const NavigationBarScreen()),
                (route) => false);
          });
        } else {
          Navigator.pushAndRemoveUntil(
              context,
              PageTransition(
                  duration: const Duration(seconds: 1),
                  type: PageTransitionType.rightToLeft,
                  child: AddNewUser(
                    phoneno: widget.phoneno,
                  )),
              (route) => false);
        }
      } else {
        log('Invalid OTP');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
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
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                child: SvgPicture.asset(
                  "assets/images/otp.svg",
                  // height: height / 2.2,
                  width: width,
                ),
              ),
              const Text(
                "Enter verification code we've sent you",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 20),
                child: Pinput(
                  length: 4,
                  controller: ref.watch(optProvider),
                  onChanged: (value) =>
                      ref.watch(optProvider.notifier).state.text = value,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    elevation: 0,
                    backgroundColor: Theme.of(context).primaryColor,
                    minimumSize: Size(width, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: verifyotpbtnfunction,
                  child: const Text(
                    'VERIFY',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text('Re-send',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
