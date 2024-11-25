import 'package:flutter/material.dart';

import '../utils/colors.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Color(AppColors.primaryColor)), // You can customize the color
      ),
    );
  }
}
