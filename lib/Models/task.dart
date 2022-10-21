import 'package:hive_flutter/hive_flutter.dart';
part 'task.g.dart';

@HiveType(typeId: 2)
class TaskModel extends HiveObject {
  @HiveField(0)
  final String user;
  @HiveField(1)
  final String task;
  @HiveField(2)
  final bool completed;
  TaskModel(this.completed, this.user, this.task);
}
