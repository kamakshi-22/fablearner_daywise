import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/design/screens/screens.dart';
import 'package:flutter_boilerplate/design/utils/constants/apis.dart';
import 'package:flutter_boilerplate/design/utils/routes/route_constants.dart';
import 'package:flutter_boilerplate/design/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  Future<String> fetchToken() async {
    setState(() {
      isLoading = true;
    });

    try {
      var url = ApiConstants().fetchTokenApi;
      var response = await http.post(Uri.parse(url),
          body: {'username': 'test_user_1', 'password': 'testuser_1022'});

      if (response.statusCode == 200) {
        // API call succeeded
        var data = json.decode(response.body.toString());

        return data['token'];
      } else {
        // API call failed
        if (kDebugMode) {
          print(response.body);
        }
        throw Exception('Failed to load token');
      }
    } catch (error) {
      // Handle any errors that occur during token fetching
      if (kDebugMode) {
        print('Error: $error');
      }
      throw Exception('Failed to load token');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  fetchToken().then((token) {
                    if (kDebugMode) {
                      print('Token: $token');
                    }
                    context.goNamed(AppRouteConstants.homeRouteName,
                        queryParameters: {'token': token});
                  }).catchError((error) {
                    if (kDebugMode) {
                      print('Error: $error');
                    }
                  });
                },
                child: Text(
                  'Login'.toUpperCase(),
                ),
              ),
      ),
    );
  }
}
