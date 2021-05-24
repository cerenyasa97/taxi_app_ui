import 'package:piton_taxi_app/core/components/text_field/project_text_field.dart';
import 'package:piton_taxi_app/core/extensions/context/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/constants/dummy_data/dummy_data.dart';
import 'package:piton_taxi_app/core/extensions/string/string_extension.dart';
import 'package:piton_taxi_app/core/constants/app/constants.dart';
import 'package:piton_taxi_app/core/constants/enums/routes.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/core/init/navigation/navigation_service.dart';
import 'package:piton_taxi_app/core/init/navigation/project_routes.dart';
import 'package:piton_taxi_app/widgets/list_tile/custom_list_tile.dart';
import 'package:piton_taxi_app/core/base/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/widgets/buttons/next_page.dart';

class UserAddress extends BaseView {
  @override
  _UserAddressState createState() => _UserAddressState();
}

class _UserAddressState extends BaseState<UserAddress> {
  String anotherAddressTitle;

  @override
  String appBarTitle() => LocaleKeys.profile_addressInformation_addressesLabel;

  @override
  Widget body() {
    return Column(
      children: [
        CustomListTile(
          leadingIcon: _getIcon(Icons.home),
          title: LocaleKeys.addresses_homeLabel,
          subtitle: DummyData.user_1.homeAddress != null
              ? DummyData.user_1.homeAddress.name
              : " ",
          onTap: () => NavigationService.instance
              .navigatorPushSlidePage(context, Pages.CHANGE_HOME_ADDRESS),
        ),
        CustomListTile(
          leadingIcon: _getIcon(Icons.home_work),
          title: LocaleKeys.addresses_workLabel,
          subtitle: DummyData.user_1.workAddress != null
              ? DummyData.user_1.workAddress.name
              : " ",
          onTap: () => NavigationService.instance
              .navigatorPushSlidePage(context, Pages.CHANGE_WORK_ADDRESS),
        ),
        Visibility(
          visible: DummyData.user_1.anotherAddresses.isNotEmpty,
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final keyList = DummyData.user_1.anotherAddresses.keys.toList();
              return Dismissible(
                onDismissed: (direction) {
                  if (direction == DismissDirection.startToEnd) {
                    DummyData.user_1.anotherAddresses.remove(keyList[index]);
                  }
                },
                key: Key(keyList[index]),
                child: CustomListTile(
                  leadingIcon: _getIcon(Icons.location_on),
                  title: keyList[index],
                  subtitle:
                      DummyData.user_1.anotherAddresses[keyList[index]].name,
                  onTap: () => NavigationService.instance
                      .navigatorPushSlidePage(
                          context, Pages.CHANGE_WORK_ADDRESS),
                ),
              );
            },
            itemCount: DummyData.user_1.anotherAddresses.length,
          ),
        ),
        CustomListTile(
            leadingIcon: _getIcon(Icons.location_on),
            title: LocaleKeys.addresses_addAnotherLabel_title,
            onTap: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(ProjectConstants.ALERT_DIALOG_RADIUS))),
                      title: Text(
                        LocaleKeys.addresses_addAnotherLabel_title.locale,
                      ),
                      content: ProjectTextField(
                        onChanged: (text) {
                          anotherAddressTitle = text;
                        },
                      ),
                      actionsPadding: context.lowestEdgeInsetsHorizontal,
                      actions: [
                        NextPageButton(
                          onTap: () => Navigator.of(context).pushReplacement(
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
