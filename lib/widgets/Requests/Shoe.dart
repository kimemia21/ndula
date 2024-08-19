import 'dart:convert';

class Shoe {
  final id;
  final name;
  final price;
  final image;
  final gender;
  final size;
  final likes;
  final brandName;
  final description;

  const Shoe({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.gender,
    required this.size,
    required this.likes,
    required this.brandName,
    required this.description,
  });

  factory Shoe.fromJson(Map<String, dynamic> json) {
    final requiredKeys = [
      
      'name',
      'price',
      'image',
      'gender',
      'size',
      'likes',
      'brandName'
    ];

    if (requiredKeys.every(json.containsKey)) {
      return Shoe(
        id: json["id"],
        name: json['name'],
        price: json['price'],
        image: json['image'],
        gender: json['gender'],
        size: json['size'],
        likes: json['likes'],
        brandName: json['brand_name'],
        description: json["description"],
      );
    } else {
      throw FormatException("Missing required fields in json for shoe");
    }
  }

  static List<Shoe> fromJsonList(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((json) => Shoe.fromJson(json)).toList();
  }
}
