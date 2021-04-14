import 'package:flutter/material.dart';

// Returns rating stars
class ProjectRatingStars extends StatelessWidget {

  final int value;

  const ProjectRatingStars({Key key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(5, (index) {
          return Icon(
            index < value ? Icons.star : Icons.star_border,
            color: Colors.amber,
          );
        }));
  }
}
