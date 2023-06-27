import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/models/course_model.dart';
import 'package:flutter_boilerplate/design/utils/constants/colors.dart';
import 'package:flutter_boilerplate/design/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class MonthsScreen extends StatelessWidget {
  final List<Item> items;

  const MonthsScreen({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final Map<String, dynamic> args = GoRouter.of(context).;
    //final List<Item> items = args['items'] as List<Item>;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: true,
        foregroundColor: Colors.black,
      ),
      body: Column(children: [
        LogoHeader(),
        // Expanded(
        //   child: ListView.builder(
        //     itemCount: items.length,
        //     itemBuilder: (context, index) {
        //       final item = items[index];
        //       return Padding(
        //         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        //         child: ListTile(
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.all(Radius.circular(10)),
        //           ),
        //           title: Text(
        //             item.title,
        //             style: TextStyle(
        //               fontFamily: 'DingDong',
        //               color: AppColors.blue,
        //               fontSize: 30,
        //             ),
        //           ),
        //           tileColor: AppColors.yellow,
        //         ),
        //       );
        //     },
        //   ),
        // ),
      ]),
    );
  }
}
