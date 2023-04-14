part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AuthSuccess extends AuthState {
  final UserModel user;
  AuthSuccess(this.user);

  @override
  List<Object?> get props => [user];

}

class AuthFailed extends AuthState {
  final String error;
  AuthFailed(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];

}