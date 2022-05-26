import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({Key? key, required this.body}) : super(key: key);
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: body,
      ),
    );
  }
}
