import 'package:dartz/dartz.dart';
import 'package:flutter_music/core/usecase/errors/exceptions.dart';
import 'package:flutter_music/core/usecase/errors/failures.dart';
import 'package:flutter_music/features/data/datasources/musics_datasource.dart';
import 'package:flutter_music/features/domain/entities/music_entity.dart';
import 'package:flutter_music/features/domain/entities/playlist_entity.dart';
import 'package:flutter_music/features/domain/entities/user_entity.dart';
import 'package:flutter_music/features/domain/repositories/musics_repository.dart';

class MusicsRepositoryImplementation implements IMusicsRepository {
  IMusicsDatasource datasource;

  MusicsRepositoryImplementation({
    required this.datasource,
  });

  @override
  Future<Either<Failure, List<MusicEntity>>> getAllMusics() async {
    try {
      final result = await datasource.getAllMusics();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<PlaylistEntity>>> getAllPlaylistsByUser(
      {required UserEntity user}) {
    // TODO: implement getAllPlaylistsByUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, PlaylistEntity>> getPlaylistById(
      {required String id}) {
    // TODO: implement getPlaylistById
    throw UnimplementedError();
  }
}
