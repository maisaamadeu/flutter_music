import 'dart:convert';

import 'package:flutter_music/core/http_client/http_client.dart';
import 'package:flutter_music/core/usecase/errors/exceptions.dart';
import 'package:flutter_music/features/data/datasources/auth_datasource.dart';
import 'package:flutter_music/features/data/datasources/endpoints/back4app_endpoints.dart';
import 'package:flutter_music/features/data/models/user_model.dart';

class AuthDatasourceImplementation implements IAuthDatasource {
  final HttpClient client;

  AuthDatasourceImplementation({required this.client});

  @override
  Future<UserModel> signin(
      {required String email, required String password}) async {
    final response = await client.post(Back4appEndpoints.signin, map: {
      "email": email,
      "password": password,
    });
    if (response.statusCode == 200) {
      final user = UserModel.fromJson(json.decode(response.data)['result']);

      return user;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> signup(
      {required String username,
      required String email,
      required String password}) async {
    final response = await client.post(Back4appEndpoints.signup, map: {
      "username": username,
      "email": email,
      "password": password,
    });
    if (response.statusCode == 200) {
      final user = UserModel.fromJson(json.decode(response.data)['result']);

      return user;
    } else {
      throw ServerException();
    }
  }
}
