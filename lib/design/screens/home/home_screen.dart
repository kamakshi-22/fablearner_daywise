import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/design/screens/home/months_screen.dart';
import 'package:flutter_boilerplate/design/utils/constants/apis.dart';
import 'package:flutter_boilerplate/design/utils/constants/colors.dart';
import 'package:flutter_boilerplate/design/utils/design/app_styles.dart';
import 'package:flutter_boilerplate/design/utils/design/app_theme.dart';
import 'package:flutter_boilerplate/design/utils/routes/route_constants.dart';
import 'package:flutter_boilerplate/design/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_boilerplate/core/models/course_model.dart';

class HomeScreen extends StatefulWidget {
  final String token;
  const HomeScreen({Key? key, required this.token}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CourseModel> courseList = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    var url = ApiConstants().fetchCoursesApi;
    String bearerToken = widget.token;

    var response = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Bearer $bearerToken',
    });

    if (response.statusCode == 200) {
      // API call succeeded
      var jsonResponse = json.decode(response.body);

      setState(() {
        courseList.clear();
        for (var courseData in jsonResponse) {
          courseList.add(CourseModel.fromJson(courseData));
        }

        courseList.sort((a, b) {
          if (a.courseData.status == 'enrolled' &&
              b.courseData.status != 'enrolled') {
            return -1; // a comes before b
          } else if (a.courseData.status != 'enrolled' &&
              b.courseData.status == 'enrolled') {
            return 1; // b comes before a
          } else {
            return 0; // same order
          }
        });
        isLoading = false;
      });

      // Print the data to the console
      for (var course in courseList) {
        if (kDebugMode) {
          if (!course.name.contains('Month') ||
              course.name.contains('FabReader')) print(course.name);
        }
      }
    } else {
      // API call failed
      print('Request failed with status: ${response.statusCode}.');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 50.0),
        child: const CustomAppBar(title: ''),
      ),
      body: Column(
        children: [
          const LogoHeader(),
          Expanded(
            child: isLoading
                ? const Center(
                    child: AppProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: courseList.length,
                    itemBuilder: (context, index) {
                      final course = courseList[index];
                      final bool isEnrolled =
                          course.courseData.status == "enrolled";
                      final bool isNotDaywiseProgram =
                          course.name.contains('FabReader') ||
                              course.name.contains('Month');

                      return isNotDaywiseProgram
                          ? const SizedBox.shrink()
                          : Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 30),
                              child: ListTile(
                                  title: Text(
                                    course.name,
                                    style: AppStyles.listTileTextStyle,
                                  ),
                                  tileColor: isEnrolled
                                      ? AppColors.yellow
                                      : AppColors.black,
                                  trailing: isEnrolled
                                      ? null
                                      : const Icon(
                                          Icons.lock,
                                          color: AppColors.white,
                                        ),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  onTap: () {
                                    
                                    if (isEnrolled) {
                                      final itemsList = course.sections[0].items;
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MonthsScreen(
                                            items: itemsList,
                                          ),
                                        ),
                                      );
                                    } else {
                                      return;
                                    }
                                  }),
                            );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}


/* Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  MonthsScreen(
                                                items: itemsList,
                                              ),
                                            ),
                                          ) */
