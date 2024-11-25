import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kinzy_todo_app/core/utils/app_font_styles.dart';
import 'package:kinzy_todo_app/core/utils/colors.dart';
import 'package:kinzy_todo_app/core/widgets/app_button.dart';
import 'package:kinzy_todo_app/features/authentication/data/models/task_model.dart';
import 'package:kinzy_todo_app/features/tasks/presentation/bloc/task_bloc.dart';
import 'package:kinzy_todo_app/features/tasks/presentation/bloc/task_state.dart';
import 'package:kinzy_todo_app/features/tasks/presentation/bloc/tast_event.dart';
import 'package:kinzy_todo_app/features/tasks/presentation/ui/widgets/task_appbar.dart';
import 'package:kinzy_todo_app/features/tasks/presentation/ui/widgets/task_column.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(AppColors.primaryColor),
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Icon(Icons.task, color: Colors.white), // ToDo Icon
        ),
        title: const AppBarButton(),
        centerTitle: false,
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
          bloc: _taskBloc,
          builder: (context, state) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 8, left: 8.0, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TaskColumn(
                            title: 'To Do',
                            tasks: state.taskList
                                .where(
                                  (element) =>
                                      element.status == TaskStatus.todo.name,
                                )
                                .toList(),
                          ),
                        ),
                        Expanded(
                          child: TaskColumn(
                            title: 'In Progress',
                            tasks: state.taskList
                                .where(
                                  (element) =>
                                      element.status ==
                                      TaskStatus.inProgress.name,
                                )
                                .toList(),
                          ),
                        ),
                        Expanded(
                          child: TaskColumn(
                            title: 'Done',
                            tasks: state.taskList
                                .where(
                                  (element) =>
                                      element.status == TaskStatus.done.name,
                                )
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: SizedBox(
                    width: 150,
                    child: CustomButton(
                      onPressed: () {
                        _showAddTaskDialog(context);
                      },
                      text: "Add Task",
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController timeController = TextEditingController();

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
                    labelStyle: AppTextStyles.bodyMedium),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: AppTextStyles.bodyMedium),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final task = TaskModel(
                  name: nameController.text,
                  description: descriptionController.text,
                  time: timeController.text,
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
