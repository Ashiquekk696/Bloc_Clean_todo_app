
import 'package:flutter/material.dart'; 
import 'package:get_it/get_it.dart';
import 'package:kinzy_todo_app/core/utils/app_font_styles.dart';
import 'package:kinzy_todo_app/features/authentication/data/models/task_model.dart';
import 'package:kinzy_todo_app/features/tasks/presentation/bloc/tast_event.dart';

import '../../../../../core/utils/colors.dart';
import '../../bloc/task_bloc.dart'; 

class TaskCard extends StatelessWidget {
  final TaskModel task;
  final int index;

  TaskCard({required this.task,required this. index});

  @override
  Widget build(BuildContext context) {
    
    return Card(
      color: const Color(AppColors.backgrounLighGreyColor),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.name,
              style: AppTextStyles.headingSmall,
            ),
            const SizedBox(height: 4),
            Text(task.description,  style: AppTextStyles.bodyLarge,),
            const SizedBox(height: 8),
            Text('Time: ${task.time}',style: AppTextStyles.bodyLarge,),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                 _showAddTaskDialog(context,task);
                    // Edit Task action
                  },
                ),
              
              ],
            ),
          ],
        ),
      ),
    );
  }

    void _showAddTaskDialog(BuildContext context,TaskModel task) {
    final TextEditingController nameController = TextEditingController(text: task.name);
    final TextEditingController descriptionController = TextEditingController(text: task.description);
    final TextEditingController timeController = TextEditingController(text: task.time);
    TaskStatus status = TaskStatus.values.firstWhere((element) => element.name==task.status);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title:   Text("Edit Task",style: AppTextStyles.headingSmall,),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Task Name',labelStyle: AppTextStyles.bodyMedium),
              ),
              TextField(
                controller: descriptionController,
                decoration:   InputDecoration(labelText: 'Description',labelStyle: AppTextStyles.bodyMedium),
              ),
              DropdownButton(
                value: status,
                items: TaskStatus.values.map((e) =>
               DropdownMenuItem<TaskStatus>(child: Text(e.name),value: e),).toList(), onChanged: (v){
                status = v!;
               })

             
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
                TaskBloc taskBloc = GetIt.I<TaskBloc>();
                final task = TaskModel(
                  name: nameController.text,
                  description: descriptionController.text,
                  time: timeController.text,
                );
                taskBloc.add(UpdateTaskEvent(task,index,status));

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
 