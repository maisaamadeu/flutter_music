import 'dart:convert';
import 'package:flutter_music/features/data/models/music_model.dart';
import 'package:flutter_music/features/domain/entities/music_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../mocks/music_mock.dart';

void main() {
  const tMusicModel = MusicModel(
    id: 'R0UASOQ3EV',
    title: 'Rap Da Akatsuki: Os Ninjas Mais Procurados Do Mundo (Nerd Hits)',
    artist: '7 Minutoz',
    audioFileUrl:
        "https://parsefiles.back4app.com/nFhvCrsQLQ940EHEENDDDHQa6quzirVVwAolqaVM/d318693715d44e4386602e1380274af2_music.mp3",
    albumCoverImageUrl:
        "https://parsefiles.back4app.com/nFhvCrsQLQ940EHEENDDDHQa6quzirVVwAolqaVM/09bbf81f2fc834156121092d13806692_image.jpg",
  );

  test('should be a subclass of MusicEntity', () {
    expect(tMusicModel, isA<MusicEntity>());
  });

  test('should return a valid model', () async {
    final Map<String, dynamic> jsonMap = json.decode(musicMock);
    final result = MusicModel.fromJson(jsonMap);
    expect(tMusicModel, result);
  });

  test('should return a json map containing the props data', () async {
    final expectedMap = {
      'id': "R0UASOQ3EV",
      'title':
          "Rap Da Akatsuki: Os Ninjas Mais Procurados Do Mundo (Nerd Hits)",
      'artist': "7 Minutoz",
      'audioFileUrl':
          "https://parsefiles.back4app.com/nFhvCrsQLQ940EHEENDDDHQa6quzirVVwAolqaVM/d318693715d44e4386602e1380274af2_music.mp3",
      'albumCoverImageUrl':
          "https://parsefiles.back4app.com/nFhvCrsQLQ940EHEENDDDHQa6quzirVVwAolqaVM/09bbf81f2fc834156121092d13806692_image.jpg",
    };
    final result = tMusicModel.toJson();
    expect(expectedMap, result);
  });
}
