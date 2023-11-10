import 'package:dartz/dartz.dart';
import 'package:flutter_music/core/usecase/errors/failures.dart';
import 'package:flutter_music/core/usecase/usecase.dart';
import 'package:flutter_music/features/domain/entities/music_entity.dart';
import 'package:flutter_music/features/domain/repositories/musics_repository.dart';
import 'package:flutter_music/features/domain/usecases/get_musics_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMusicsRepository extends Mock implements IMusicsRepository {}

void main() {
  late GetMusicsUsecase usecase;
  late IMusicsRepository repository;

  setUp(() {
    repository = MockMusicsRepository();
    usecase = GetMusicsUsecase(repository: repository);
  });

  final tListMusicEntity = [
    const MusicEntity(
      title: 'Rap Da Akatsuki: Os Ninjas Mais Procurados Do Mundo (Nerd Hits)',
      artist: '7 Minutoz',
      audioFileUrl:
          "https://parsefiles.back4app.com/nFhvCrsQLQ940EHEENDDDHQa6quzirVVwAolqaVM/d318693715d44e4386602e1380274af2_music.mp3",
      albumCoverImageUrl:
          "https://parsefiles.back4app.com/nFhvCrsQLQ940EHEENDDDHQa6quzirVVwAolqaVM/09bbf81f2fc834156121092d13806692_image.jpg",
    ),
  ];

  final tNoParams = NoParams();

  test(
    'should get musics from the repository',
    () async {
      when(() => repository.getAllMusics()).thenAnswer(
        (_) async => Right(tListMusicEntity),
      );
      final result = await usecase(tNoParams);
      expect(result, Right(tListMusicEntity));
      verify(() => repository.getAllMusics());
    },
  );

  test(
    "should return a ServerFailure when don't succeed",
    () async {
      when(() => repository.getAllMusics())
          .thenAnswer((_) async => Left(ServerFailure()));
      final result = await usecase(tNoParams);
      expect(
        result,
        Left(ServerFailure()),
      );
      verify(() => repository.getAllMusics());
    },
  );
}
