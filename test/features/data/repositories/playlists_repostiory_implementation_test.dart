import 'package:dartz/dartz.dart';
import 'package:flutter_music/features/data/datasources/playlists_datasource.dart';
import 'package:flutter_music/features/data/models/music_model.dart';
import 'package:flutter_music/features/data/models/playlist_model.dart';
import 'package:flutter_music/features/data/models/user_model.dart';
import 'package:flutter_music/features/data/repositories/playlists_repostiory_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMusicsDatasource extends Mock implements IPlaylistsDatasource {}

void main() {
  late PlaylistsRepositoryImplementation repository;
  late IPlaylistsDatasource datasource;

  setUp(() {
    datasource = MockMusicsDatasource();
    repository = PlaylistsRepositoryImplementation(datasource: datasource);
  });

  const tUserModel = UserModel(
    id: 'H5KamwZOWm',
    username: 'Maísa',
    email: 'email@email.com',
    token: 'r:939cb57fcb9496900714a1ede0d77ab6',
  );

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

  final tListPlayListModel = [
    const PlaylistModel(
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
    ),
  ];

  test(
    'should return list of playlist model when calls the datasource',
    () async {
      when(() => datasource.getAllPlaylistsByUser(user: tUserModel)).thenAnswer(
        (invocation) async => tListPlayListModel,
      );
      final result = await repository.getAllPlaylistsByUser(user: tUserModel);
      expect(
        result,
        Right(tListPlayListModel),
      );
      verify(() => datasource.getAllPlaylistsByUser(user: tUserModel));
    },
  );

  test(
    'should return  playlist model when calls the datasource',
    () async {
      when(() => datasource.getPlaylistsById(id: 'KAgqGVaPKU')).thenAnswer(
        (invocation) async => tPlaylistModel,
      );
      final result = await repository.getPlaylistById(id: 'KAgqGVaPKU');
      expect(
        result,
        const Right(tPlaylistModel),
      );
      verify(() => datasource.getPlaylistsById(id: 'KAgqGVaPKU'));
    },
  );
}
