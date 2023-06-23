import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/design/utils/constants/colors.dart';
import 'package:flutter_boilerplate/design/widgets/homeAppbar/home_appbar.dart';
import 'package:flutter_boilerplate/design/utils/routes/route_constants.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50.0),
        child: HomeAppBar(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text(
                'Home Screen'.toUpperCase(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.goNamed(AppRouteConstants.aboutRouteName);
              },
              child: Text('About Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                context.goNamed(AppRouteConstants.contactRouteName);
              },
              child: Text('Contact Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
