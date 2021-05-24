import 'package:piton_taxi_app/core/init/navigation/pages_import.dart';

class ProjectShowDialog{
  static show(BuildContext context, var dialog){
    return showDialog(context: context, builder: (context) => dialog);
  }
}