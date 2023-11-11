import 'dart:convert';

import 'package:flutter_music/core/http_client/http_client.dart';
import 'package:flutter_music/core/usecase/errors/exceptions.dart';
import 'package:flutter_music/features/data/datasources/endpoints/back4app_endpoints.dart';
import 'package:flutter_music/features/data/datasources/musics_datasource.dart';
import 'package:flutter_music/features/data/models/music_model.dart';
import 'package:flutter_music/features/data/models/playlist_model.dart';
import 'package:flutter_music/features/domain/entities/playlist_entity.dart';
import 'package:flutter_music/features/domain/entities/user_entity.dart';

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
      {required UserEntity user}) {
    // TODO: implement getAllPlaylistsByUser
    throw UnimplementedError();
  }

  @override
  Future<List<PlaylistModel>> getPlaylistsById({required String id}) {
    // TODO: implement getPlaylistsById
    throw UnimplementedError();
  }
}
