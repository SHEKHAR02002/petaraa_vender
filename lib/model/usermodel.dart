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
  String? shopId;
  bool? showShopDetails;
  String? venderName;
  String? profileImage;
  ShopData? shopData;

  UserData(
      {this.sId,
      this.phoneNo,
      this.status,
      this.dob,
      this.emailId,
      this.shopId,
      this.showShopDetails,
      this.venderName,
      this.profileImage,
      this.shopData});

  UserData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    phoneNo = json['phoneNo'];
    status = json['status'];
    dob = json['dob'];
    emailId = json['emailId'];
    shopId = json['shopId'];
    showShopDetails = json['showShopDetails'];
    venderName = json['venderName'];
    profileImage = json['profileImage'];
    shopData =
        json['shopData'] != null ? ShopData.fromJson(json['shopData']) : null;
  }
}

class ShopData {
  String? sId;
  String? shopName;
  String? shopAddress;
  String? contactDetails;
  String? aboutUs;
  String? websiteLink;
  int? status;
  String? createdOn;
  String? modifiedOn;
  String? venderId;
  // List<Null>? externalShopImages;
  // List<Null>? extraImages;
  // List<Null>? internalShopImages;

  ShopData({
    this.sId,
    this.shopName,
    this.shopAddress,
    this.contactDetails,
    this.aboutUs,
    this.websiteLink,
    this.status,
    this.createdOn,
    this.modifiedOn,
    this.venderId,
    // this.externalShopImages,
    // this.extraImages,
    // this.internalShopImages
  });

  ShopData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    shopName = json['shopName'];
    shopAddress = json['shopAddress'];
    contactDetails = json['contactDetails'];
    aboutUs = json['aboutUs'];
    websiteLink = json['websiteLink'];
    status = json['status'];
    createdOn = json['created_on'];
    modifiedOn = json['modified_on'];
    venderId = json['venderId'];
    // if (json['externalShopImages'] != null) {
    //   externalShopImages = <Null>[];
    //   json['externalShopImages'].forEach((v) {
    //     externalShopImages!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['extraImages'] != null) {
    //   extraImages = <Null>[];
    //   json['extraImages'].forEach((v) {
    //     extraImages!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['internalShopImages'] != null) {
    //   internalShopImages = <Null>[];
    //   json['internalShopImages'].forEach((v) {
    //     internalShopImages!.add(new Null.fromJson(v));
    //   });
    // }
  }
}
