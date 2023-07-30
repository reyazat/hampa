class PurchaseStatus {
  static const String pending = 'آماده سازی';
  static const String posted = 'تحویل به پست';
  static const String delivered = 'تحویل به مشتری';
}

enum PurchaseType { ticket, product }

class PurchaseHistoryModel {
  final int totalPrice;
  final int? deliveryCost;
  final DateTime dateTime;
  final String transactionId;
  final String? status;
  final String? ticketDescription;
  final PurchaseType type;
  final List<PurchaseItemModel> items;

  PurchaseHistoryModel({
    required this.totalPrice,
    required this.dateTime,
    required this.transactionId,
    required this.items,
    required this.type,
    this.deliveryCost,
    this.ticketDescription,
    this.status,
  });
}

class PurchaseItemModel {
  final String title;
  final int totalPrice;

  PurchaseItemModel({required this.title, required this.totalPrice});
}
