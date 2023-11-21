class ProductModel {
  List<ProductInfo>? products;
  num? total;
  num? skip;
  num? limit;

  ProductModel({this.products, this.total, this.skip, this.limit});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <ProductInfo>[];
      json['products'].forEach((v) {
        products!.add(ProductInfo.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['skip'] = skip;
    data['limit'] = limit;
    return data;
  }
}

class ProductInfo {
  late int id;
  late String title;
  late String description;
  late num price; // Change this to num or double
  late num discountPercentage;
  late num rating;
  late num stock;
  late String brand;
  late String category;
  late String thumbnail;
  late List<String> images;
  bool? isFavorite;

  ProductInfo({
    required this.id,
    required this.title,
    required this.description,
    required this.price, // Change this to num or double
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
    this.isFavorite = false,
  });

  ProductInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    title = json['title'] ?? "";
    description = json['description'] ?? "";
    price = (json['price'] ?? 0).toDouble(); // Adjust this line
    discountPercentage = json['discountPercentage'] ?? 0;
    rating = json['rating'] ?? 0;
    stock = json['stock'] ?? 0;
    brand = json['brand'] ?? "";
    category = json['category'] ?? "";
    thumbnail = json['thumbnail'] ?? "";
    images = List<String>.from(json['images'] ?? []);
    isFavorite = json['isFavorite'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['discountPercentage'] = discountPercentage;
    data['rating'] = rating;
    data['stock'] = stock;
    data['brand'] = brand;
    data['category'] = category;
    data['thumbnail'] = thumbnail;
    data['images'] = images;
    data['isFavorite'] = isFavorite ?? false;
    return data;
  }
}
