import 'package:dartz/dartz.dart';
import 'package:flutter_music/core/usecase/errors/failures.dart';
import 'package:flutter_music/core/usecase/usecase.dart';
import 'package:flutter_music/features/domain/entities/playlist_entity.dart';
import 'package:flutter_music/features/domain/entities/user_entity.dart';
import 'package:flutter_music/features/domain/repositories/musics_repository.dart';

class GetAllPlaylistsByUserUsecase
    implements Usecase<List<PlaylistEntity>, UserEntity> {
  final IMusicsRepository repository;

  GetAllPlaylistsByUserUsecase({required this.repository});

  @override
  Future<Either<Failure, List<PlaylistEntity>>> call(UserEntity user) async {
    return await repository.getAllPlaylistsByUser(user: user);
  }
}
