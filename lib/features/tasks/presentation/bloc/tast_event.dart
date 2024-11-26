import 'package:kinzy_todo_app/features/authentication/data/models/task_model.dart';

abstract class TaskEvent{}

class AddTaskEvent extends TaskEvent{
 final TaskModel taskModel;
 AddTaskEvent(this.taskModel);

}

class GetTaskEvent extends TaskEvent{
}
class UpdateTaskEvent extends TaskEvent{
   final TaskModel taskModel;
   final int index;
   final TaskStatus status;
 UpdateTaskEvent(this.taskModel,this.index,this.status);
}

class DeleteTaskEvent extends TaskEvent{
   final TaskModel taskModel;
  
 DeleteTaskEvent(  this.taskModel,);
}
