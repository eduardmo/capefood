import 'package:food/models/auth_state.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:food/models/app_state.dart';
import 'auth_reducer.dart';

AppState appReducer(AppState state, action){
    //print(action);
   if (action is Persistor<AppState>) {
    // Increment
    return state.copyWith(rehydrated: true, auth: new AuthState());
  }

  return state;
}
