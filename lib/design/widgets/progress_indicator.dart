import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/design/utils/constants/colors.dart';

class AppProgressIndicator extends StatelessWidget {
  const AppProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: AppColors.blue,
    );
  }
}
