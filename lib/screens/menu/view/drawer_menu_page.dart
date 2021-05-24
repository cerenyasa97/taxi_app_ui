import 'package:piton_taxi_app/core/components/button/project_circular_button.dart';
import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/screens/home/view/homepage.dart';
import 'menu_listview.dart';
import 'menu_background.dart';
import 'profile_detail.dart';

class DrawerMenu extends StatefulWidget {

  final Widget child;

  DrawerMenu({Key key, this.child}) : super(key: key);

  static _DrawerMenuState of(BuildContext context) =>
      context.findAncestorStateOfType<_DrawerMenuState>();

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu>
    with SingleTickerProviderStateMixin {

  AnimationController _controller;
  static double _maxWidth;

  //static double dragLeftStartVal;
  //static bool shouldDrag = false;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void close() => _controller.reverse();

  void open() => _controller.forward();

  void toggle() => _controller.isCompleted ? close() : open();

  @override
  Widget build(BuildContext context) {
    _maxWidth = context.dynamicWidth(220);
    //dragLeftStartVal = _maxWidth - context.dynamicWidth(20);
    final menuButton = ProjectCircularButton(
        color: Colors.white,
        onPressed: () => toggle(),
        child: Icon(Icons.menu));
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => Stack(
          children: [
            MenuBackground(),
            Positioned(
              child: ProfileDetail(
                onPressed: close,
              ),
              top: context.dynamicHeight(60),
              left: context.dynamicWidth(25),
              right: context.dynamicWidth(25),
            ), //close()
            MenuListView(),
            Transform(
              alignment: Alignment.centerLeft,
              transform: Matrix4.identity()
                ..translate(_maxWidth * _controller.value)
                ..scale(1 - (_controller.value * 0.4)),
              child: GestureDetector(
                onTap: () => debugPrint("ontapped"),
                child: widget.child ?? HomePage(
                  menuButton: menuButton,
                ),
              )
            ),
          ],
        ),
      ),
    );
  }

}
/*
onHorizontalDragStart: _onDragStart,
        onHorizontalDragUpdate: _onDragUpdate,
        onHorizontalDragEnd: _onDragEnd,


  // Allows dragging to work from right to left only
  void _onDragStart(DragStartDetails details) {
    bool isDraggingFromRight = !_controller.isDismissed &&
        details.globalPosition.dx > dragLeftStartVal;
    shouldDrag = isDraggingFromRight;
  }

  // Changes the x coordinate as you drag the child widget
  void _onDragUpdate(DragUpdateDetails details) {
    if (shouldDrag) {
      double delta = details.primaryDelta / _maxWidth;
      _controller.value += delta;
    }
  }

  // Ignores if the menu drag speed is less than a certain value
  void _onDragEnd(DragEndDetails details) {
    double _kMinFlagVelocity = 365;
    double dragVelocity = details.velocity.pixelsPerSecond.dx.abs();
    if (dragVelocity >= _kMinFlagVelocity && shouldDrag) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;
      _controller.fling(velocity: visualVelocity);
    } else {
      if (_controller.value < 0.5) close();
    }
  }
 */