import 'package:flutter_music/features/data/models/user_model.dart';
import 'package:flutter_music/features/domain/entities/playlist_entity.dart';

class PlaylistModel extends PlaylistEntity {
  const PlaylistModel({
    required super.id,
    required super.name,
    required super.owner,
    required super.musics,
  });

  factory PlaylistModel.fromJson(Map<String, dynamic> json) {
    return PlaylistModel(
      id: json['id'],
      name: json['name'],
      owner: UserModel.fromJson(json['owner']),
      musics: json['musics'],
    );
  }
}
