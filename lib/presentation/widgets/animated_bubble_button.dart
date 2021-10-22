import 'package:portfolio/const/spaces.dart';
import 'package:portfolio/values/values.dart';
import 'package:flutter/material.dart';

class CircularButton extends StatefulWidget {
  CircularButton({
    Key? key,
    this.child,
    this.title = '',
    this.titleStyle,
    this.height = 50,
    this.targetWidth = 150,
    this.startBorderRadius = const BorderRadius.all(Radius.circular(80.0)),
    this.curve = Curves.easeIn,
    this.color = black100,
    this.imageColor = accentColor,
    this.offsetAnimation,
    this.duration = const Duration(milliseconds: 300),
    this.onTap,
    this.controller,
    this.controlsOwnAnimation = true,
  }) : super(key: key);

  final String title;
  final TextStyle? titleStyle;
  final double height;
  final double targetWidth;
  final Color color;
  final Color imageColor;
  final Curve curve;
  final Duration duration;
  final Widget? child;
  final BorderRadiusGeometry startBorderRadius;
  final Animation<Offset>? offsetAnimation;
  final GestureTapCallback? onTap;

  bool controlsOwnAnimation;
  final AnimationController? controller;

  @override
  _CircularButtonState createState() => _CircularButtonState();
}

class _CircularButtonState extends State<CircularButton>
    with SingleTickerProviderStateMixin {
  bool _isHovering = false;
  late AnimationController _controller;


  @override
  void initState() {
    _controller = widget.controller ??
        AnimationController(
          vsync: this,
          duration: widget.duration,
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
    TextStyle? buttonStyle = textTheme.bodyText1?.copyWith(
      color: accentColor,
      fontSize: Sizes.TEXT_SIZE_16,
      fontWeight: FontWeight.w500,
    );

    return InkWell(
      hoverColor: Colors.transparent,
      onTap: widget.onTap,
      child: Container(
        width: widget.targetWidth,
        height: widget.height,
        child: Container(
          width: widget.targetWidth,

          height: widget.height,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius:widget.startBorderRadius,
          ),
          child:                   Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: widget.titleStyle ?? buttonStyle,
              ),
              SpaceW8(),
              Image.asset(
                ImagePath.ARROW_RIGHT,
                color: widget.imageColor,
                width: 20,
              ),
            ],
          ),

        )
      ),
    );
  }
}
