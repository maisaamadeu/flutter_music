import 'package:flutter_music/features/data/models/music_model.dart';
import 'package:flutter_music/features/data/models/playlist_model.dart';
import 'package:flutter_music/features/domain/entities/user_entity.dart';

abstract class IMusicsDatasource {
  Future<List<MusicModel>> getAllMusics();
  Future<List<PlaylistModel>> getAllPlaylistsByUser({required UserEntity user});
  Future<List<PlaylistModel>> getPlaylistsById({required String id});
}
