import 'package:dartz/dartz.dart';
import 'package:flutter_music/core/usecase/errors/failures.dart';
import 'package:flutter_music/features/domain/entities/music_entity.dart';
import 'package:flutter_music/features/domain/entities/playlist_entity.dart';
import 'package:flutter_music/features/domain/entities/user_entity.dart';
import 'package:flutter_music/features/domain/repositories/musics_repository.dart';
import 'package:flutter_music/features/domain/usecases/get_all_playlists_by_user_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMusicsRepository extends Mock implements IMusicsRepository {}

void main() {
  late GetAllPlaylistsByUserUsecase usecase;
  late IMusicsRepository repository;

  setUp(() {
    repository = MockMusicsRepository();
    usecase = GetAllPlaylistsByUserUsecase(repository: repository);
  });

  final tListPlaylistEntity = [
    const PlaylistEntity(
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
    ),
  ];

  const tUserEntity = UserEntity(
    id: 'H5KamwZOWm',
    email: 'email@email.com',
    username: 'Maísa',
    token: 'r:71b34243e0eec0cb2010e7b0b3b89849',
  );

  test(
    'should get playlists from the repository',
    () async {
      when(() => repository.getAllPlaylistsByUser(
            user: tUserEntity,
          )).thenAnswer(
        (_) async => Right(tListPlaylistEntity),
      );
      final result = await usecase(
        tUserEntity,
      );
      expect(result, Right(tListPlaylistEntity));
      verify(
        () => repository.getAllPlaylistsByUser(
          user: tUserEntity,
        ),
      );
    },
  );

  test(
    "should return a ServerFailure when don't succeed",
    () async {
      when(() => repository.getAllPlaylistsByUser(
            user: tUserEntity,
          )).thenAnswer((_) async => Left(ServerFailure()));
      final result = await usecase(tUserEntity);
      expect(
        result,
        Left(ServerFailure()),
      );
      verify(() => repository.getAllPlaylistsByUser(
            user: tUserEntity,
          ));
    },
  );
}
