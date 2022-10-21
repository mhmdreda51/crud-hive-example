import 'package:hive_example/Models/task.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodoServices {
//==============================================================================
  late Box<TaskModel> _tasks;
//==================================Init========================================
  Future<void> init() async {
    Hive.registerAdapter(TaskModelAdapter());
    _tasks = await Hive.openBox<TaskModel>("tasks");
  }

//================================Read Data=====================================
  List<TaskModel> getTasks(final String userName) {
    final tasks = _tasks.values.where((element) => element.user == userName);
    return tasks.toList();
  }

//================================Add Data======================================
  void addTask(final String task, username) {
    _tasks.add(TaskModel(false, username, task));
  }

//===============================Remove Data====================================
  Future<void> removeTask(final String task, username) async {
    final taskToRemove = _tasks.values.firstWhere(
      (element) => element.task == task && element.user == username,
    );
    await taskToRemove.delete();
  }

//===============================Update Data====================================
  Future<void> updateTask(final String task, username,
      {final bool? completed}) async {
    final taskToEdit = _tasks.values.firstWhere(
      (element) => element.task == task && element.user == username,
    );
    final index = taskToEdit.key as int;
    await _tasks.put(
        index, TaskModel(completed ?? taskToEdit.completed, username, task));
  }
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================

}
