import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:food/middleware/middleware.dart';
import 'package:food/models/app_state.dart';
import 'package:food/screens/login_screen.dart';
import 'package:food/screens/main_screen.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';
import 'package:food/store/store.dart';
import 'package:redux/redux.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(FoodApp());
}

class FoodApp extends StatelessWidget {
  final store = createStore();

  FoodApp();

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
                store: store,
                child: new MaterialApp(
                    title: 'ReduxApp',
                routes: <String, WidgetBuilder>{
                    '/': (BuildContext context) => new StoreConnector<AppState, dynamic>( 
                        converter: (store) => store.state.auth.isAuthenticated, 
                        builder: (BuildContext context, isAuthenticated) => isAuthenticated ? new MainScreen() : new LoginScreen()
                    ),
                    '/login': (BuildContext context) => new LoginScreen(),
                    '/main': (BuildContext context) => new MainScreen()
                }
                )
            );
  }

}
