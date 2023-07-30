enum FriendshipStatus { isFriend, pending, notFriend }

class PeopleModel {
  final String fullName;
  final String username;
  final String imageUrl;
  final FriendshipStatus status;

  PeopleModel({
    required this.fullName,
    required this.username,
    required this.imageUrl,
    required this.status,
  });
}
