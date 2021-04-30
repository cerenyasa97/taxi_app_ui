import 'package:piton_taxi_app/core/constants/app/constants.dart';
import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/extensions/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/constants/dummy_data/dummy_data.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/core/components/project_text.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/core/init/pages_import.dart';
import 'package:piton_taxi_app/core/init/project_routes.dart';

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
    labelList = [TextConstants.ADDRESSES_HOME, TextConstants.ADDRESSES_WORK] + DummyData.user_1.anotherAddresses.keys.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(8 / 87),
      child: ListView.builder(
        itemBuilder: (context, index) =>
            Padding(
              padding: context.lowestEdgeInsetsHorizontal,
              child: InputChip(
                label: ProjectText(
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
      case TextConstants.ADDRESSES_HOME:
        return Icon(
          Icons.home_outlined,
        );
      case TextConstants.ADDRESSES_WORK:
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
    Navigator.of(context).push(ProjectRoute.generateSlidePageRouteBuilder(address, ProjectConstants.FAST_PAGE_TRANSITION_DURATION));
  }
}
