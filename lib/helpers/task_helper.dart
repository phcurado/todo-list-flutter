import 'package:fluttertodoapp/models/task.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

final String tasksTable = "taskTable";
final String idColumn = "idColumn";
final String titleColumn = "titleColumn";
final String descriptionColumn = "descriptionColumn";
final String checkColumn = "checkColumn";

class TaskHelper {

  static final TaskHelper _instance = TaskHelper.internal();

  factory TaskHelper() => _instance;

  TaskHelper.internal();

  Database _db;

  Future<Database> get db async {
    if(_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "tasks.db");

    return await openDatabase(path, version: 1, onCreate: (Database db, int newVersion) async {
      await db.execute(
        "CREATE TABLE $tasksTable($idColumn INTEGER primary key, $titleColumn TEXT, $descriptionColumn TEXT," 
        "$checkColumn BOOLEAN)"
      );
    });
  }

  Future<Task> saveTask(Task task) async {
    Database dbTask = await db;
    task.id = await dbTask.insert(tasksTable, task.toMap());
    return task;
  }

  Future<Task> getTask(int id) async {
    Database dbTask = await db;
    List<Map> maps = await dbTask.query(tasksTable, 
      columns: [idColumn, titleColumn, descriptionColumn, checkColumn],
      where: "$idColumn = ?",
      whereArgs: [id]
    );
    if(maps.length > 0) {
      return Task.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> updateTaskt(Task task) async {
    Database dbTask = await db;
      return await dbTask.update(tasksTable, 
        task.toMap(),
        where: "$idColumn = ?",
        whereArgs: [task.id]
      );
  }

  Future<List<Task>> getAllTasks() async {
    Database dbTask = await db;
    List listMap = await dbTask.rawQuery("SELECT * FROM $tasksTable");
    List<Task> listTask = List();
    for(Map task in listMap) {
      listTask.add(Task.fromMap(task));
    }
    return listTask;
  }

   Future close() async {
     Database dbTask = await db;
     dbTask.close();
   }

}