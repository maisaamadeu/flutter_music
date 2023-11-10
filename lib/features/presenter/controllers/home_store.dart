import 'package:flutter_music/core/usecase/usecase.dart';
import 'package:flutter_music/features/domain/entities/music_entity.dart';
import 'package:flutter_music/features/domain/usecases/get_all_musics_usecase.dart';
import 'package:flutter_triple/flutter_triple.dart';

class HomeStore extends Store<List<MusicEntity>> {
  final GetAllMusicsUsecase usecase;
  final tNoParams = NoParams();

  HomeStore(this.usecase) : super([]);

  Future<void> getAllMusics() async {
    setLoading(true);
    final result = await usecase(tNoParams);
    result.fold((error) => setError(error), (success) => update(success));
    setLoading(false);
  }
}
