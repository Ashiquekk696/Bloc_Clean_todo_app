import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_clean_app/features/tasks/domain/task_repo.dart';
import 'package:todo_bloc_clean_app/features/tasks/presentation/bloc/task_state.dart';
import 'package:todo_bloc_clean_app/features/tasks/presentation/bloc/tast_event.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
final TodoRepo todoRepo;
  TaskBloc(this.todoRepo) : super(TaskState.initial()) {
    on<AddTaskEvent>(_addTask);
    on<GetTaskEvent>(_getTask);
    on<UpdateTaskEvent>(_updateTask);
    on<DeleteTaskEvent>(_deleteTask);
  }

  FutureOr<void> _getTask(event, emit) async{
    emit(state.copyWith(getTaskStatus: ApiStatus.loading));
    final tasks = await todoRepo.getTasksFromHive();
    emit(state.copyWith(taskList: tasks, getTaskStatus: ApiStatus.loaded));
  }

  FutureOr<void> _addTask(AddTaskEvent event, emit)async {
    emit(state.copyWith(addTaskStatus: ApiStatus.loading));
    final tasks = state.taskList.toList();
    tasks.add(event.taskModel);
    await todoRepo.createTask(event.taskModel);
    emit(state.copyWith(taskList: tasks, addTaskStatus: ApiStatus.loaded));
  }

  
  FutureOr<void> _updateTask(UpdateTaskEvent event, emit)async {
    emit(state.copyWith(addTaskStatus: ApiStatus.loading));
    final tasks = state.taskList.toList();
       tasks[event.index] = tasks[event.index].copyWith(status: event.status,name: event.taskModel.name,
       description: event.taskModel.description);
    
    await todoRepo.updateTask(event.taskModel,event.index,);
    emit(state.copyWith(taskList: tasks, addTaskStatus: ApiStatus.loaded));
  }


    FutureOr<void> _deleteTask(DeleteTaskEvent event, emit)async {
    emit(state.copyWith(addTaskStatus: ApiStatus.loading));
    final tasks = state.taskList.toList();
    await todoRepo.deleteTask(event.taskModel);
    tasks.remove(event.taskModel);
    emit(state.copyWith(taskList: tasks, addTaskStatus: ApiStatus.loaded));
  }
}
