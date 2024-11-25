
import 'package:flutter/material.dart';
import 'package:kinzy_todo_app/core/utils/app_font_styles.dart';
import 'package:kinzy_todo_app/features/authentication/data/models/task_model.dart';

import '../../../../../core/utils/colors.dart';
import 'task_card.dart';

class TaskColumn extends StatelessWidget {
  final String title;
  final List<TaskModel> tasks;

  const TaskColumn({super.key, required this.title, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              spreadRadius: 2, // How much the shadow spreads
              blurRadius: 5, // Blur radius of the shadow
              offset: const Offset(0, 3), // Shadow offset (x, y)
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
                  color:const Color(AppColors.primaryColor) ,
                  borderRadius: BorderRadius.circular(5)),
                padding: const EdgeInsets.only(left: 16.0,top: 8),
                
                child: Text(
                  title,
                  style: AppTextStyles.headingMedium.copyWith(color: const Color(AppColors.white,),fontSize: 18),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return TaskCard(task: tasks[index],index:index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
