import 'package:flutter_music/features/data/models/playlist_model.dart';
import 'package:flutter_music/features/domain/entities/user_entity.dart';

abstract class IPlaylistsDatasource {
  Future<List<PlaylistModel>> getAllPlaylistsByUser({required UserEntity user});
  Future<PlaylistModel> getPlaylistsById({required String id});
}
