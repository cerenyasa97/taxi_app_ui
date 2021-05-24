import 'project_context_extension.dart';
import 'package:flutter/material.dart';

extension SizedBoxExtension on BuildContext {
  SizedBox get lowest0SizedBoxHeight => SizedBox(
    height: this.dynamicHeight(3),
  );

  SizedBox get lowestSizedBoxHeight => SizedBox(
    height: this.dynamicHeight(10),
  );

  SizedBox get lowSizedBoxHeight => SizedBox(
    height: this.dynamicHeight(20),
  );

  SizedBox get mediumSizedBoxHeight => SizedBox(
    height: this.dynamicHeight(50),
  );

  SizedBox get heightSizedBoxHeight => SizedBox(
    height: this.dynamicHeight(90),
  );

  SizedBox get mediumSizedBoxWidth => SizedBox(
    width: this.dynamicWidth(80),
  );

  SizedBox get lowSizedBoxWidth => SizedBox(
    width: this.dynamicWidth(20),
  );

  SizedBox get lowestSizedBoxWidth => SizedBox(
    width: this.dynamicWidth(10),
  );
}
