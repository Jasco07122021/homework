import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AnimationType { opacity, translateY }

class Animations extends StatelessWidget {
  final double delay;
  final Widget child;

  const Animations({Key? key, required this.delay, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<AnimationType>()
      ..add(AnimationType.opacity, Tween(begin: 0.0, end: 1.0),
          Duration(milliseconds: 1000))
      ..add(AnimationType.translateY, Tween(begin: 150.0, end: 0.0),
          Duration(milliseconds: 1000));
    return PlayAnimation<MultiTweenValues<AnimationType>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(AnimationType.opacity),
        child: Transform.translate(
            offset: Offset(0, value.get(AnimationType.translateY)),
            child: child),
      ),
    );
  }
}