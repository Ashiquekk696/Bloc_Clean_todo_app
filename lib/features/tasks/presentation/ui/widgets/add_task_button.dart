import 'package:flutter/material.dart';
import 'package:todo_bloc_clean_app/core/widgets/app_button.dart';

class AddTaskButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddTaskButton({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: CustomButton(
        isAddTask: true,
        onPressed: onPressed,
        text: "Add Task",
      ),
    );
  }
}
