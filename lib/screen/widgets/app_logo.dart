import 'package:portfolio/values/values.dart';
import 'package:flutter/material.dart';

class AppBarLogo extends StatelessWidget {
  const AppBarLogo({
    Key? key,
    this.title = "Shaheduzzaman",
    this.titleColor = black,
    this.titleStyle,
    this.fontSize =30 ,
  }) : super(key: key);

  final String title;
  final TextStyle? titleStyle;
  final Color titleColor;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "< ",
          style: TextStyle(
            fontSize: fontSize,
            //color: _themeProvider.lightTheme ? Colors.black : Colors.white,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontFamily: "Agustina",
            fontSize: fontSize,
            color: titleColor,
            //color: _themeProvider.lightTheme ? Colors.black : Colors.white,
          ),
        ),
        Text(
          MediaQuery.of(context).size.width >= 1000 ? " />\t\t" : " />",
          style: TextStyle(
            fontSize: fontSize,
            //color: _themeProvider.lightTheme ? Colors.black : Colors.white,
          ),
        )
      ],
    );
  }
}
