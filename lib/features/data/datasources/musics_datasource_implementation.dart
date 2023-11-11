import 'dart:convert';

import 'package:flutter_music/core/http_client/http_client.dart';
import 'package:flutter_music/core/usecase/errors/exceptions.dart';
import 'package:flutter_music/features/data/datasources/endpoints/back4app_endpoints.dart';
import 'package:flutter_music/features/data/datasources/musics_datasource.dart';
import 'package:flutter_music/features/data/models/music_model.dart';
import 'package:flutter_music/features/data/models/playlist_model.dart';
import 'package:flutter_music/features/domain/entities/playlist_entity.dart';
import 'package:flutter_music/features/domain/entities/user_entity.dart';
import 'package:http/http.dart';

class MusicsDatasourceImplementation implements IMusicsDatasource {
  final HttpClient client;

  MusicsDatasourceImplementation({required this.client});

  @override
  Future<List<MusicModel>> getAllMusics() async {
    final response = await client.post(Back4appEndpoints.allMusics, map: {});
    if (response.statusCode == 200) {
      final List<MusicModel> musics = [];

      for (var musicJson in json.decode(response.data)['result']) {
        musics.add(MusicModel.fromJson(musicJson));
      }

      return musics;
    } else {
      throw ServerException();
    }
  }

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
          PlaylistModel.fromJson(json.decode(response.data)['results'][0]);

      return playlist;
    } else {
      throw ServerException();
    }
  }
}
