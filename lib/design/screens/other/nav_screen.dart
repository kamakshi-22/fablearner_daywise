/* import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/design/screens/screens.dart';
import 'package:flutter_boilerplate/design/screens/tabs/about/about.dart';
import 'package:flutter_boilerplate/design/screens/tabs/profile/profile.dart';
import 'package:flutter_boilerplate/design/utils/constants/colors.dart';
import 'package:flutter_boilerplate/design/widgets/responsive.dart';
import 'package:flutter_boilerplate/design/screens/tabs/home/home_screen.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = const [
    // key is used to preserve state of the screen when switching tabs (e.g. scroll position)
    HomeScreen(key: PageStorageKey('homeScreen')),
    AboutScreen(),
    ContactScreen(),
    ProfileScreen(),
  ];

  final Map<String, IconData> _icons = const {
    'Home': Icons.home_rounded,
    'About': Icons.search_rounded,
    'Contact': Icons.mail_rounded,
    'Profile': Icons.person_rounded,
  };

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar:
            // don't show bottom navigation bar on desktop and tablet
            Responsive.isDesktop(context) || Responsive.isTablet(context)
                ? null
                : BottomNavigationBar(
                    backgroundColor: AppColors.black,
                    currentIndex: _currentIndex,
                    onTap: (index) => setState(() => _currentIndex = index),
                    items: _icons
                        .map(
                          (key, value) => MapEntry(
                            key,
                            BottomNavigationBarItem(
                              icon: Icon(
                                value,
                                size: 30.0,
                              ),
                              label: key,
                            ),
                          ),
                        )
                        .values
                        .toList(),
                  ));
  }
}
 */
