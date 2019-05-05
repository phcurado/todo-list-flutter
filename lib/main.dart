import 'package:flutter/material.dart';
import 'package:fluttertodoapp/models/app_state.dart';
import 'pages/home.page.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:fluttertodoapp/store/reducers/task_reducer.dart';

void main() {
  final store = new Store<AppState>(appStateReducer,
      initialState: AppState.initialState());

  runApp(new App(
    store: store,
  ));
}

class App extends StatelessWidget {
  final Store<AppState> store;

  App({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
