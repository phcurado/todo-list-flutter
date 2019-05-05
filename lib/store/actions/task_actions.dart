import 'package:fluttertodoapp/models/task.dart';

enum Actions { Include, Remove }

Map<String, dynamic> includeTask(Task task) {
  return {'key': Actions.Include, 'payload': task};
}

Map<String, dynamic> removeTask(Task task) {
  return {'key': Actions.Remove, 'payload': task};
}
