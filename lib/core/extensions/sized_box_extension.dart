import 'project_context_extension.dart';
import 'package:flutter/material.dart';

extension SizedBoxExtension on BuildContext {
  SizedBox get lowestSizedBoxHeight => SizedBox(
    height: this.dynamicHeight(1 / 87),
  );

  SizedBox get lowSizedBoxHeight => SizedBox(
    height: this.dynamicHeight(2 / 87),
  );

  SizedBox get mediumSizedBoxHeight => SizedBox(
    height: this.dynamicHeight(5 / 87),
  );

  SizedBox get mediumSizedBoxWidth => SizedBox(
    width: this.dynamicHeight(8 / 87),
  );

  SizedBox get lowSizedBoxWidth => SizedBox(
    width: this.dynamicHeight(2 / 87),
  );
}
