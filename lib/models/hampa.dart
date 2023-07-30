import 'package:fitness/models/ticket.dart';

class HampaModel {
  final String imageUrl;
  final String fullName;
  final String address;
  final String description;
  final Location location;

  HampaModel({
    required this.imageUrl,
    required this.fullName,
    required this.address,
    required this.location,
    required this.description,
  });
}
