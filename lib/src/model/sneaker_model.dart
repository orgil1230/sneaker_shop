import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Sneaker {
  String name;
  num price;
  String image;

  bool isFav = false;

  Sneaker({
    required this.name,
    required this.price,
    required this.image,
  });
  factory Sneaker.fromSnapshot(DocumentSnapshot docSnapshot) {
    return Sneaker(
      name: docSnapshot.get('name'),
      price: docSnapshot.get('price'),
      image: docSnapshot.get('image'),
    );
  }
  factory Sneaker.fromJson(Map<String, dynamic> json) => Sneaker(
        name: json['name'] as String,
        price: json['price'],
        image: json['image'] as String,
      );

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'price': price,
      'image': image,
    };
  }
}
