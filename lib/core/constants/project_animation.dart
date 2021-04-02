import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';

class ProjectAnimation{
  final AnimationController controller;
  Animation<double> splashIconAnimation;
  Tween<double> pageTransitionAnimation;
  Animation<Offset> slideTaxiAnimation;

  ProjectAnimation(this.controller)
      : splashIconAnimation = Tween<double>(begin: 0, end: 0.8).animate(CurvedAnimation(parent: controller, curve: Interval(0, 0.25, curve: Curves.ease)))
      , pageTransitionAnimation = Tween<double>(begin: 0, end: 1),
        slideTaxiAnimation = Tween<Offset>(begin: Offset(0.004,1), end: Offset(0.004, 0.4)).animate(controller);
}