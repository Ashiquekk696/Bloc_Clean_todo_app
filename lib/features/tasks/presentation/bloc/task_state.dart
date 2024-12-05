// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:todo_bloc_clean_app/features/authentication/data/models/task_model.dart';

class TaskState {
  final ApiStatus getTaskStatus;

  final ApiStatus addTaskStatus;
  final List<TaskModel> taskList;
  TaskState({
    required this.getTaskStatus,
    required this.addTaskStatus,
    required this.taskList,
  });

  factory TaskState.initial() {
    return TaskState(
        getTaskStatus: ApiStatus.initialised,
        taskList: [],
        addTaskStatus: ApiStatus.initialised);
  }
  TaskState copyWith({
    ApiStatus? getTaskStatus,
    ApiStatus? addTaskStatus,
    List<TaskModel>? taskList,
  }) {
    return TaskState(
      getTaskStatus: getTaskStatus ?? this.getTaskStatus,
      addTaskStatus: addTaskStatus ?? this.addTaskStatus,
      taskList: taskList ?? this.taskList,
    );
  }
}

enum ApiStatus { initialised, loading, loaded, failed }
