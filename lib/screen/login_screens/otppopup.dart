import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petaraa_vender/constant/variableconstat.dart';
import 'package:petaraa_vender/screen/login_screens/addnewuser.dart';
import 'package:pinput/pinput.dart';

class OtpPopUp extends ConsumerStatefulWidget {
  const OtpPopUp({super.key});

  @override
  ConsumerState<OtpPopUp> createState() => _OtpPopUpState();
}

class _OtpPopUpState extends ConsumerState<OtpPopUp> {
  TextEditingController smsCode = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    smsCode.text = ref.watch(optProvider);
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
                controller: smsCode,
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
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const AddNewUser()),
                      (route) => false);
                },
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
