import 'package:flutter_music/features/domain/entities/music_entity.dart';

class MusicModel extends MusicEntity {
  const MusicModel({
    required super.title,
    required super.artist,
    required super.audioFileUrl,
    required super.albumCoverImageUrl,
  });

  factory MusicModel.fromJson(Map<String, dynamic> json) => MusicModel(
        title: json['title'],
        artist: json['artist'],
        audioFileUrl: json['audioFileUrl'],
        albumCoverImageUrl: json['albumCoverImageUrl'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'artist': artist,
        'audioFileUrl': audioFileUrl,
        'albumCoverImageUrl': albumCoverImageUrl,
      };
}
