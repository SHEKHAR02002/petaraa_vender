import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:petaraa_vender/constant/variableconstat.dart';
import 'package:petaraa_vender/widget/miscellaneous/toastui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shop {
  final dio = Dio();
  Future addshopdetails(
      {required Map<String, dynamic> requestBody, required context}) async {
    try {
      String url = '$baseurl/v1/vender/createShop';
      //post data
      SharedPreferences pref = await SharedPreferences.getInstance();
      log(pref.getString('token').toString());
      dio.options.headers['x-access-token'] = pref.getString('token');
      Response response = await dio.post(
        url,
        data: requestBody,
      );
      if (response.statusCode == 200) {
        toast(msg: response.data['message'].toString(), context: context);
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
