class ProductModel {
  final String title;
  final String? description;
  final double rating;
  final int price;
  final int? discount;
  final int? priceAfterDiscount;
  final List<String> images;
  final Map<String, String> specs;

  ProductModel({
    required this.title,
    required this.rating,
    required this.price,
    required this.images,
    required this.specs,
    this.priceAfterDiscount,
    this.discount,
    this.description,
  });
}
