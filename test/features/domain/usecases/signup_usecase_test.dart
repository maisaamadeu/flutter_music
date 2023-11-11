import 'package:dartz/dartz.dart';
import 'package:flutter_music/core/usecase/errors/failures.dart';
import 'package:flutter_music/features/domain/entities/user_entity.dart';
import 'package:flutter_music/features/domain/repositories/auth_repository.dart';
import 'package:flutter_music/features/domain/usecases/signup_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  late SignupUsecase usecase;
  late IAuthRepository repository;

  setUp(() {
    repository = MockAuthRepository();
    usecase = SignupUsecase(repository: repository);
  });

  const tUserEntity = UserEntity(
    id: 'H5KamwZOWm',
    username: 'Maísa',
    email: 'email@email.com',
    token: 'r:939cb57fcb9496900714a1ede0d77ab6',
  );

  test(
    'should return user entity',
    () async {
      when(() => repository.signup(
          username: 'Maísa',
          email: 'email@email.com',
          password: 'Maisa@123')).thenAnswer(
        (_) async => const Right(tUserEntity),
      );
      final result = await usecase({
        "username": "Maísa",
        "email": "email@email.com",
        "password": "Maisa@123"
      });
      expect(result, const Right(tUserEntity));
      verify(() => repository.signup(
          username: 'Maísa', email: 'email@email.com', password: 'Maisa@123'));
    },
  );

  test(
    "should return a InvalidCredentials when don't succeed",
    () async {
      when(() => repository.signup(
          username: 'Maísa',
          email: 'email@email.com',
          password: 'Maisa@123')).thenAnswer(
        (_) async => Left(InvalidCredentials()),
      );
      final result = await usecase({
        "username": "Maísa",
        "email": "email@email.com",
        "password": "Maisa@123"
      });
      expect(result, Left(InvalidCredentials()));
      verify(() => repository.signup(
          username: 'Maísa', email: 'email@email.com', password: 'Maisa@123'));
    },
  );
}
