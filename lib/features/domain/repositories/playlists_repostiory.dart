import 'package:dartz/dartz.dart';
import 'package:flutter_music/core/usecase/errors/failures.dart';
import 'package:flutter_music/features/domain/entities/playlist_entity.dart';
import 'package:flutter_music/features/domain/entities/user_entity.dart';

abstract class IPlaylistsRepository {
  Future<Either<Failure, List<PlaylistEntity>>> getAllPlaylistsByUser(
      {required UserEntity user});
  Future<Either<Failure, PlaylistEntity>> getPlaylistById({required String id});
}
