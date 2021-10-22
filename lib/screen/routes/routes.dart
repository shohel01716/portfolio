
import 'package:portfolio/screen/contact/contact_page.dart';
import 'package:portfolio/screen/experience/experience_page.dart';

import 'package:flutter/material.dart';
import 'package:portfolio/screen/about/about_screen.dart';
import 'package:portfolio/screen/home/home_screen.dart';
import 'package:portfolio/screen/project_detail/project_detail_screen.dart';
import 'package:portfolio/screen/works/works_screen.dart';

typedef PathWidgetBuilder = Widget Function(
    BuildContext, String? /*Map<String, String>*/);

class Path {
  const Path(this.pattern, this.builder);
  final String pattern;

  final PathWidgetBuilder builder;
}

class RouteConfiguration {
  static List<Path> paths = [
/*   Path(
      r'^' + ContactPage.contactPageRoute,
      (context, matches) => const ContactPage(),
    ),*/
    Path(
      r'^' + AboutPage.aboutPageRoute,
      (context, matches) => const AboutPage(),
    ),
    Path(
      r'^' + WorksPage.worksPageRoute,
      (context, matches) => const WorksPage(),
    ),
    Path(
      r'^' + ProjectDetailPage.projectDetailPageRoute,
      (context, matches) => const ProjectDetailPage(),
    ),
    Path(
      r'^' + ExperiencePage.experiencePageRoute,
      (context, matches) => const ExperiencePage(),
    ),

    Path(
      r'^' + HomeScreen.homeScreenRoute,
      (context, matches) =>  HomeScreen(),
    ),
    
  ];

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    for (Path path in paths) {
      final regExpPattern = RegExp(path.pattern);
      if (regExpPattern.hasMatch(settings.name!)) {
        final firstMatch = regExpPattern.firstMatch(settings.name!)!;
        final match = (firstMatch.groupCount == 1) ? firstMatch.group(1) : null;
        return NoAnimationMaterialPageRoute<void>(
          builder: (context) => path.builder(context, match),
          settings: settings,
        );
      }
    }
    // If no match is found, [WidgetsApp.onUnknownRoute] handles it.
    return null;
  }
}

class NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationMaterialPageRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
  }) : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}
