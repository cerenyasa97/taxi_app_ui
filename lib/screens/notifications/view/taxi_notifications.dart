import 'package:piton_taxi_app/core/extensions/context/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/base/view/base_view.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/core/init/navigation/pages_import.dart';
import 'notification_list.dart';
import 'offers_page_view.dart';

class TaxiNotifications extends BaseView {
  @override
  _TaxiNotificationsState createState() => _TaxiNotificationsState();
}

class _TaxiNotificationsState extends BaseState<TaxiNotifications> {
  @override
  String appBarTitle() => LocaleKeys.notificationsOffersTitle;

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
