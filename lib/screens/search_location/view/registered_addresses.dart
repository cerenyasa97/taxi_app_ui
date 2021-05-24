import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/extensions/context/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/constants/dummy_data/dummy_data.dart';
import 'package:piton_taxi_app/core/components/text/project_text_locale.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/core/init/navigation/navigation_service.dart';
import 'package:piton_taxi_app/core/init/navigation/pages_import.dart';

class RegisteredAddresses extends StatefulWidget {

  final GlobalKey<SearchLocationState> searchLocationKey;

  const RegisteredAddresses({Key key, this.searchLocationKey}) : super(key: key);

  @override
  _RegisteredAddressesState createState() => _RegisteredAddressesState();
}

class _RegisteredAddressesState extends State<RegisteredAddresses> {
  List<String> labelList = [];

  @override
  void initState() {
    super.initState();
    labelList = [LocaleKeys.addresses_homeLabel, LocaleKeys.addresses_workLabel] + DummyData.user_1.anotherAddresses.keys.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(80),
      child: ListView.builder(
        itemBuilder: (context, index) =>
            Padding(
              padding: context.lowestEdgeInsetsHorizontal,
              child: InputChip(
                label: ProjectTextLocale(
                  text: labelList[index],
                ),
                avatar: _getAvatar(labelList[index]),
                onPressed: () => _selectedWhichAddress(index),
              ),
            ),
        itemCount: labelList.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  _getAvatar(String e) {
    switch (e) {
      case LocaleKeys.addresses_homeLabel:
        return Icon(
          Icons.home_outlined,
        );
      case LocaleKeys.addresses_workLabel:
        return Icon(
          Icons.work_outline,
        );
      default:
        return Icon(Icons.location_on_outlined);
    }
  }

  _selectedWhichAddress(int index) {
    switch (index) {
      case 0:
        if(DummyData.user_1.homeAddress == null) {
          _navigatorAddAddress(Pages.CHANGE_HOME_ADDRESS);
        }else{
          widget.searchLocationKey.currentState.controller.text = DummyData.user_1.homeAddress.name;
          widget.searchLocationKey.currentState.location = DummyData.user_1.homeAddress;
        }
        break;
      case 1:
        if(DummyData.user_1.workAddress == null) {
          _navigatorAddAddress(Pages.CHANGE_WORK_ADDRESS);
        }else{
          widget.searchLocationKey.currentState.controller.text = DummyData.user_1.workAddress.name;
          widget.searchLocationKey.currentState.location = DummyData.user_1.workAddress;
        }
        break;
      default:
        widget.searchLocationKey.currentState.controller.text = DummyData.user_1.anotherAddresses.values.toList()[index - 2].name;
        widget.searchLocationKey.currentState.location = DummyData.user_1.anotherAddresses.values.toList()[index - 2];
        break;
    }
  }

  _navigatorAddAddress(Pages address) {
    NavigationService.instance.navigatorPushSlidePage(context, address);
  }
}
