import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/design/utils/constants/colors.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      foregroundColor: Colors.black,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'DingDong',
          color: AppColors.red,
          fontSize: 60,
        ),
      ),
    );
  }
}
