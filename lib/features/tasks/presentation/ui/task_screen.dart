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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(AppColors.primaryColor),
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Icon(Icons.task, color: Colors.white),
        ),
        title: AppBarButton(),
        centerTitle: false,
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        bloc: _taskBloc,
        builder: (context, state) {
          return 
              TaskList(
            taskBloc: _taskBloc,
            state: state,
            onTaskDropped: _onTaskDropped,
          ); 
        },
      ),
    );
  }
}
