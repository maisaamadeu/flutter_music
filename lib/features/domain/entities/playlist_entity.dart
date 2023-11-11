import 'package:equatable/equatable.dart';
import 'package:flutter_music/features/domain/entities/music_entity.dart';
import 'package:flutter_music/features/domain/entities/user_entity.dart';

class PlaylistEntity extends Equatable {
  final String id;
  final String name;
  final UserEntity owner;
  final List<MusicEntity> musics;

  const PlaylistEntity({
    required this.id,
    required this.name,
    required this.owner,
    required this.musics,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        owner,
        musics,
      ];
}
