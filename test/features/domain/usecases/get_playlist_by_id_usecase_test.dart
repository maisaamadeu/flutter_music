import 'package:dartz/dartz.dart';
import 'package:flutter_music/core/usecase/errors/failures.dart';
import 'package:flutter_music/features/domain/entities/music_entity.dart';
import 'package:flutter_music/features/domain/entities/playlist_entity.dart';
import 'package:flutter_music/features/domain/repositories/playlists_repostiory.dart';
import 'package:flutter_music/features/domain/usecases/get_playlist_by_id_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPlaylistsRepository extends Mock implements IPlaylistsRepository {}

void main() {
  late GetPlaylistByIdUsecase usecase;
  late IPlaylistsRepository repository;

  setUp(() {
    repository = MockPlaylistsRepository();
    usecase = GetPlaylistByIdUsecase(repository: repository);
  });

  const tPlaylistEntity = PlaylistEntity(
    id: 'KAgqGVaPKU',
    name: 'Favoritas',
    musics: [
      MusicEntity(
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

  test(
    'should get playlists from the repository',
    () async {
      when(() => repository.getPlaylistById(id: 'KAgqGVaPKU')).thenAnswer(
        (_) async => const Right(tPlaylistEntity),
      );
      final result = await usecase('KAgqGVaPKU');
      expect(result, const Right(tPlaylistEntity));
      verify(
        () => repository.getPlaylistById(
          id: 'KAgqGVaPKU',
        ),
      );
    },
  );

  test(
    "should return a ServerFailure when don't succeed",
    () async {
      when(() => repository.getPlaylistById(
            id: 'KAgqGVaPKU',
          )).thenAnswer((_) async => Left(ServerFailure()));
      final result = await usecase('KAgqGVaPKU');
      expect(
        result,
        Left(ServerFailure()),
      );
      verify(() => repository.getPlaylistById(
            id: 'KAgqGVaPKU',
          ));
    },
  );
}
