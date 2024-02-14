import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petaraa_vender/constant/variableconstat.dart';

class Auth {
  final dio = Dio();

  //Logi API
  Future login({required String phoneNo, required WidgetRef ref}) async {
    try {
      String url = '$baseurl/v1/auth/venderSendPhoneOtp';

      Map<String, String> requestBody = {
        'phoneNo': phoneNo,
      };
      //post data
      Response response = await dio.post(
        url,
        queryParameters: requestBody,
        options: Options(contentType: 'application/json'),
      );
      var data = json.decode(response.data());
      if (response.statusCode == 200) {
        ref.watch(optProvider.notifier).state = data['otpCode'];
        log(data['message']);
      } else {
        log(data['message']);
      }
    } catch (e) {
      log("${e.toString()}+1");
    }
  }
}
