import 'package:dartz/dartz.dart';
import 'package:flutter_music/core/usecase/errors/failures.dart';
import 'package:flutter_music/core/usecase/usecase.dart';
import 'package:flutter_music/features/domain/entities/music_entity.dart';
import 'package:flutter_music/features/domain/repositories/musics_repository.dart';

class GetAllMusicsUsecase implements Usecase<List<MusicEntity>, NoParams> {
  final IMusicsRepository repository;

  GetAllMusicsUsecase({required this.repository});

  @override
  Future<Either<Failure, List<MusicEntity>>> call(NoParams params) async {
    return await repository.getAllMusics();
  }
}
