import 'package:flutter_music/core/http_client/http_client.dart';
import 'package:flutter_music/features/data/datasources/auth_datasource.dart';
import 'package:flutter_music/features/data/datasources/auth_datasource_implementation.dart';
import 'package:flutter_music/features/data/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/user_mock.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  late IAuthDatasource datasource;
  late HttpClient client;

  setUp(() {
    client = HttpClientMock();
    datasource = AuthDatasourceImplementation(client: client);
  });

  const urlSignInExpected = 'https://parseapi.back4app.com/functions/signin';
  const urlSignUpExpected = 'https://parseapi.back4app.com/functions/signup';

  void successSignInMock() {
    when(() => client.post(urlSignInExpected, map: {
          'email': 'email@email.com',
          'password': 'Maisa@123',
        })).thenAnswer(
      (_) async => HttpResponse(data: userMock, statusCode: 200),
    );
  }

  void successSignUpMock() {
    when(() => client.post(urlSignUpExpected, map: {
          'username': 'Maísa',
          'email': 'email@email.com',
          'password': 'Maisa@123',
        })).thenAnswer(
      (_) async => HttpResponse(data: userMock, statusCode: 200),
    );
  }

  const tUserModel = UserModel(
    id: 'H5KamwZOWm',
    username: 'Maísa',
    email: 'email@email.com',
    token: 'r:939cb57fcb9496900714a1ede0d77ab6',
  );

  test('should call the post method sign in with correct url', () async {
    // Arrange
    successSignInMock();
    // Act
    await datasource.signin(email: 'email@email.com', password: 'Maisa@123');
    // Assert
    verify(() => client.post(urlSignInExpected, map: {
          'email': 'email@email.com',
          'password': 'Maisa@123',
        })).called(1);
  });

  test('should call the post method sign up with correct url', () async {
    // Arrange
    successSignUpMock();
    // Act
    await datasource.signup(
        username: 'Maísa', email: 'email@email.com', password: 'Maisa@123');
    // Assert
    verify(() => client.post(urlSignUpExpected, map: {
          'username': 'Maísa',
          'email': 'email@email.com',
          'password': 'Maisa@123',
        })).called(1);
  });

  test('should return a UserModel when sign in is successful', () async {
    // Arrange
    successSignInMock();
    // Act
    final result = await datasource.signin(
        email: 'email@email.com', password: 'Maisa@123');
    // Assert
    expect(result, tUserModel);
  });

  test('should return a UserModel when sign up is successful', () async {
    // Arrange
    successSignUpMock();
    // Act
    final result = await datasource.signup(
        username: 'Maísa', email: 'email@email.com', password: 'Maisa@123');
    // Assert
    expect(result, tUserModel);
  });
}
