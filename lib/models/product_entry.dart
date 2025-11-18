// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
  String id;
  String name;
  int price;
  String description;
  String category;
  String thumbnail;
  bool isFeatured;
  DateTime createdAt;
  DateTime? lastViewed;
  String user;

  ProductEntry({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    required this.thumbnail,
    required this.isFeatured,
    required this.createdAt,
    required this.lastViewed,
    required this.user,
  });

  factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    description: json["description"],
    category: json["category"],
    thumbnail: json["thumbnail"],
    isFeatured: json["is_featured"],
    createdAt: DateTime.parse(json["created_at"]),
    lastViewed: json["last_viewed"] == null ? null : DateTime.parse(json["last_viewed"]),
    user: json["user"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "description": description,
    "category": category,
    "thumbnail": thumbnail,
    "is_featured": isFeatured,
    "created_at": createdAt.toIso8601String(),
    "last_viewed": lastViewed?.toIso8601String(),
    "user": user,
  };
}
