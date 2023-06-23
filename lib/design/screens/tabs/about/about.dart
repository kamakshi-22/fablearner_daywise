// About Screen

import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'About Screen'.toUpperCase(),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Text(
            'About Screen'.toUpperCase(),
          ),
        ),
      ),
    );
  }
}
