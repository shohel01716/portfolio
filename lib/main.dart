import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:portfolio/app_theme.dart';

import 'package:portfolio/screen/home/home_screen.dart';
import 'package:portfolio/screen/routes/routes.dart';

import 'package:portfolio/values/values.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: MaterialApp(
        title: PORTFOLIO_TITLE,
        theme: AppTheme.lightThemeData,
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.homeScreenRoute,
        onGenerateRoute: RouteConfiguration.onGenerateRoute,
      ),
    );
  }
}




