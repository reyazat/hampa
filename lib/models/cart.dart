class CartModel {
  final String thumbImage;
  final String title;
  final int quantity;
  final int price;
  final int? priceAfterDiscount;

  CartModel({
    required this.title,
    required this.quantity,
    required this.price,
    required this.thumbImage,
    this.priceAfterDiscount,
  });
}