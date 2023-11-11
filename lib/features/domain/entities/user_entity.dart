import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String usename;
  final String email;
  final String token;

  const UserEntity({
    required this.id,
    required this.usename,
    required this.email,
    required this.token,
  });

  @override
  List<Object?> get props => [
        id,
        usename,
        email,
        token,
      ];
}
