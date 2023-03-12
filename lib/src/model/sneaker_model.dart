import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Sneaker {
  String id = '';
  String name;
  num price;
  String image;

  bool isFav = false;

  Sneaker(
    this.id, {
    required this.name,
    required this.price,
    required this.image,
    required this.isFav,
  });
  factory Sneaker.fromSnapshot(DocumentSnapshot docSnapshot) {
    return Sneaker(
      docSnapshot.id,
      name: docSnapshot.get('name'),
      price: docSnapshot.get('price'),
      image: docSnapshot.get('image'),
      isFav: docSnapshot.get('isFav'),
    );
  }
  factory Sneaker.fromJson(Map<String, dynamic> json) => Sneaker(
        json['id'] as String,
        name: json['name'] as String,
        price: json['price'],
        image: json['image'] as String,
        isFav: json['isFav'] as bool,
      );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'image': image,
      'isFav': isFav,
    };
  }
}
