import 'user.dart';
import 'package:meta/meta.dart';

@immutable
class AuthState{
  final bool isAuthenticated;
  final bool isAuthenticating;
  final User user;
  final String error;

  AuthState({
    this.isAuthenticated = false,
    this.isAuthenticating = false,
    this.user,
    this.error
  });

  AuthState copyWith({
    bool isAuthenticated,
    bool isAuthenticating,
    String error,
    User user
  }) {
    return new AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isAuthenticating: isAuthenticating ?? this.isAuthenticating,
      user:  user ?? this.user,
      error: error ?? this.error
    );
  }

  factory AuthState.fromJSON(Map<String, dynamic> json) => new AuthState(
    isAuthenticated: json['isAuthenticated'],
    isAuthenticating: json['isAuthenticating'],
    error: json['error'],
    user: json['user'] == null ? null: new User.fromJSON(json['user'])
  ); 

  Map<String, dynamic> toJson() => <String, dynamic>{
     'isAuthenticated': this.isAuthenticated,
        'isAuthenticating': this.isAuthenticating,
        'user': this.user == null ? null : this.user.toJSON(),
        'error': this.error,
    };

    @override
    String toString() {
        return '''{
                isAuthenticated: $isAuthenticated,
                isAuthenticating: $isAuthenticating,
                user: $user,
                error: $error
            }''';
    }

}