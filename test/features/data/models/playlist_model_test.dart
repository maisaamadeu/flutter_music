import 'dart:convert';
import 'package:flutter_music/features/data/models/music_model.dart';
import 'package:flutter_music/features/data/models/playlist_model.dart';
import 'package:flutter_music/features/data/models/user_model.dart';
import 'package:flutter_music/features/domain/entities/music_entity.dart';
import 'package:flutter_music/features/domain/entities/playlist_entity.dart';
import 'package:flutter_music/features/domain/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../mocks/music_mock.dart';
import '../../mocks/playlist_mock.dart';
import '../../mocks/user_mock.dart';

void main() {
  const tPlaylistModel = PlaylistModel(
    id: 'KAgqGVaPKU',
    name: 'Favoritas',
    musics: [
      MusicModel(
        id: 'R0UASOQ3EV',
        title:
            'Rap Da Akatsuki: Os Ninjas Mais Procurados Do Mundo (Nerd Hits)',
        artist: '7 Minutoz',
        audioFileUrl:
            "https://parsefiles.back4app.com/nFhvCrsQLQ940EHEENDDDHQa6quzirVVwAolqaVM/d318693715d44e4386602e1380274af2_music.mp3",
        albumCoverImageUrl:
            "https://parsefiles.back4app.com/nFhvCrsQLQ940EHEENDDDHQa6quzirVVwAolqaVM/09bbf81f2fc834156121092d13806692_image.jpg",
      ),
    ],
  );

  test('should be a subclass of PlaylistEntity', () {
    expect(tPlaylistModel, isA<PlaylistEntity>());
  });

  test('should return a valid model', () async {
    final Map<String, dynamic> jsonMap = json.decode(playlistMock)['result'][0];
    final result = PlaylistModel.fromJson(jsonMap);
    expect(tPlaylistModel, result);
  });

  test('should return a json map containing the props data', () async {
    final expectedMap = {
      'id': "KAgqGVaPKU",
      "name": "Favoritas",
      "musics": [
        const MusicModel(
          id: 'R0UASOQ3EV',
          title:
              'Rap Da Akatsuki: Os Ninjas Mais Procurados Do Mundo (Nerd Hits)',
          artist: '7 Minutoz',
          audioFileUrl:
              "https://parsefiles.back4app.com/nFhvCrsQLQ940EHEENDDDHQa6quzirVVwAolqaVM/d318693715d44e4386602e1380274af2_music.mp3",
          albumCoverImageUrl:
              "https://parsefiles.back4app.com/nFhvCrsQLQ940EHEENDDDHQa6quzirVVwAolqaVM/09bbf81f2fc834156121092d13806692_image.jpg",
        ),
      ],
    };
    final result = tPlaylistModel.toJson();
    expect(expectedMap, result);
  });
}
