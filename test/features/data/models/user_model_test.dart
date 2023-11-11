import 'dart:convert';
import 'package:flutter_music/features/data/models/user_model.dart';
import 'package:flutter_music/features/domain/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../mocks/user_mock.dart';

void main() {
  const tUserModel = UserModel(
    id: 'H5KamwZOWm',
    username: 'Maísa',
    email: 'email@email.com',
    token: 'r:939cb57fcb9496900714a1ede0d77ab6',
  );

  test('should be a subclass of UserEntity', () {
    expect(tUserModel, isA<UserEntity>());
  });

  test('should return a valid model', () async {
    final Map<String, dynamic> jsonMap = json.decode(userMock)['result'];
    final result = UserModel.fromJson(jsonMap);
    expect(tUserModel, result);
  });

  test('should return a json map containing the props data', () async {
    final expectedMap = {
      'id': "H5KamwZOWm",
      "username": "Maísa",
      "email": "email@email.com",
      "token": "r:939cb57fcb9496900714a1ede0d77ab6",
    };
    final result = tUserModel.toJson();
    expect(expectedMap, result);
  });
}
