
import 'package:json_annotation/json_annotation.dart';

part 'product_item.g.dart';

@JsonSerializable()
class Product {
  final int id;
  final String title;
  final int price;
  final String category;
  final String description;
  final String image;
  Product({required this.title,required this.price,required this.category,required this.description,required this.image, required this.id});

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}