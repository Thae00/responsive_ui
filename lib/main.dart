import 'package:flutter/material.dart';
import 'package:responsive_ui/pages/welcome_screen.dart';
import 'package:responsive_ui/size_config.dart';
import 'package:responsive_ui/styling.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          SizeConfig().init(constraints, orientation);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Learning PlatForm Application',
            theme: AppTheme.lightTheme,
            home: WelcomScreen(),
          );
        });
      },
    );
  }
}
