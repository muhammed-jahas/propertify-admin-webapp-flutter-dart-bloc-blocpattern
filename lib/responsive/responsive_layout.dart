import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget desktopScaffold;

  const ResponsiveLayout({super.key, required this.desktopScaffold});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return desktopScaffold;
     
    },);
  }
}