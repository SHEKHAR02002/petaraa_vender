import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petaraa_vender/constant/variableconstat.dart';
import 'package:petaraa_vender/model/shopmodel.dart';
import 'package:petaraa_vender/model/usermodel.dart';
import 'package:petaraa_vender/widget/miscellaneous/toastui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  final dio = Dio();

  //Login API
  Future login(
      {required Map<String, String> requestBody,
      required WidgetRef ref,
      required context}) async {
    try {
      String url = '$baseurl/v1/auth/venderSendPhoneOtp';
      //post data
      Response response = await dio.post(
        url,
        data: requestBody,
      );
      log(requestBody.toString());
      Map data = response.data;
      if (response.statusCode == 200) {
        ref.watch(optProvider.notifier).state.text = data['otpCode'].toString();
        toast(msg: data['message'], context: context);
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
      required WidgetRef ref,
      required context}) async {
    try {
      log(requestBody.toString());
      String url = '$baseurl/v1/auth/venderVerifyPhoneOtp';
      //post data
      Response response = await dio.post(
        url,
        data: requestBody,
      );
      Map data = response.data;
      SharedPreferences pref = await SharedPreferences.getInstance();
      if (response.statusCode == 200) {
        //sucess toast
        toast(msg: data['message'], context: context);
        if (data['success']) {
          if (data['userExisted']) {
            pref.setString('token', data['token']);
          }
          ref.watch(useretypeProvider.notifier).state = data['userExisted'];
        }
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
      {required  requestdata,
      required WidgetRef ref,
      required context}) async {
    try {
      String url = '$baseurl/v1/vender/venderCreateUpdateUser';
      log(requestdata.toString());
      final response = await dio.post(url, data: requestdata);
      Map data = response.data;
      SharedPreferences pref = await SharedPreferences.getInstance();
      if (response.statusCode == 200) {
        pref.setString('token', data['token']);

        toast(msg: data['message'], context: context);
        return true;
      } else {
        toast(msg: data['message'], context: context);
        return false;
      }
    } catch (e) {
      log(e.toString());
      toast(msg: "Something went wrong", context: context);
      return false;
    }
  }

  //get user API
  Future getuserdetails({required WidgetRef ref, required context}) async {
    try {
      String url = '$baseurl/v1/vender/venderUser';
      SharedPreferences pref = await SharedPreferences.getInstance();
      log(pref.getString('token').toString());
      dio.options.headers['x-access-token'] = pref.getString('token');
      final response = await dio.get(url);
      log(response.data.toString());
      if (response.statusCode == 200) {
        ref.watch(userdetailsProvider.notifier).state =
            UserDetails.fromJson(response.data['data']);
        if (response.data["data"]['showShopDetails']) {
          ref.watch(shopdetailsProvider.notifier).state =
              ShopDetails.fromJson(response.data['data']['shopData']);
        } else {
          toast(msg: 'Add Shop Details', context: context);
        }
      } else {
        log(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
