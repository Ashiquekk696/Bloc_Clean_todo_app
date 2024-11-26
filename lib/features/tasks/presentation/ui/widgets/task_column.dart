import 'package:flutter/material.dart';
import 'package:kinzy_todo_app/core/utils/app_font_styles.dart';
import 'package:kinzy_todo_app/features/authentication/data/models/task_model.dart';

import '../../../../../core/utils/colors.dart';
import 'task_card.dart';

class TaskColumn extends StatelessWidget {
  final String title;
  final List<TaskModel> tasks;
  final Function(TaskModel, String) onTaskDropped;

  const TaskColumn({
    super.key,
    required this.title,
    required this.tasks,
    required this.onTaskDropped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: DragTarget<TaskModel>(
        onAccept: (task) => onTaskDropped(task, title),
        builder: (context, candidateData, rejectedData) => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  width: double.maxFinite,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.only(left: 16.0, top: 8),
                  child: Text(
                    title,
                    style: AppTextStyles.headingMedium.copyWith(
                      color: const Color(AppColors.white),
                      fontSize: 18,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                     return Draggable<TaskModel>(
                        data: tasks[index],
                        feedback: Material(
                          child: TaskCard(task: tasks[index], index: index),
                        ),
                        child: TaskCard(task: tasks[index], index: index),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
