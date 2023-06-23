import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/design/utils/routes/route_constants.dart';
import 'package:flutter_boilerplate/design/widgets/homeAppbar/home_appbar.dart';
import 'package:go_router/go_router.dart';

class HomeAppBarDesktop extends StatelessWidget {
  const HomeAppBarDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppBarButton(
                  title: 'Home',
                  onTap: () {
                    context.goNamed(AppRouteConstants.homeRouteName);
                  },
                ),
                AppBarButton(
                  title: 'About',
                  onTap: () {
                    context.goNamed(AppRouteConstants.aboutRouteName);
                  },
                ),
                AppBarButton(
                  title: 'Contact',
                  onTap: () {
                    context.goNamed(AppRouteConstants.contactRouteName);
                  },
                ),
                AppBarButton(
                  title: 'Profile',
                  onTap: () {
                    context.goNamed(AppRouteConstants.profileRouteName);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
