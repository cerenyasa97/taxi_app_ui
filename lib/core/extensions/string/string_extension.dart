import 'package:easy_localization/easy_localization.dart';
import 'package:piton_taxi_app/core/constants/methods/input_formatter.dart';

extension StringLocalization on String{
  String get locale => this.tr();
  String get phoneFormatValue => InputFormatter.instance.phoneFormatter.unmaskText(this);
}