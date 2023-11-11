import 'package:dartz/dartz.dart';
import 'package:flutter_music/core/usecase/errors/failures.dart';
import 'package:flutter_music/features/domain/entities/user_entity.dart';

abstract class IAuthRepository {
  Future<Either<Failure, UserEntity>> signup({
    required String username,
    required String email,
    required String password,
  });
  Future<Either<Failure, UserEntity>> signin({
    required String email,
    required String password,
  });
}
