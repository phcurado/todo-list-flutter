import 'package:fluttertodoapp/models/task.dart';

class AppState {
  final List<Task> tasks;

  AppState(this.tasks);

  AppState.initialState() : tasks = List.unmodifiable(<Task>[]);
}
