import 'package:dartz/dartz.dart';
import 'package:flutter_music/core/usecase/errors/failures.dart';
import 'package:flutter_music/core/usecase/usecase.dart';
import 'package:flutter_music/features/domain/usecases/get_all_musics_usecase.dart';
import 'package:flutter_music/features/presenter/controllers/home_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../mocks/list_music_entity_mock.dart';

class MockGetAllMusicsUsecase extends Mock implements GetAllMusicsUsecase {}

void main() {
  late HomeStore store;
  late GetAllMusicsUsecase usecase;

  setUp(() {
    usecase = MockGetAllMusicsUsecase();
    store = HomeStore(usecase);
    registerFallbackValue(NoParams());
  });

  final tNoParams = NoParams();

  test('should return a List Musics from the usecase', () async {
    when(() => usecase(any())).thenAnswer((_) async => Right(tListMusicEntity));
    await store.getAllMusics();
    store.observer(
      onState: (state) {
        expect(state, tListMusicEntity);
        verify(() => usecase(tNoParams)).called(1);
      },
    );
  });

  final tFailure = ServerFailure();

  test('should return a Failure from the usecase when there is an error',
      () async {
    when(() => usecase(any())).thenAnswer((_) async => Left(tFailure));
    await store.getAllMusics();
    store.observer(
      onError: (error) {
        expect(error, tFailure);
      },
    );
  });
}
