// Contact Screen

import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Contact Screen'.toUpperCase(),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Text(
            'Contact Screen'.toUpperCase(),
          ),
        ),
      ),
    );
  }
}
