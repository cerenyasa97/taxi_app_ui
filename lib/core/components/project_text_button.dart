import 'package:flutter/material.dart';

class ProjectTextButton extends StatelessWidget {

  final Widget child;
  final VoidCallback onPressed;

  const ProjectTextButton({Key key, @required this.child, @required this.onPressed}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: child ?? Text("Text Button"),
      onPressed: onPressed ?? () {},
    );
  }
}
