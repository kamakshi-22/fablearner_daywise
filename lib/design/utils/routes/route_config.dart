import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/design/screens/tabs/about/about.dart';
import 'package:flutter_boilerplate/design/screens/tabs/profile/profile.dart';
import 'package:flutter_boilerplate/design/utils/routes/route_constants.dart';
import 'package:go_router/go_router.dart';

import '../../screens/screens.dart';

class AppRouter {
  static GoRouter returnRouter(bool isAuth) {
    GoRouter authRouter = GoRouter(
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          name: AppRouteConstants.navRouteName,
          path: '/',
          pageBuilder: (context, state) {
            return MaterialPage(child: NavScreen());
          },
        ),
        GoRoute(
          name: AppRouteConstants.homeRouteName,
          path: '/home',
          pageBuilder: (context, state) {
            return MaterialPage(child: HomeScreen());
          },
        ),
        GoRoute(
            name: AppRouteConstants.profileRouteName,
            path: '/profile',
            pageBuilder: (context, state) {
              return MaterialPage(child: ProfileScreen());
            }),
        GoRoute(
            name: AppRouteConstants.aboutRouteName,
            path: '/about',
            pageBuilder: (context, state) {
              return MaterialPage(child: AboutScreen());
            }),
        GoRoute(
            name: AppRouteConstants.contactRouteName,
            path: '/contact',
            pageBuilder: (context, state) {
              return MaterialPage(child: ContactScreen());
            }),
      ],
      errorPageBuilder: (context, state) {
        return MaterialPage(child: ErrorScreen());
      },
      redirect: (context, state) {
        if (kDebugMode) {
          print(state.location);
        }
        // if user is not authenticated and the current location is not home route then redirect to home route else return null to not redirect anywhere
        if (!isAuth && state.location != AppRouteConstants.homeRouteName) {
          return AppRouteConstants.homeRouteName;
        } else {
          return null;
        }
      },
    );
    return authRouter;
  }
}
