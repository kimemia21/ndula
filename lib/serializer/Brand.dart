class Brand {
  final String name;
  final String brand_logo;
  final String logo_url;

  Brand({required this.name, required this.brand_logo, required this.logo_url});

  factory Brand.fromJson({required Map<String, dynamic> json}) {
    List keys = ["name", "brand_logo", "logo_url"];

    if (keys.every(json.containsKey)) {
      final String name = json[keys[0]];
      final String brand_logo = json[keys[1]];
      final String logo_url = json[keys[1]];
      return Brand(name: name, brand_logo: brand_logo, logo_url: logo_url);
    } else {
      throw Exception("missing key error");
    }
  }
}

      //  "name": "addidas",
      //   "brand_logo": "http://127.0.0.1:8001/media/images/addidas.png",
      //   "logo_url": "http://127.0.0.1:8001/media/images/addidas.png"