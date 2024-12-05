import 'package:flutter/material.dart';
import 'package:kinzy_todo_app/features/authentication/data/models/task_model.dart';
import 'package:kinzy_todo_app/features/tasks/presentation/bloc/task_bloc.dart';

import '../../bloc/task_state.dart';
import 'task_column.dart';

class TaskList extends StatelessWidget {
  final TaskBloc taskBloc;
  final TaskState state;
  final Function(TaskModel task, TaskStatus status, int index) onTaskDropped;

  const TaskList({
    required this.taskBloc,
    required this.state,
    required this.onTaskDropped,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Padding(
        padding: const EdgeInsets.only(right: 8, left: 8.0, top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: TaskColumn(
                title: 'To Do',
                tasks: state.taskList
                    .where((task) => task.status == TaskStatus.todo.name)
                    .toList(),
                onTaskDropped: (task, status) => onTaskDropped(
                  task,
                  TaskStatus.todo,
                  state.taskList.indexOf(task),
                ),
              ),
            ),
            Expanded(
              child: TaskColumn(
                title: 'In Progress',
                tasks: state.taskList
                    .where((task) => task.status == TaskStatus.inProgress.name)
                    .toList(),
                onTaskDropped: (task, status) => onTaskDropped(
                  task,
                  TaskStatus.inProgress,
                  state.taskList.indexOf(task),
                ),
              ),
            ),
            Expanded(
              child: TaskColumn(
                title: 'Done',
                tasks: state.taskList
                    .where((task) => task.status == TaskStatus.done.name)
                    .toList(),
                onTaskDropped: (task, status) => onTaskDropped(
                  task,
                  TaskStatus.done,
                  state.taskList.indexOf(task),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
