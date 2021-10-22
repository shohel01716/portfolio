import 'package:portfolio/const/adaptive.dart';
import 'package:portfolio/core/utils/functions.dart';
import 'package:portfolio/presentation/widgets/animated_line_through_text.dart';
import 'package:portfolio/presentation/widgets/animated_positioned_text.dart';
import 'package:portfolio/presentation/widgets/animated_text_slide_box_transition.dart';
import 'package:portfolio/const/spaces.dart';
import 'package:portfolio/values/values.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class OthersProjects extends StatefulWidget {
  const OthersProjects({Key? key}) : super(key: key);

  @override
  _OthersProjectsState createState() => _OthersProjectsState();
}

class _OthersProjectsState extends State<OthersProjects>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? titleStyle = textTheme.subtitle1?.copyWith(
      color: black,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_20,
        Sizes.TEXT_SIZE_30,
      ),
    );
    TextStyle? bodyText1Style = textTheme.bodyText1?.copyWith(
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_16,
        Sizes.TEXT_SIZE_18,
      ),
      color: grey750,
      fontWeight: FontWeight.w400,
      height: 2.0,
      // letterSpacing: 2,
    );

    return VisibilityDetector(
      key: Key('noteworthy-projects'),
      onVisibilityChanged: (visibilityInfo) {
        double visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage > 25) {
          _controller.forward();
        }
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedTextSlideBoxTransition(
              heightFactor: 1.5,
              controller: _controller,
              text: OTHERS_PROJECTS,
              textStyle: titleStyle,
            ),
            SpaceH16(),
            AnimatedPositionedText(
              controller: CurvedAnimation(
                parent: _controller,
                curve: Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
              ),
              text: OTHERS_PROJECTS_DESC,
              textStyle: bodyText1Style,
            ),
            SpaceH40(),
            ...othersProjects(Data.othersProjects),
          ],
        ),
      ),
    );
  }

  List<Widget> othersProjects(List<OthersProjectDetails> data) {
    List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      items.add(
        OthersProjectItem(
          controller: _controller,
          number: index + 1 > 9 ? "${index + 1}" : "0${index + 1}",
          projectName: data[index].projectName,
          onProjectNameTap: data[index].isLive
              ? () {
                  data[index].isWeb
                      ? Functions.launchUrl(data[index].webUrl!)
                      : Functions.launchUrl(data[index].playStoreUrl!);
                }
              : null,
        ),
      );
      items.add(SpaceH40());
    }

    return items;
  }
}

class OthersProjectItem extends StatelessWidget {
  const OthersProjectItem({
    Key? key,
    required this.number,
    required this.projectName,
    required this.controller,
    this.numberStyle,
    this.projectNameStyle,
    this.onProjectNameTap,
  }) : super(key: key);

  final String number;
  final String projectName;
  final AnimationController controller;
  final TextStyle? numberStyle;
  final TextStyle? projectNameStyle;
  final GestureTapCallback? onProjectNameTap;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? defaultNumberStyle = textTheme.subtitle1?.copyWith(
      fontSize: Sizes.TEXT_SIZE_16,
      color: grey550,
      fontWeight: FontWeight.w400,
    );
    TextStyle? defaultSourceStyle = textTheme.subtitle1?.copyWith(
      fontSize: Sizes.TEXT_SIZE_16,
      color: grey700,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.underline,
    );
    TextStyle? defaultProjectNameStyle = textTheme.subtitle1?.copyWith(
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_16,
        Sizes.TEXT_SIZE_20,
        small: Sizes.TEXT_SIZE_18,
      ),
      color: black,
      fontWeight: FontWeight.w500,
    );
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedTextSlideBoxTransition(
            
            controller: controller,
            text: number,
            textStyle: numberStyle ?? defaultNumberStyle,
          ),
          SpaceW20(),
          Flexible(
            child: AnimatedLineThroughText(
              maxLines: 3,
              width: assignWidth(context, 0.5),
              hasSlideBoxAnimation: true,
              controller: controller,
              text: projectName,
              onTap: onProjectNameTap,
              textStyle: projectNameStyle ?? defaultProjectNameStyle,
              isUnderlinedOnHover: false,
              isUnderlinedByDefault: false,
            ),
          ),
        ],
      ),
    );
  }
}
