import 'package:meta/meta.dart';
import 'auth_state.dart';

@immutable
class AppState{
  final AuthState auth;

  static var rehydrationJSON;

  AppState({AuthState auth}):
    auth = auth ?? new AuthState();

  static AppState fromJson(dynamic json) => new AppState(
    auth: new AuthState.fromJSON(json['auth']),
  );

  Map<String, dynamic> toJson() => {
    'auth': auth.toJson(),
  };

  AppState copyWith({
    bool rehydrated,
    AuthState auth,
  }) {
    return new AppState(
      auth: auth ?? this.auth,
    );
  }
  
  @override
  String toString() {
    return '''AppState{
      auth: $auth
    }''';
  }
}