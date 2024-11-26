import '../../authentication/data/models/task_model.dart';

abstract class TodoRepo{

   Future<List<TaskModel>> getTasksFromHive();
     Future<void> updateTask(TaskModel task,int index);
   Future<void> createTask(TaskModel task);
      Future<void> deleteTask(TaskModel task);
}