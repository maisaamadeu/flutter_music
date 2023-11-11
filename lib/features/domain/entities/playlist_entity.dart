import 'package:equatable/equatable.dart';
import 'package:flutter_music/features/domain/entities/music_entity.dart';

class PlaylistEntity extends Equatable {
  final String id;
  final String name;
  final List<MusicEntity> musics;

  const PlaylistEntity({
    required this.id,
    required this.name,
    required this.musics,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        musics,
      ];
}
