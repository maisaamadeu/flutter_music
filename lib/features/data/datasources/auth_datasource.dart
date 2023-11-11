import 'package:flutter_music/features/data/models/user_model.dart';

abstract class IAuthDatasource {
  Future<UserModel> signup({
    required String username,
    required String email,
    required String password,
  });
  Future<UserModel> signin({
    required String email,
    required String password,
  });
}
