import 'package:dartz/dartz.dart';
import 'package:flutter_music/core/usecase/errors/failure.dart';
import 'package:flutter_music/features/domain/entities/music_entity.dart';

abstract class IMusicsRepository {
  Future<Either<Failure, List<MusicEntity>>> getMusics();
}
