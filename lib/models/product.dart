import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.data,
  });

  final List<Datum> data;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.imageUrl,
    this.name,
    this.shortDesc,
    this.origPrice,
    this.discountPrice,
    this.discountPercentage,
    this.longDesc,
  });

  final String imageUrl;
  final String name;
  final String shortDesc;
  final String origPrice;
  final String discountPrice;
  final String discountPercentage;
  final LongDesc longDesc;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        imageUrl: json["imageURL"] == null ? null : json["imageURL"],
        name: json["name"] == null ? null : json["name"],
        shortDesc: json["shortDesc"] == null ? null : json["shortDesc"],
        origPrice: json["OrigPrice"] == null ? null : json["OrigPrice"],
        discountPrice:
            json["DiscountPrice"] == null ? null : json["DiscountPrice"],
        discountPercentage: json["discountPercentage"] == null
            ? null
            : json["discountPercentage"],
        longDesc: json["longDesc"] == null
            ? null
            : LongDesc.fromJson(json["longDesc"]),
      );

  Map<String, dynamic> toJson() => {
        "imageURL": imageUrl == null ? null : imageUrl,
        "name": name == null ? null : name,
        "shortDesc": shortDesc == null ? null : shortDesc,
        "OrigPrice": origPrice == null ? null : origPrice,
        "DiscountPrice": discountPrice == null ? null : discountPrice,
        "discountPercentage":
            discountPercentage == null ? null : discountPercentage,
        "longDesc": longDesc == null ? null : longDesc.toJson(),
      };
}

class LongDesc {
  LongDesc({
    this.discountDetails,
    this.exchangeDtls,
    this.sizeDetails,
    this.seller,
    this.details,
  });

  final String discountDetails;
  final String exchangeDtls;
  final List<Map<String, String>> sizeDetails;
  final String seller;
  final List<Detail> details;

  factory LongDesc.fromJson(Map<String, dynamic> json) => LongDesc(
        discountDetails:
            json["discountDetails"] == null ? null : json["discountDetails"],
        exchangeDtls:
            json["exchangeDtls"] == null ? null : json["exchangeDtls"],
        sizeDetails: json["sizeDetails"] == null
            ? null
            : List<Map<String, String>>.from(json["sizeDetails"].map((x) =>
                Map.from(x).map((k, v) => MapEntry<String, String>(k, v)))),
        seller: json["seller"] == null ? null : json["seller"],
        details: json["details"] == null
            ? null
            : List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "discountDetails": discountDetails == null ? null : discountDetails,
        "exchangeDtls": exchangeDtls == null ? null : exchangeDtls,
        "sizeDetails": sizeDetails == null
            ? null
            : List<dynamic>.from(sizeDetails.map((x) =>
                Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
        "seller": seller == null ? null : seller,
        "details": details == null
            ? null
            : List<dynamic>.from(details.map((x) => x.toJson())),
      };
}

class Detail {
  Detail({
    this.productDetails,
    this.sizeFit,
    this.materialCare,
    this.styleNote,
  });

  final String productDetails;
  final String sizeFit;
  final String materialCare;
  final String styleNote;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        productDetails:
            json["productDetails"] == null ? null : json["productDetails"],
        sizeFit: json["Size\ &\ Fit"] == null ? null : json["Size\ &\ Fit"],
        materialCare:
            json["Material & Care"] == null ? null : json["Material & Care"],
        styleNote: json["Style note"] == null ? null : json["Style note"],
      );

  Map<String, dynamic> toJson() => {
        "productDetails": productDetails == null ? null : productDetails,
        "Size & Fit": sizeFit == null ? null : sizeFit,
        "Material & Care": materialCare == null ? null : materialCare,
        "Style note": styleNote == null ? null : styleNote,
      };
}
