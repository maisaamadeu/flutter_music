import 'package:dartz/dartz.dart';
import 'package:flutter_music/core/usecase/errors/failure.dart';
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

  final tMusics = [
    const MusicEntity(
        title:
            'Rap Da Akatsuki: Os Ninjas Mais Procurados Do Mundo (Nerd Hits)',
        artist: '7 Minutoz',
        audioFileUrl: '',
        albumCoverImageUrl: ''),
  ];

  final tNoParams = NoParams();

  test(
    'should get musics from the repository',
    () async {
      when(() => repository.getMusics()).thenAnswer(
        (_) async => Right(tMusics),
      );
      final result = await usecase(tNoParams);
      expect(result, Right(tMusics));
      verify(() => repository.getMusics());
    },
  );

  test(
    "should return a ServerFailure when don't succeed",
    () async {
      when(() => repository.getMusics())
          .thenAnswer((_) async => Left(ServerFailure()));
      final result = await usecase(tNoParams);
      expect(
        result,
        Left(ServerFailure()),
      );
      verify(() => repository.getMusics());
    },
  );
}
