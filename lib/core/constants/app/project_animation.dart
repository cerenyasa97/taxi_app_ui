import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';

class ProjectAnimation{
  final AnimationController controller;
  Animation<double> splashIconAnimation;

  ProjectAnimation(this.controller)
      : splashIconAnimation = Tween<double>(begin: 0, end: 0.8).animate(CurvedAnimation(parent: controller, curve: Interval(0, 0.25, curve: Curves.ease)));
}