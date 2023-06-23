import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/design/utils/routes/route_config.dart';

import 'design/screens/screens.dart';
import 'design/utils/design/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Boilerplate',
      theme: AppTheme.lightTheme,

      // authentication is not implemented yet so we are passing true to returnRouter to the routerConfig property
      routerConfig: AppRouter.returnRouter(true),
    );
  }
}
