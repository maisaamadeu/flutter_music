import 'package:dartz/dartz.dart';
import 'package:flutter_music/core/usecase/errors/failures.dart';
import 'package:flutter_music/core/usecase/usecase.dart';
import 'package:flutter_music/features/domain/entities/user_entity.dart';
import 'package:flutter_music/features/domain/repositories/auth_repository.dart';

class SigninUsecase implements Usecase<UserEntity, Map<String, String>> {
  final IAuthRepository repository;

  SigninUsecase({required this.repository});

  @override
  Future<Either<Failure, UserEntity>> call(
      Map<String, String> credentials) async {
    return await repository.signin(
      email: credentials['email']!,
      password: credentials['password']!,
    );
  }
}
