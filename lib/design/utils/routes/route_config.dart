import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/models/course_model.dart';
import 'package:flutter_boilerplate/design/utils/routes/route_constants.dart';
import 'package:go_router/go_router.dart';

import '../../screens/screens.dart';

class AppRouter {
  static GoRouter returnRouter(bool isAuth) {
    GoRouter authRouter = GoRouter(
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
            name: AppRouteConstants.homeRouteName,
            path: '/',
            pageBuilder: (context, state) {
              return MaterialPage(child: HomeScreen());
            },
            routes: [
              GoRoute(
                name: AppRouteConstants.monthsRouteName,
                path: 'months',
                pageBuilder: (context, state) {
                  final queryParameters = state.queryParameters;
                final itemsList = queryParameters['itemsList'] as List<Item>;
                return MaterialPage(
                  key: state.pageKey,
                  child: MonthsScreen(items: itemsList),
                );
                },
              )
            ]),
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
