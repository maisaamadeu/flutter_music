import 'dart:convert';

import 'package:flutter_music/core/http_client/http_client.dart';
import 'package:flutter_music/core/usecase/errors/exceptions.dart';
import 'package:flutter_music/features/data/datasources/endpoints/back4app_endpoints.dart';
import 'package:flutter_music/features/data/datasources/playlists_datasource.dart';
import 'package:flutter_music/features/data/models/playlist_model.dart';
import 'package:flutter_music/features/domain/entities/user_entity.dart';

class PlaylistsDatasourceImplementation implements IPlaylistsDatasource {
  final HttpClient client;

  PlaylistsDatasourceImplementation({required this.client});

  @override
  Future<List<PlaylistModel>> getAllPlaylistsByUser(
      {required UserEntity user}) async {
    final response = await client.post(
      Back4appEndpoints.getAllPlaylistsByUser,
      map: {},
      token: user.token,
    );

    if (response.statusCode == 200) {
      final List<PlaylistModel> playlists = [];

      for (var playlistJson in json.decode(response.data)['result']) {
        playlists.add(PlaylistModel.fromJson(playlistJson));
      }

      return playlists;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PlaylistModel> getPlaylistsById({required String id}) async {
    final response = await client.post(
      Back4appEndpoints.getPlaylistById,
      map: {
        "playlistId": id,
      },
    );

    if (response.statusCode == 200) {
      final playlist =
          PlaylistModel.fromJson(json.decode(response.data)['result'][0]);

      return playlist;
    } else {
      throw ServerException();
    }
  }
}
