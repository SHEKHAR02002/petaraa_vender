import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petaraa_vender/api/authapi.dart';
import 'package:petaraa_vender/constant/variableconstat.dart';
import 'package:petaraa_vender/screen/login_screens/addnewuser.dart';
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
    Auth().verifyotp(requestBody: requestBody).then((value) => value
        ? Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => AddNewUser(
                      phoneno: widget.phoneno,
                    )),
            (route) => false)
        : log('Invalid OTP'));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 40, 15, 25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Enter verification code we've sent you ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )),
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
          ],
        ),
      ),
    );
  }
}
