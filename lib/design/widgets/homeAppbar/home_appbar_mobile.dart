import 'package:flutter/material.dart';

class HomeAppBarMobile extends StatelessWidget {
  const HomeAppBarMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.menu_rounded, color: Colors.black),
              ],
            ),
          )
        ],
      ),
    );
  }
}
