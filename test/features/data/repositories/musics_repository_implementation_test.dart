import 'package:dartz/dartz.dart';
import 'package:flutter_music/core/usecase/errors/exceptions.dart';
import 'package:flutter_music/core/usecase/errors/failures.dart';
import 'package:flutter_music/features/data/datasources/musics_datasource.dart';
import 'package:flutter_music/features/data/models/music_model.dart';
import 'package:flutter_music/features/data/repositories/musics_repository_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMusicsDatasource extends Mock implements IMusicsDatasource {}

void main() {
  late MusicsRepositoryImplementation repository;
  late IMusicsDatasource datasource;

  setUp(() {
    datasource = MockMusicsDatasource();
    repository = MusicsRepositoryImplementation(datasource: datasource);
  });

  final tListMusicModel = [
    const MusicModel(
      title: 'Rap Da Akatsuki: Os Ninjas Mais Procurados Do Mundo (Nerd Hits)',
      artist: '7 Minutoz',
      audioFileUrl:
          "https://parsefiles.back4app.com/nFhvCrsQLQ940EHEENDDDHQa6quzirVVwAolqaVM/d318693715d44e4386602e1380274af2_music.mp3",
      albumCoverImageUrl:
          "https://parsefiles.back4app.com/nFhvCrsQLQ940EHEENDDDHQa6quzirVVwAolqaVM/09bbf81f2fc834156121092d13806692_image.jpg",
    ),
  ];

  test(
    'should return list of musics model when calls the datasource',
    () async {
      when(datasource.getAllMusics).thenAnswer(
        (invocation) async => tListMusicModel,
      );
      final result = await repository.getAllMusics();
      expect(
        result,
        Right(tListMusicModel),
      );
      verify(datasource.getAllMusics);
    },
  );

  test(
    'should return a server failure when the calls to datasource is unsuccessful',
    () async {
      when(datasource.getAllMusics).thenThrow(ServerException());
      final result = await repository.getAllMusics();
      expect(
        result,
        Left(ServerFailure()),
      );
      verify(datasource.getAllMusics);
    },
  );
}
