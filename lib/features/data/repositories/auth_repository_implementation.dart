import 'package:dartz/dartz.dart';
import 'package:flutter_music/core/usecase/errors/exceptions.dart';
import 'package:flutter_music/core/usecase/errors/failures.dart';
import 'package:flutter_music/features/data/datasources/auth_datasource.dart';
import 'package:flutter_music/features/domain/entities/user_entity.dart';
import 'package:flutter_music/features/domain/repositories/auth_repository.dart';

class AuthRepositoryImplementation implements IAuthRepository {
  final IAuthDatasource datasource;

  AuthRepositoryImplementation({required this.datasource});

  @override
  Future<Either<Failure, UserEntity>> signin(
      {required String email, required String password}) async {
    try {
      final result = await datasource.signin(email: email, password: password);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signup(
      {required String username,
      required String email,
      required String password}) async {
    try {
      final result = await datasource.signup(
          username: username, email: email, password: password);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
