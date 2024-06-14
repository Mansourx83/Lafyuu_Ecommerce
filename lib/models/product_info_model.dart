
import 'dart:convert';

ProductInfoModel productInfoModelFromJson(String str) => ProductInfoModel.fromJson(json.decode(str));

String productInfoModelToJson(ProductInfoModel data) => json.encode(data.toJson());

class ProductInfoModel {
  final bool status;
  final dynamic message;
  final Data data;

  ProductInfoModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ProductInfoModel.fromJson(Map<String, dynamic> json) => ProductInfoModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  final int id;
  final double price;
  final double oldPrice;
  final int discount;
  final String image;
  final String name;
  final String description;
  final bool inFavorites;
  final bool inCart;
  final List<String> images;

  Data({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.inFavorites,
    required this.inCart,
    required this.images,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    price: json["price"]?.toDouble(),
    oldPrice: json["old_price"]?.toDouble(),
    discount: json["discount"],
    image: json["image"],
    name: json["name"],
    description: json["description"],
    inFavorites: json["in_favorites"],
    inCart: json["in_cart"],
    images: List<String>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "old_price": oldPrice,
    "discount": discount,
    "image": image,
    "name": name,
    "description": description,
    "in_favorites": inFavorites,
    "in_cart": inCart,
    "images": List<dynamic>.from(images.map((x) => x)),
  };
}
