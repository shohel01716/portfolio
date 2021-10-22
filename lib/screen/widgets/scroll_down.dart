import 'package:portfolio/const/spaces.dart';
import 'package:portfolio/values/values.dart';
import 'package:flutter/material.dart';

class ScrollDownButton extends StatelessWidget {
  const ScrollDownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RotatedBox(
          quarterTurns: 1,
          child: Text(
            SCROLL_DOWN.toUpperCase(),
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  fontSize: 12,
                  letterSpacing: 1.7,
                ),
          ),
        ),
        SpaceH16(),
        Image.asset(
          ImagePath.ARROW_DOWN,
          height: 24,
        ),
      ],
    );
  }
}
