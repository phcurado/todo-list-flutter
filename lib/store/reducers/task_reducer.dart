import 'package:fluttertodoapp/models/app_state.dart';
import 'package:fluttertodoapp/models/task.dart';
import 'package:fluttertodoapp/store/actions/task_actions.dart';

List<Task> taskReducer(List<Task> tasks, action) {
  if (action['type'] == Actions.Include) {
    return new List.from(tasks)..add(action['payload']);
  } else if (action['type'] == Actions.Remove) {
    return new List.from(tasks)..remove(action['payload']);
  } else {
    return tasks;
  }
}

AppState appStateReducer(AppState state, action) =>
    AppState(taskReducer(state.tasks, action));
