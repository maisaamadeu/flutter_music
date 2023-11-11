import 'package:dartz/dartz.dart';
import 'package:flutter_music/core/usecase/errors/exceptions.dart';
import 'package:flutter_music/core/usecase/errors/failures.dart';
import 'package:flutter_music/features/data/datasources/playlists_datasource.dart';
import 'package:flutter_music/features/domain/entities/playlist_entity.dart';
import 'package:flutter_music/features/domain/entities/user_entity.dart';
import 'package:flutter_music/features/domain/repositories/playlists_repostiory.dart';

class PlaylistsRepositoryImplementation implements IPlaylistsRepository {
  IPlaylistsDatasource datasource;

  PlaylistsRepositoryImplementation({
    required this.datasource,
  });

  @override
  Future<Either<Failure, List<PlaylistEntity>>> getAllPlaylistsByUser(
      {required UserEntity user}) async {
    try {
      final result = await datasource.getAllPlaylistsByUser(user: user);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, PlaylistEntity>> getPlaylistById(
      {required String id}) async {
    try {
      final result = await datasource.getPlaylistsById(id: id);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
