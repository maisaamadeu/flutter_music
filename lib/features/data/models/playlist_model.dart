import 'package:flutter_music/features/data/models/music_model.dart';
import 'package:flutter_music/features/data/models/user_model.dart';
import 'package:flutter_music/features/domain/entities/playlist_entity.dart';

class PlaylistModel extends PlaylistEntity {
  const PlaylistModel({
    required super.id,
    required super.name,
    required super.musics,
  });

  factory PlaylistModel.fromJson(Map<String, dynamic> json) {
    List<MusicModel> musics = [];

    for (var music in json['musics']) {
      musics.add(MusicModel.fromJson(music));
    }

    return PlaylistModel(
      id: json['id'],
      name: json['name'],
      musics: musics,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'musics': musics,
    };
  }
}
