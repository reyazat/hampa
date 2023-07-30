class InitModel {

  final bool? success;
  final String? message;
  final dynamic data;

  InitModel({
    this.success,
    this.message,
    this.data,
  });

  factory InitModel.fromJson(Map<String, dynamic> json) {
    return InitModel(
      success: json['success'] ?? false,
      message: json["message"] ?? '',
      data: json["data"] ?? {},
    );
  }

}