class UserDetails {
  bool? success;
  String? message;
  Userdata? data;

  UserDetails({this.success, this.message, this.data});

  UserDetails.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Userdata.fromJson(json['data']) : null;
  }
}

class Userdata {
  String? sId;
  String? phoneNo;
  int? status;
  String? dob;
  String? emailId;
  String? shopId;
  bool? showShopDetails;
  String? venderName;
  String? profileImage;

  Userdata(
      {this.sId,
      this.phoneNo,
      this.status,
      this.dob,
      this.emailId,
      this.shopId,
      this.showShopDetails,
      this.venderName,
      this.profileImage});

  Userdata.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    phoneNo = json['phoneNo'];
    status = json['status'];
    dob = json['dob'];
    emailId = json['emailId'];
    shopId = json['shopId'];
    showShopDetails = json['showShopDetails'];
    venderName = json['venderName'];
    profileImage = json['profileImage'];
  }
}
