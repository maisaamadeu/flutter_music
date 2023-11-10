import 'dart:convert';

import 'package:flutter_music/core/http_client/http_client.dart';
import 'package:flutter_music/core/usecase/errors/exceptions.dart';
import 'package:flutter_music/features/data/datasources/endpoints/back4app_endpoints.dart';
import 'package:flutter_music/features/data/datasources/musics_datasource.dart';
import 'package:flutter_music/features/data/models/music_model.dart';

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
}
