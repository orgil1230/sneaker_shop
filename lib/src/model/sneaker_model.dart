import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Sneaker {
  late final String name;
  late final double price;
  late final String image;

  bool isFav = false;

  Sneaker({
    required this.name,
    required this.price,
    required this.image,
  });

  factory Sneaker.fromJson(Map<String, dynamic> json) => Sneaker(
        name: json['name'] as String,
        price: json['price'] as double,
        image: json['image'] as String,
      );
}
