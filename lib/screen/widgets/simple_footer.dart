import 'package:portfolio/const/adaptive.dart';
import 'package:portfolio/core/utils/functions.dart';
import 'package:portfolio/screen/widgets/socials.dart';
import 'package:portfolio/presentation/widgets/animated_line_through_text.dart';
import 'package:portfolio/const/spaces.dart';
import 'package:portfolio/values/values.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SimpleFooter extends StatelessWidget {
  const SimpleFooter({
    Key? key,
    this.height,
    this.width,
    this.backgroundColor = black,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? widthOfScreen(context),
      height: height ?? assignHeight(context, 0.2),
      color: backgroundColor,
      child: Center(
        child: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            if (sizingInformation.isMobile) {
              return Column(
                children: [
                  Spacer(flex: 2),
                  SimpleFooterSm(),
                  Spacer(),
                ],
              );
            } else {
              return Column(
                children: [
                  Spacer(),
                  SimpleFooterLg(),
                  SpaceH20(),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

class SimpleFooterSm extends StatelessWidget {
  const SimpleFooterSm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? style = textTheme.bodyText1?.copyWith(
      color: accentColor,
      fontSize: Sizes.TEXT_SIZE_14,
    );
    return Column(
      children: [
        Socials(socialData: Data.socialData),
        SpaceH30(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              COPYRIGHT,
              style: style,
            ),
          ],
        ),
        SpaceH12(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Functions.launchUrl(DESIGN_LINK);
              },
              child: AnimatedLineThroughText(
                text: DESIGNED_BY,
                isUnderlinedByDefault: true,
                isUnderlinedOnHover: false,
                hoverColor: white,
                coverColor: black,
                textStyle: style?.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        SpaceH8(),
        DevelopedWithFlutter(),
      ],
    );
  }
}

class SimpleFooterLg extends StatelessWidget {
  const SimpleFooterLg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? style = textTheme.bodyText1?.copyWith(
      color: accentColor,
      fontSize: Sizes.TEXT_SIZE_14,
    );
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Socials(socialData: Data.socialData),
          ],
        ),
        SpaceH20(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              COPYRIGHT,
              style: style,
            ),
            SpaceW8(),
            InkWell(
              onTap: () {
                Functions.launchUrl(DESIGN_LINK);
              },
              child: AnimatedLineThroughText(
                text: DESIGNED_BY,
                isUnderlinedByDefault: true,
                isUnderlinedOnHover: false,
                hoverColor: white,
                coverColor: black,
                textStyle: style?.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        SpaceH8(),
        DevelopedWithFlutter(),
      ],
    );
  }
}

class DevelopedWithFlutter extends StatelessWidget {
  const DevelopedWithFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? style = textTheme.bodyText1?.copyWith(
      color: accentColor,
      fontSize: Sizes.TEXT_SIZE_14,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          DEVELOPED_WITH_FLUTTER,
          style: style,
        ),
        FlutterLogo(size: 14),
      ],
    );
  }
}
