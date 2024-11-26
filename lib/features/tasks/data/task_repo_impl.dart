import 'package:hive/hive.dart';
import 'package:kinzy_todo_app/features/authentication/data/models/task_model.dart';

import '../domain/task_repo.dart';

class TodoRepoImpl extends TodoRepo{
  @override
  Future<List<TaskModel>> getTasksFromHive() async{
 
  var box = await Hive.openBox<TaskModel>('task');
    return box.values.toList().cast<TaskModel>(); 
  }
  
  @override
  Future<void> createTask(TaskModel task)async {
   var box = await Hive.openBox<TaskModel>('task');
    await box.add(task);
  }

  @override
  Future<void> deleteTask(TaskModel task)async {
   var box = await Hive.openBox<TaskModel>('task');
    await box.delete(task);
  }
    @override
  Future<void> updateTask(TaskModel task,int index)async {
   var box = await Hive.openBox<TaskModel>('task');
    await box.putAt(index, task);
  }

}