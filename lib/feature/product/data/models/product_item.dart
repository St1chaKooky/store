
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
  final Rating rating;

  Product({required this.rating, required this.title,required this.price,required this.category,required this.description,required this.image, required this.id});

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class Rating {
  final double rate;
  final int count;

  Rating({required this.rate, required this.count});
  
  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);
}