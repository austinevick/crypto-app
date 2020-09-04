import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeInAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeInAnimation({this.delay, this.child});
  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track('opacity').add(
        Duration(seconds: 1),
        Tween(begin: 0.0, end: 1.0),
      ),
      Track('translateX').add(
        Duration(seconds: 1),
        Tween(begin: 50.0, end: 0.5),
      ),
    ]);
    return ControlledAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (_, child, animatedValue) => Opacity(
        opacity: animatedValue['opacity'],
        child: Transform.translate(
          offset: Offset(animatedValue['translateX'], 0),
          child: child,
        ),
      ),
    );
  }
}
