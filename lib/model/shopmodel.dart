class ShopDetails {
  bool? success;
  String? message;
  ShopData? data;

  ShopDetails({this.success, this.message, this.data});

  ShopDetails.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? ShopData.fromJson(json['data']) : null;
  }
}

class ShopData {
  String? sId;
  String? venderId;
  String? aboutUs;
  String? contactDetails;
  String? shopAddress;
  String? shopName;
  int? status;
  String? websiteLink;
  List<ExternalShopImages>? externalShopImages;
  List<ExtraImages>? extraImages;
  List<InternalShopImages>? internalShopImages;

  ShopData(
      {this.sId,
      this.venderId,
      this.aboutUs,
      this.contactDetails,
      this.shopAddress,
      this.shopName,
      this.status,
      this.websiteLink,
      this.externalShopImages,
      this.extraImages,
      this.internalShopImages});

  ShopData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    venderId = json['venderId'];
    aboutUs = json['aboutUs'];
    contactDetails = json['contactDetails'];
    shopAddress = json['shopAddress'];
    shopName = json['shopName'];
    status = json['status'];
    websiteLink = json['websiteLink'];
    if (json['externalShopImages'] != null) {
      externalShopImages = <ExternalShopImages>[];
      json['externalShopImages'].forEach((v) {
        externalShopImages!.add(ExternalShopImages.fromJson(v));
      });
    }
    if (json['extraImages'] != null) {
      extraImages = <ExtraImages>[];
      json['extraImages'].forEach((v) {
        extraImages!.add(ExtraImages.fromJson(v));
      });
    }
    if (json['internalShopImages'] != null) {
      internalShopImages = <InternalShopImages>[];
      json['internalShopImages'].forEach((v) {
        internalShopImages!.add(InternalShopImages.fromJson(v));
      });
    }
  }
}

class ExternalShopImages {
  int? id;
  String? path;

  ExternalShopImages({this.id, this.path});

  ExternalShopImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    path = json['path'];
  }
}

class ExtraImages {
  int? id;
  String? path;

  ExtraImages({this.id, this.path});

  ExtraImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    path = json['path'];
  }
}

class InternalShopImages {
  int? id;
  String? path;

  InternalShopImages({this.id, this.path});

  InternalShopImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    path = json['path'];
  }
}
