import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petaraa_vender/constant/variableconstat.dart';
import 'package:petaraa_vender/model/usermodel.dart';

class Auth {
  final dio = Dio();

  //Login API
  Future login(
      {required Map<String, String> requestBody,
      required WidgetRef ref}) async {
    try {
      String url = '$baseurl/v1/auth/venderSendPhoneOtp';
      //post data
      Response response = await dio.post(
        url,
        data: requestBody,
      );
      Map data = response.data;
      if (response.statusCode == 200) {
        ref.watch(optProvider.notifier).state.text = data['otpCode'].toString();
        log(data['message']);
      } else {
        log(data['message']);
      }
    } catch (e) {
      log("${e.toString()}+1");
    }
  }

  //Verify OTP API
  Future<bool> verifyotp(
      {required Map<String, String> requestBody,
      required WidgetRef ref}) async {
    try {
      log(requestBody.toString());
      String url = '$baseurl/v1/auth/venderVerifyPhoneOtp';
      //post data
      Response response = await dio.post(
        url,
        data: requestBody,
      );
      Map data = response.data;
      if (response.statusCode == 200) {
        //sucess toast
        if (data['userExisted']) {
          ref.watch(tokenProvider.notifier).state = data['token'];
        }
        ref.watch(useretypeProvider.notifier).state = data['userExisted'];
        return data['success'];
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  //create user API
  Future<bool> createprofile(
      {required FormData requestdata, required WidgetRef ref}) async {
    try {
      String url = '$baseurl/v1/vender/venderCreateUpdateUser';
      final response = await dio.post(url, data: requestdata);
      Map data = response.data;
      if (response.statusCode == 200) {
        //sucess toast
        ref.watch(tokenProvider.notifier).state = data['token'];
        getuserdetails(ref: ref);
        log(data['message']);
        return true;
      } else {
        //error toast
        return false;
      }
    } catch (e) {
      log(e.toString());
      //error toast
      return false;
    }
  }

  //get user API
  Future getuserdetails({required WidgetRef ref}) async {
    try {
      String url = '$baseurl/v1/vender/venderUser';
      dio.options.headers['x-access-token'] = ref.watch(tokenProvider);
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        log(response.data['message']);
        ref.watch(userdetailsProvider.notifier).state =
            UserDetails.fromJson(response.data);
      } else {
        log(response.data['message']);
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
