import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:kinzy_todo_app/core/widgets/app_button.dart';
import 'package:kinzy_todo_app/features/authentication/data/models/task_model.dart';
import 'package:kinzy_todo_app/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:kinzy_todo_app/features/tasks/presentation/bloc/tast_event.dart';

import '../../../../../core/utils/app_font_styles.dart';
import '../../../../authentication/presentation/bloc/auth_event.dart';
import '../../bloc/task_bloc.dart';
import 'add_task_button.dart';

class AppBarButton extends StatelessWidget {
  AppBarButton({
    super.key,
  });
  late TaskBloc _taskBloc;
  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = GetIt.I<AuthBloc>();
    _taskBloc = GetIt.I<TaskBloc>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AddTaskButton(onPressed: () => _showAddTaskDialog(context)),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
            width: 100,
            child: CustomButton(
              isHomeAppBar: true,
              onPressed: () {
                authBloc.add(LogOutEvent());
              },
              text: "Logout",
            )),
        const SizedBox(
          width: 50,
        )
      ],
    );
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
}
