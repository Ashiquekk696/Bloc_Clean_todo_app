import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kinzy_todo_app/core/utils/app_font_styles.dart';
import 'package:kinzy_todo_app/core/widgets/app_button.dart';
import 'package:kinzy_todo_app/features/tasks/presentation/bloc/task_state.dart';
import 'package:kinzy_todo_app/features/tasks/presentation/bloc/tast_event.dart';
import 'package:kinzy_todo_app/features/tasks/presentation/ui/widgets/add_task_button.dart';
import 'package:kinzy_todo_app/features/tasks/presentation/ui/widgets/task_appbar.dart';
import 'package:kinzy_todo_app/features/tasks/presentation/ui/widgets/task_column.dart';
import 'package:kinzy_todo_app/features/tasks/presentation/ui/widgets/task_list.dart';

import '../../../../core/utils/colors.dart';
import '../../../authentication/data/models/task_model.dart';
import '../bloc/task_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TaskBloc _taskBloc;

  @override
  void initState() {
    _taskBloc = GetIt.I<TaskBloc>();
    _taskBloc.add(GetTaskEvent());
    super.initState();
  }

  /// Handles task drop by updating its status.
  void _onTaskDropped(TaskModel task, TaskStatus newStatus, int index) {
    final updatedTask = task.copyWith(status: newStatus);
    _taskBloc.add(UpdateTaskEvent(updatedTask, index, newStatus));
  }

  void _showAddTaskDialog(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Task"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Task Name',
                  labelStyle: AppTextStyles.bodyMedium,
                ),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  labelStyle: AppTextStyles.bodyMedium,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final task = TaskModel(
                  time: "",
                  name: nameController.text,
                  description: descriptionController.text,
                  status: TaskStatus.todo.name,
                );
                _taskBloc.add(AddTaskEvent(task));
                Navigator.of(context).pop();
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(AppColors.primaryColor),
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Icon(Icons.task, color: Colors.white),
        ),
        title: const AppBarButton(),
        centerTitle: false,
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        bloc: _taskBloc,
        builder: (context, state) {
          return Stack(
            children: [
              TaskList(
                taskBloc: _taskBloc,
                state: state,
                onTaskDropped: _onTaskDropped,
              ),
              AddTaskButton(onPressed: () => _showAddTaskDialog(context)),
            ],
          );
        },
      ),
    );
  }
}
