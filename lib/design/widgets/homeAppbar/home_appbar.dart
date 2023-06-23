import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/design/utils/routes/route_constants.dart';
import 'package:flutter_boilerplate/design/widgets/homeAppbar/home_appbar_desktop.dart';
import 'package:flutter_boilerplate/design/widgets/homeAppbar/home_appbar_mobile.dart';
import 'package:flutter_boilerplate/design/widgets/responsive.dart';
import 'package:go_router/go_router.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 24.0,
        ),
        child: const Responsive(
          mobile: HomeAppBarMobile(),
          tablet: HomeAppBarDesktop(),
          desktop: HomeAppBarDesktop(),
        ));
  }
}


class AppBarButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  const AppBarButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
