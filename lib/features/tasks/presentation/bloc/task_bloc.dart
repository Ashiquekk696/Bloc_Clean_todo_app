import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kinzy_todo_app/features/tasks/domain/todo_repo.dart';
import 'package:kinzy_todo_app/features/tasks/presentation/bloc/task_state.dart';
import 'package:kinzy_todo_app/features/tasks/presentation/bloc/tast_event.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
final TodoRepo todoRepo;
  TaskBloc(this.todoRepo) : super(TaskState.initial()) {
    on<AddTaskEvent>(_addTask);
    on<GetTaskEvent>(_getTask);
    on<UpdateTaskEvent>(_updateTask);
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
       tasks[event.index] = tasks[event.index].copyWith(status: event.status);
    
    await todoRepo.updateTask(event.taskModel,event.index,);
    emit(state.copyWith(taskList: tasks, addTaskStatus: ApiStatus.loaded));
  }
}
