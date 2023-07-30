
class MusicModel {

  String id;
  String name;
  String tag;
  String length;
  String likeCount;
  int playCount;
  int isLike;
  Map<String , dynamic> assets;


  MusicModel({
    required this.id,
    required this.name,
    required this.tag,
    required this.length,
    required this.likeCount,
    required this.playCount,
    required this.isLike,
    required this.assets,
  });

  factory MusicModel.fromJson(Map<String, dynamic> json) {
    return MusicModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      tag: json['tag'] ?? '',
      length: json['length'] ?? '',
      likeCount: json['like_cnt'] ?? '',
      playCount: int.tryParse(json['play_cnt']) ?? 0,
      isLike: json['is_like'] ?? 0,
      assets: json['assets'] ?? {},
    );
  }
}

