import 'package:piton_taxi_app/core/components/project_button_bar.dart';
import 'package:piton_taxi_app/core/components/project_text_button.dart';
import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/components/project_text_field.dart';
import 'package:piton_taxi_app/core/extensions/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/constants/dummy_data/dummy_data.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/core/constants/app/constants.dart';
import 'package:piton_taxi_app/core/constants/enums/routes.dart';
import 'package:piton_taxi_app/core/init/project_routes.dart';
import 'package:piton_taxi_app/widgets/custom_list_tile.dart';
import 'package:piton_taxi_app/core/base/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/widgets/next_page.dart';

class UserAddress extends BaseView {
  @override
  _UserAddressState createState() => _UserAddressState();
}

class _UserAddressState extends BaseState<UserAddress> {
  String anotherAddressTitle;

  @override
  String appBarTitle() => TextConstants.ADDRESSES_TITLE;

  @override
  Widget body() {
    return Column(
      children: [
        CustomListTile(
          leadingIcon: _getIcon(Icons.home),
          title: TextConstants.ADDRESSES_HOME,
          subtitle: DummyData.user_1.homeAddress != null
              ? DummyData.user_1.homeAddress.name
              : " ",
          onTap: () => Navigator.of(context).push(
              ProjectRoute.generateSlidePageRouteBuilder(
                  Pages.CHANGE_HOME_ADDRESS,
                  ProjectConstants.FAST_PAGE_TRANSITION_DURATION)),
        ),
        CustomListTile(
          leadingIcon: _getIcon(Icons.home_work),
          title: TextConstants.ADDRESSES_WORK,
          subtitle: DummyData.user_1.workAddress != null
              ? DummyData.user_1.workAddress.name
              : " ",
          onTap: () => Navigator.of(context).push(
              ProjectRoute.generateSlidePageRouteBuilder(
                  Pages.CHANGE_WORK_ADDRESS,
                  ProjectConstants.FAST_PAGE_TRANSITION_DURATION)),
        ),
        Visibility(
          visible: DummyData.user_1.anotherAddresses.isNotEmpty,
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final keyList =
              DummyData.user_1.anotherAddresses.keys.toList();
              return Dismissible(
                onDismissed: (direction) {
                  if (direction == DismissDirection.startToEnd) {
                    DummyData.user_1.anotherAddresses
                        .remove(keyList[index]);
                  }
                },
                key: Key(keyList[index]),
                child: CustomListTile(
                  leadingIcon: _getIcon(Icons.location_on),
                  title: keyList[index],
                  subtitle: DummyData
                      .user_1.anotherAddresses[keyList[index]].name,
                  onTap: () => Navigator.of(context).push(
                      ProjectRoute.generateSlidePageRouteBuilder(
                          Pages.CHANGE_WORK_ADDRESS,
                          ProjectConstants.FAST_PAGE_TRANSITION_DURATION)),
                ),
              );
            },
            itemCount: DummyData.user_1.anotherAddresses.length,
          ),
        ),
        CustomListTile(
            leadingIcon: _getIcon(Icons.location_on),
            title: TextConstants.ADDRESSES_ANOTHER,
            onTap: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(context.dynamicWidth(30/412)))),
                      title: Text(TextConstants.NEW_ADDRESS_TITLE),
                      content: ProjectTextField(
                        onChanged: (text) {
                          anotherAddressTitle = text;
                        },
                      ),
                      actionsPadding: context.lowestEdgeInsetsHorizontal,
                      actions: [
                        NextPageButton(
                          width: 45,
                          onTap: () => Navigator.of(context)
                              .pushReplacement(
                                  ProjectRoute.generateSlidePageRouteBuilder(
                                      Pages.ADD_ANOTHER_ADDRESS,
                                      ProjectConstants
                                          .FAST_PAGE_TRANSITION_DURATION,
                                      variable: anotherAddressTitle)),
                        )
                      ],
                    )))
      ],
    );
  }

  _getIcon(IconData data) {
    return Icon(
      data,
      size: 32,
      color: Colors.black87,
    );
  }

  @override
  EdgeInsetsGeometry padding() => context.lowEdgeInsetsSymmetric;
}
/*
DummyData.user_1.anotherAddresses.isEmpty
            ? Container()
            : ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final keyList =
                      DummyData.user_1.anotherAddresses.keys.toList();
                  return Dismissible(
                    onDismissed: (direction) {
                      if (direction == DismissDirection.startToEnd) {
                        DummyData.user_1.anotherAddresses
                            .remove(keyList[index]);
                      }
                    },
                    key: Key(keyList[index]),
                    child: CustomListTile(
                      leadingIcon: _getIcon(Icons.location_on),
                      title: keyList[index],
                      subtitle: DummyData
                          .user_1.anotherAddresses[keyList[index]].name,
                      onTap: () => Navigator.of(context).push(
                          ProjectRoute.generateSlidePageRouteBuilder(
                              Pages.CHANGE_WORK_ADDRESS,
                              ProjectConstants.FAST_PAGE_TRANSITION_DURATION)),
                    ),
                  );
                },
                itemCount: DummyData.user_1.anotherAddresses.length,
              ),
 */
