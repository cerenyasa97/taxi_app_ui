import 'package:piton_taxi_app/core/components/container/white_container_with_shadow.dart';
import 'package:piton_taxi_app/core/extensions/context/project_context_extension.dart';
import 'package:piton_taxi_app/core/extensions/context/edge_insets_extension.dart';
import 'package:piton_taxi_app/core/init/languages/locale_keys.g.dart';
import 'package:piton_taxi_app/core/init/navigation/pages_import.dart';
import 'package:piton_taxi_app/core/base/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:piton_taxi_app/widgets/general/wallet_detail.dart';

class Wallet extends BaseView {
  Wallet({Key key}) : super(key: key);

  @override
  _PaymentPointsState createState() => _PaymentPointsState();
}

class _PaymentPointsState extends BaseState<Wallet> {
  @override
  String appBarTitle() => LocaleKeys.payment_walletLabel;

  @override
  Widget body() {
    return Column(
      children: [
        WhiteContainerWithShadow(
          width: context.dynamicWidth(360),
          height: context.dynamicHeight(200),
          child: WalletDetail(),
        ),
      ],
    );
  }

  @override
  EdgeInsetsGeometry padding() => context.mediumEdgeInsetsSymmetric;

  @override
  FloatingActionButton floatingActionButton() => FloatingActionButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      );
}

/*
class WidgetDesignConstants {
  static WidgetDesignConstants _instance;
  static WidgetDesignConstants get instance => _instance ??= WidgetDesignConstants._initialize();

  final double cardElevation = 4.0;
  final double listCardItemElevation = 2.0;
  final double formPadding = 10;
  final EdgeInsets bodyPaddingOnly = EdgeInsets.only(left: 10, right: 10);
  final EdgeInsets bodyPaddingAll = EdgeInsets.all(10);

  final EdgeInsets cardsPadding =  EdgeInsets.symmetric(horizontal: 5, vertical: 5);
  final EdgeInsets cardsMargin = EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 0);

  final BorderRadius defaultBorderRadius = BorderRadius.all(Radius.circular(8.0));
  final double textFormFieldElevation = 4.0;

  final double bottomSheetBorderRadius = 24;

  WidgetDesignConstants._initialize();
}
 */