// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
    String id;
    String title;
    double value;
    bool   isAvailable;
    String photoUrl;

    ProductModel({
        this.id,
        this.title = "",
        this.value = 0.0,
        this.isAvailable = true,
        this.photoUrl,
    });

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id          : json["id"],
        title       : json["title"],
        value       : json["value"],
        isAvailable : json["isAvailable"],
        photoUrl    : json["PhotoUrl"],
    );

    Map<String, dynamic> toJson() => {
        // "id"          : id,
        "title"       : title,
        "value"       : value,
        "isAvailable" : isAvailable,
        "PhotoUrl"    : photoUrl,
    };
}
