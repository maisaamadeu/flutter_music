import 'package:dartz/dartz.dart';
import 'package:flutter_music/core/usecase/errors/exceptions.dart';
import 'package:flutter_music/core/usecase/errors/failures.dart';
import 'package:flutter_music/features/data/datasources/auth_datasource.dart';
import 'package:flutter_music/features/data/datasources/musics_datasource.dart';
import 'package:flutter_music/features/data/models/music_model.dart';
import 'package:flutter_music/features/data/models/user_model.dart';
import 'package:flutter_music/features/data/repositories/auth_repository_implementation.dart';
import 'package:flutter_music/features/data/repositories/musics_repository_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthDatasource extends Mock implements IAuthDatasource {}

void main() {
  late AuthRepositoryImplementation repository;
  late IAuthDatasource datasource;

  setUp(() {
    datasource = MockAuthDatasource();
    repository = AuthRepositoryImplementation(datasource: datasource);
  });

  const tUserModel = UserModel(
    id: 'H5KamwZOWm',
    username: 'Maísa',
    email: 'email@email.com',
    token: 'r:939cb57fcb9496900714a1ede0d77ab6',
  );

  test(
    'should return user model when call sign in the datasource',
    () async {
      when(() => datasource.signin(
          email: 'email@email.com', password: 'Maisa@123')).thenAnswer(
        (invocation) async => tUserModel,
      );
      final result = await repository.signin(
        email: 'email@email.com',
        password: 'Maisa@123',
      );
      expect(
        result,
        const Right(tUserModel),
      );
      verify(
        () =>
            datasource.signin(email: 'email@email.com', password: 'Maisa@123'),
      );
    },
  );

  test(
    'should return user model when call sign up the datasource',
    () async {
      when(() => datasource.signup(
          username: 'Maísa',
          email: 'email@email.com',
          password: 'Maisa@123')).thenAnswer(
        (invocation) async => tUserModel,
      );
      final result = await repository.signup(
        username: 'Maísa',
        email: 'email@email.com',
        password: 'Maisa@123',
      );
      expect(
        result,
        const Right(tUserModel),
      );
      verify(
        () => datasource.signup(
            username: 'Maísa', email: 'email@email.com', password: 'Maisa@123'),
      );
    },
  );

  test(
    'should return a server failure when the call sign in to datasource is unsuccessful',
    () async {
      when(() => datasource.signin(
          email: 'email@email.com',
          password: 'Maisa@123')).thenThrow(ServerException());
      final result = await repository.signin(
        email: 'email@email.com',
        password: 'Maisa@123',
      );
      expect(
        result,
        Left(ServerFailure()),
      );
      verify(
        () =>
            datasource.signin(email: 'email@email.com', password: 'Maisa@123'),
      );
    },
  );

  test(
    'should return a server failure when the call sign up to datasource is unsuccessful',
    () async {
      when(() => datasource.signup(
          username: 'Maísa',
          email: 'email@email.com',
          password: 'Maisa@123')).thenThrow(ServerException());
      final result = await repository.signup(
        username: 'Maísa',
        email: 'email@email.com',
        password: 'Maisa@123',
      );
      expect(
        result,
        Left(ServerFailure()),
      );
      verify(
        () => datasource.signup(
            username: 'Maísa', email: 'email@email.com', password: 'Maisa@123'),
      );
    },
  );
}
