class ClubRewardModel {
  final bool canAcquire;
  final int discount;
  final String description;
  final int requiredPoints;

  ClubRewardModel({
    required this.canAcquire,
    required this.discount,
    required this.description,
    required this.requiredPoints,
  });
}
