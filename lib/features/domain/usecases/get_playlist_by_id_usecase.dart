import 'package:dartz/dartz.dart';
import 'package:flutter_music/core/usecase/errors/failures.dart';
import 'package:flutter_music/core/usecase/usecase.dart';
import 'package:flutter_music/features/domain/entities/playlist_entity.dart';
import 'package:flutter_music/features/domain/repositories/playlists_repostiory.dart';

class GetPlaylistByIdUsecase implements Usecase<PlaylistEntity, String> {
  final IPlaylistsRepository repository;

  GetPlaylistByIdUsecase({required this.repository});

  @override
  Future<Either<Failure, PlaylistEntity>> call(String id) async {
    return await repository.getPlaylistById(id: id);
  }
}
