
import 'package:flutter/material.dart';
import 'package:kinzy_todo_app/core/widgets/app_button.dart';

class AddTaskButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddTaskButton({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: 10,
      child: SizedBox(
        width: 150,
        child: CustomButton(
          onPressed: onPressed,
          text: "Add Task",
        ),
      ),
    );
  }
}
