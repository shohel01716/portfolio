import 'package:portfolio/const/adaptive.dart';
import 'package:portfolio/presentation/widgets/animated_text_slide_box_transition.dart';
import 'package:portfolio/presentation/widgets/content_area.dart';
import 'package:portfolio/const/spaces.dart';
import 'package:portfolio/values/values.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutHeader extends StatelessWidget {
  const AboutHeader({
    Key? key,
    required this.width,
    required this.controller,
  }) : super(key: key);

  final double width;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    double spacing = responsiveSize(
      context,
      width * 0.15,
      width * 0.15,
      medium: width * 0.05,
    );
    double imageWidthLg = responsiveSize(
      context,
      width * 0.3,
      width * 0.3,
      medium: width * 0.4,
    );

    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final double screenHeight = heightOfScreen(context);

        double screenWidth = sizingInformation.screenSize.width;
        final EdgeInsets padding = EdgeInsets.symmetric(
          horizontal: screenWidth * 0.1,
          vertical: screenHeight * 0.1,
        );
        if (screenWidth <= RefinedBreakpoints().tabletSmall) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AboutDescription(
                controller: controller,
                width: widthOfScreen(context),
              ),
              SpaceH30(),
              Container(
                padding: padding,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  child: Image.asset(
                    ImagePath.DEV_SHISHIR,
                    //width: screenWidth,
                  ),
                ),
              ),
            ],
          );
        } else {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ContentArea(
                width: width * 0.55,
                child: AboutDescription(
                  controller: controller,
                  width: width * 0.55,
                ),
              ),
              SizedBox(
                width: spacing,
              ),
              Container(
                color: black,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: imageWidthLg,
                    minWidth: imageWidthLg,
                    maxHeight: assignHeight(context, 0.55),
                  ),
                  child: Image.asset(ImagePath.DEV),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}

class AboutDescription extends StatelessWidget {
  const AboutDescription({
    Key? key,
    required this.controller,
    required this.width,
  }) : super(key: key);

  final AnimationController controller;
  final double width;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? style = textTheme.bodyText1?.copyWith(
      fontSize: responsiveSize(context, 25, 35, medium: 30),
      height: 1.2,
      fontWeight: FontWeight.w200,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedTextSlideBoxTransition(
          controller: controller,
          text: ABOUT_DEV_1,
          width: width,
          maxLines: 2,
          textStyle: style,
        ),
        SpaceH8(),
        AnimatedTextSlideBoxTransition(
          controller: controller,
          text: ABOUT_DEV_2,
          width: width,
          maxLines: 2,
          textStyle: style,
        ),
        SpaceH8(),
        AnimatedTextSlideBoxTransition(
          controller: controller,
          text: ABOUT_DEV_3,
          width: width,
          maxLines: 2,
          textStyle: style,
        ),
      ],
    );
  }
}
