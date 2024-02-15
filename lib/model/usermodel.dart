class UserDetails {
  bool? success;
  String? message;
  UserData? data;

  UserDetails({this.success, this.message, this.data});

  UserDetails.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
}

class UserData {
  String? sId;
  String? phoneNo;
  int? status;
  String? dob;
  String? emailId;
  String? venderName;
  String? profileImage;
  // ShopDetails? shopDetails;
  bool? showShopDetails;

  UserData(
      {this.sId,
      this.phoneNo,
      this.status,
      this.dob,
      this.emailId,
      this.venderName,
      this.profileImage,
      // this.shopDetails,
      this.showShopDetails});

  UserData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    phoneNo = json['phoneNo'];
    status = json['status'];
    dob = json['dob'];
    emailId = json['emailId'];
    venderName = json['venderName'];
    profileImage = json['profileImage'];
    // shopDetails = json['shopDetails'] != null ? ShopDetails.fromJson(json['shopDetails']) : null;
    showShopDetails = json['showShopDetails'];
  }
}

// class ShopDetails {


// 	ShopDetails({});

// 	ShopDetails.fromJson(Map<String, dynamic> json);

// }