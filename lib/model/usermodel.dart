class UserDetails {
  String? sId;
  String? phoneNo;
  int? status;
  String? dob;
  String? emailId;
  String? shopId;
  bool? showShopDetails;
  String? venderName;
  String? profileImage;

  UserDetails(
      {this.sId,
      this.phoneNo,
      this.status,
      this.dob,
      this.emailId,
      this.shopId,
      this.showShopDetails,
      this.venderName,
      this.profileImage});

  UserDetails.fromJson(Map<String, dynamic> json) {
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
