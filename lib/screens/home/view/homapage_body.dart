import 'package:piton_taxi_app/core/extensions/edge_insets_extension.dart';
import 'package:flutter/material.dart';
import 'where_from_to.dart';
import 'top_menu.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: context.largeEdgeInsetsSymmetric,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: TopMenu(),
              flex: 5,
            ),
            Flexible(
              flex: 1,
              child: Container(),
            ),
            Flexible(
              child: WhereFromTo(),
              flex: 13,
            ),
            Flexible(
              child: Container(),
              flex: 54,
            ),
          ],
        ));
  }
}
