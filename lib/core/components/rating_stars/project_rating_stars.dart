import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final void Function(int) onChanged;
  final int value;
  final IconData filledStar;
  final IconData unfilledStar;
  final double size;
  final Color color;
  final int marginFactor;

  const StarRating({
    Key key,
    @required this.onChanged,
    this.value = 0,
    this.filledStar,
    this.unfilledStar,
    this.color = Colors.orange,
    this.size = 10,
    this.marginFactor = 10,
  })  : assert(value != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return RawMaterialButton(
          child: Icon(
            index < value
                ? filledStar ?? Icons.star
                : unfilledStar ?? Icons.star_border,
            color: color,
            size: size,
          ),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: CircleBorder(),
          constraints: BoxConstraints.expand(
              width: size - size / marginFactor, height: size),
          padding: EdgeInsets.zero,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onPressed: onChanged != null
              ? () {
            onChanged(value == index + 1 ? index : index + 1);
          }
              : null,
        );
      }),
    );
  }
}
