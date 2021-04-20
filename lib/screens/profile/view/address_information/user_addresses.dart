import 'package:piton_taxi_app/core/constants/app/constants.dart';
import 'package:piton_taxi_app/core/constants/dummy_data/dummy_data.dart';
import 'package:piton_taxi_app/core/constants/enums/routes.dart';
import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/core/init/project_routes.dart';
import 'package:piton_taxi_app/widgets/custom_list_tile.dart';
import 'package:piton_taxi_app/core/base/view/base_view.dart';
import 'package:flutter/material.dart';
/*
import 'change_home_address.dart';
import 'change_work_address.dart';
import 'add_another_address.dart';*/

class UserAddress extends BaseView {
  @override
  _UserAddressState createState() => _UserAddressState();
}

class _UserAddressState extends BaseState<UserAddress> {
  @override
  String appBarTitle() => TextConstants.ADDRESSES_TITLE;

  @override
  Widget body() {
    return Column(
      children: [
        CustomListTile(
          leadingIcon: _getIcon(Icons.home),
          title: TextConstants.ADDRESSES_HOME,
          subtitle: DummyData.user_1.homeAddress ?? " ",
          onTap: () => Navigator.of(context).push(
              ProjectRoute.generateSlidePageRouteBuilder(
                  Pages.CHANGE_HOME_ADDRESS,
                  ProjectConstants.FAST_PAGE_TRANSITION_DURATION)),
        ),
        CustomListTile(
          leadingIcon: _getIcon(Icons.home_work),
          title: TextConstants.ADDRESSES_WORK,
          subtitle: DummyData.user_1.workAddress ?? " ",
          onTap: () => Navigator.of(context).push(
              ProjectRoute.generateSlidePageRouteBuilder(
                  Pages.CHANGE_WORK_ADDRESS,
                  ProjectConstants.FAST_PAGE_TRANSITION_DURATION)),
        ),
        DummyData.user_1.anotherAddresses.isEmpty ? Container() : ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final keyList = DummyData.user_1.anotherAddresses.keys.toList();
            return CustomListTile(
              leadingIcon: _getIcon(Icons.location_on),
              title: keyList[index],
              subtitle: DummyData.user_1.anotherAddresses[keyList[index]],
              onTap: () => Navigator.of(context).push(
                  ProjectRoute.generateSlidePageRouteBuilder(
                      Pages.CHANGE_WORK_ADDRESS,
                      ProjectConstants.FAST_PAGE_TRANSITION_DURATION)),
            );
          },
          itemCount: DummyData.user_1.anotherAddresses.length,
        ),
        CustomListTile(
          leadingIcon: _getIcon(Icons.location_on),
          title: TextConstants.ADDRESSES_ANOTHER,
          onTap: () => Navigator.of(context).push(
              ProjectRoute.generateSlidePageRouteBuilder(
                  Pages.ADD_ANOTHER_ADDRESS,
                  ProjectConstants.FAST_PAGE_TRANSITION_DURATION)),
        )
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

/*
  _getPage(String title) {
    switch(title){
      case TextConstants.ADDRESSES_HOME:
        return Pages.CHANGE_HOME_ADDRESS;
      case TextConstants.ADDRESSES_WORK:
        return Pages.CHANGE_WORK_ADDRESS;
      case TextConstants.ADDRESSES_ANOTHER:
        return Pages.ADD_ANOTHER_ADDRESS;
    }
  }

  _navigateOnTap(BuildContext context, String title) {
    Navigator.of(context).push(ProjectRoute.generateSlidePageRouteBuilder(_getPage(title), ProjectConstants.FAST_PAGE_TRANSITION_DURATION));
  }*/
}
