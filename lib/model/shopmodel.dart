class ShopDetails {
  String? sId;
  String? venderId;
  String? aboutUs;
  String? contactDetails;
  String? shopAddress;
  String? shopName;
  int? status;
  String? websiteLink;
  List<InternalShopImages>? internalShopImages;
  List<ExternalShopImages>? externalShopImages;
  List<ExtraImages>? extraImages;

  ShopDetails(
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

  ShopDetails.fromJson(Map<String, dynamic> json) {
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

class InternalShopImages {
  String? path;

  InternalShopImages({this.path});

  InternalShopImages.fromJson(Map<String, dynamic> json) {
    path = json['path'];
  }
}

class ExternalShopImages {
  String? path;

  ExternalShopImages({this.path});

  ExternalShopImages.fromJson(Map<String, dynamic> json) {
    path = json['path'];
  }
}

class ExtraImages {
  String? path;

  ExtraImages({this.path});

  ExtraImages.fromJson(Map<String, dynamic> json) {
    path = json['path'];
  }
}
