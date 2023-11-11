import 'package:flutter_music/features/domain/entities/user_entity.dart';
import 'package:flutter_music/features/domain/usecases/signin_usecase.dart';
import 'package:flutter_music/features/domain/usecases/signup_usecase.dart';
import 'package:flutter_triple/flutter_triple.dart';

class AuthStore extends Store<UserEntity?> {
  final SigninUsecase signinUsecase;
  final SignupUsecase signupUsecase;

  AuthStore({required this.signinUsecase, required this.signupUsecase})
      : super(null);

  Future<void> signin({required String email, required String password}) async {
    setLoading(true);
    final result = await signinUsecase({
      "email": email,
      "password": password,
    });
    result.fold((error) => setError(error), (success) => update(success));
    setLoading(false);
  }

  Future<void> signup(
      {required String username,
      required String email,
      required String password}) async {
    setLoading(true);
    final result = await signupUsecase({
      "username": username,
      "email": email,
      "password": password,
    });
    result.fold((error) => setError(error), (success) => update(success));
    setLoading(false);
  }
}
