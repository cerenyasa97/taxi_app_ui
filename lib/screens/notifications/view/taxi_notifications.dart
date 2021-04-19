import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/constants/text/text_constants.dart';
import 'package:piton_taxi_app/core/base/view/base_view.dart';
import 'package:piton_taxi_app/core/init/pages_import.dart';
import 'notification_list.dart';
import 'offers_page_view.dart';

class TaxiNotifications extends BaseView {
  @override
  _TaxiNotificationsState createState() => _TaxiNotificationsState();
}

class _TaxiNotificationsState extends BaseState<TaxiNotifications> {
  @override
  String appBarTitle() => TextConstants.MENU_NEWS_OFFERS;

  @override
  Widget body() {
    return ListView(
      children: [
        OffersPageView(),
        NotificationList(),
      ],
    );
  }

  @override
  EdgeInsetsGeometry padding() => context.mediumEdgeInsetsSymmetric;
}
