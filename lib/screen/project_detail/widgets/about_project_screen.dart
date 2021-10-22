import 'package:portfolio/const/adaptive.dart';
import 'package:portfolio/core/utils/functions.dart';
import 'package:portfolio/presentation/widgets/animated_bubble_button.dart';
import 'package:portfolio/presentation/widgets/animated_positioned_text.dart';
import 'package:portfolio/presentation/widgets/animated_positioned_widget.dart';
import 'package:portfolio/presentation/widgets/animated_text_slide_box_transition.dart';
import 'package:portfolio/presentation/widgets/empty.dart';
import 'package:portfolio/presentation/widgets/project_item.dart';
import 'package:portfolio/const/spaces.dart';
import 'package:portfolio/values/values.dart';
import 'package:flutter/material.dart';

List<String> titles = [
  PLATFORM,
  CATEGORY,
  AUTHOR,
  DESIGNER,
  TECHNOLOGY_USED,
];

class Aboutproject extends StatefulWidget {
  const Aboutproject({
    Key? key,
    required this.controller,
    required this.projectDataController,
    required this.projectData,
    required this.width,
  }) : super(key: key);

  final AnimationController controller;
  final AnimationController projectDataController;
  final ProjectItemData projectData;
  final double width;

  @override
  _AboutprojectState createState() => _AboutprojectState();
}

class _AboutprojectState extends State<Aboutproject> {
  @override
  void initState() {
    super.initState();

    widget.controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.projectDataController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double googlePlayButtonWidth = 150;
    double targetWidth = responsiveSize(context, 118, 150, medium: 150);
    double initialWidth = responsiveSize(context, 36, 50, medium: 50);
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? bodyTextStyle = textTheme.bodyText1?.copyWith(
      fontSize: Sizes.TEXT_SIZE_18,
      color: grey750,
      fontWeight: FontWeight.w400,
      height: 2.0,
    );
    double projectDataWidth = responsiveSize(
      context,
      widget.width,
      widget.width * 0.55,
      medium: widget.width * 0.75,
    );
    double projectDataSpacing =
        responsiveSize(context, widget.width * 0.1, 48, medium: 36);
    double widthOfProjectItem = (projectDataWidth - (projectDataSpacing)) / 2;
    BorderRadiusGeometry borderRadius = BorderRadius.all(
      Radius.circular(100.0),
    );
    TextStyle? buttonStyle = textTheme.bodyText1?.copyWith(
      color: black,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_14,
        Sizes.TEXT_SIZE_16,
        small: Sizes.TEXT_SIZE_15,
      ),
      fontWeight: FontWeight.w500,
    );
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedTextSlideBoxTransition(
            controller: widget.controller,
            text: ABOUT_PROJECT,
            coverColor: white,
            textStyle: textTheme.headline4?.copyWith(
              fontSize: Sizes.TEXT_SIZE_48,
            ),
          ),
          SpaceH40(),
          AnimatedPositionedText(
            controller: CurvedAnimation(
              parent: widget.controller,
              curve: Animations.textSlideInCurve,
            ),
            width: widget.width * 0.7,
            maxLines: 10,
            text: widget.projectData.portfolioDescription,
            textStyle: bodyTextStyle,
          ),
           SpaceH20(),
          Container(
            width: projectDataWidth,
            child: Wrap(
              spacing: projectDataSpacing,
              runSpacing: responsiveSize(context, 30, 40),
              children: [
                ProjectData(
                  controller: widget.projectDataController,
                  width: widthOfProjectItem,
                  title: PLATFORM,
                  subtitle: widget.projectData.platform,
                ),
                ProjectData(
                  controller: widget.projectDataController,
                  width: widthOfProjectItem,
                  title: CATEGORY,
                  subtitle: widget.projectData.category,
                ),
                ProjectData(
                  controller: widget.projectDataController,
                  width: widthOfProjectItem,
                  title: AUTHOR,
                  subtitle: MY_NAME,
                ),
              ],
            ),
          ),
          widget.projectData.designer != null ? SpaceH30() : Empty(),
          widget.projectData.designer != null
              ? ProjectData(
                  controller: widget.projectDataController,
                  title: DESIGNER,
                  subtitle: widget.projectData.designer!,
                )
              : Empty(),
          widget.projectData.technologyUsed != null ? SpaceH30() : Empty(),
          widget.projectData.technologyUsed != null
              ? ProjectData(
                  controller: widget.projectDataController,
                  title: TECHNOLOGY_USED,
                  subtitle: widget.projectData.technologyUsed!,
                )
              : Empty(),
          SpaceH30(),
          Row(
            children: [
              widget.projectData.isLive
                  ? AnimatedPositionedWidget(
                      controller: CurvedAnimation(
                        parent: widget.projectDataController,
                        curve: Animations.textSlideInCurve,
                      ),
                       width: targetWidth,
                      height: initialWidth,
                      child: CircularButton(
                        title: LAUNCH_APP,
                        color: grey100,
                        imageColor: black,
                        startBorderRadius: borderRadius,

                        height: initialWidth,
                        targetWidth: targetWidth,
                        titleStyle: buttonStyle,
                        onTap: () {
                          Functions.launchUrl(widget.projectData.webUrl);
                        },

                      ),
                    )
                  : Empty(),
              widget.projectData.isLive ? Spacer() : Empty(),
            ],
          ),
          widget.projectData.isPublic || widget.projectData.isLive
              ? SpaceH30()
              : Empty(),
          widget.projectData.isOnPlayStore
              ? InkWell(
                  onTap: () {
                    Functions.launchUrl(widget.projectData.playStoreUrl);
                  },
                  child: AnimatedPositionedWidget(
                    controller: CurvedAnimation(
                      parent: widget.projectDataController,
                      curve: Animations.textSlideInCurve,
                    ),
                    width: googlePlayButtonWidth,
                    height: 50,
                    child: Image.asset(
                      ImagePath.GOOGLE_PLAY,
                      width: googlePlayButtonWidth,
                      // fit: BoxFit.fitHeight,
                    ),
                  ),
                )
              : Empty(),
        ],
      ),
    );
  }
}

class ProjectData extends StatelessWidget {
  const ProjectData({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.controller,
    this.width = double.infinity,
    this.titleStyle,
    this.subtitleStyle,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final double width;
  final AnimationController controller;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    TextStyle? defaultTitleStyle = textTheme.subtitle1?.copyWith(
      color: black,
      fontSize: 17,
    );
    TextStyle? defaultSubtitleStyle = textTheme.bodyText1?.copyWith(
      fontSize: 15,
    );

    return Container(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedTextSlideBoxTransition(
            width: width,
            maxLines: 2,
            coverColor: white,
            controller: controller,
            text: title,
            textStyle: titleStyle ?? defaultTitleStyle,
          ),
          SpaceH12(),
          AnimatedPositionedText(
            width: width,
            maxLines: 2,
            controller: CurvedAnimation(
              parent: controller,
              curve: Animations.textSlideInCurve,
            ),
            text: subtitle,
            textStyle: subtitleStyle ?? defaultSubtitleStyle,
          ),
        ],
      ),
    );
  }
}
