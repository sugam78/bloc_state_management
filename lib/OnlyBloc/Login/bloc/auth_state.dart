sealed class AuthState{}

final class AuthInitial extends AuthState{}
final class AuthSuccess extends AuthState{
  final String uid;
  AuthSuccess(this.uid);
}
final class AuthFailure extends AuthState{
  final String error;
  AuthFailure(this.error);
}
final class AuthLoading extends AuthState{

}