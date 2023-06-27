
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/design/utils/constants/colors.dart';

class LogoHeader extends StatelessWidget {
  const LogoHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'FAB',
      style: TextStyle(
        fontFamily: 'DingDong',
        color: AppColors.red,
        fontSize: 180,
      ),
    );
  }
}
