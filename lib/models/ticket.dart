class TicketModel {
  final int id;
  final int price;
  final double rating;
  final String title;
  final String imageUrl;
  final String address;
  final String phone;
  final String description;
  final Location location;
  final List<String> amenities;

  TicketModel({
    required this.id,
    required this.price,
    required this.rating,
    required this.title,
    required this.imageUrl,
    required this.address,
    required this.phone,
    required this.description,
    required this.amenities,
    required this.location,
  });
}

class Location {
  final double lat;
  final double long;

  Location(this.lat, this.long);
}