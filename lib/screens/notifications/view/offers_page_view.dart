import 'package:piton_taxi_app/core/extensions/project_context_extension.dart';
import 'package:piton_taxi_app/core/components/transition_indicator_dot.dart';
import 'package:piton_taxi_app/core/constants/dummy_data/dummy_data.dart';
import 'package:piton_taxi_app/core/components/project_image.dart';
import 'package:flutter/material.dart';

class OffersPageView extends StatefulWidget {
  @override
  _OffersPageViewState createState() => _OffersPageViewState();
}

class _OffersPageViewState extends State<OffersPageView> {
  PageController _controller;
  List<String> _offersList;
  ValueNotifier<int> _pageIndex = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _offersList = DummyData.offersList;
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: context.dynamicHeight(7 / 24),
          child: PageView.builder(
            controller: _controller,
            onPageChanged: (pageIndex) => _pageIndex.value = pageIndex,
            itemBuilder: (context, index) =>
                ProjectImage(imagePath: _offersList[index]),
            itemCount: _offersList.length,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _offersList.length,
            (index) => ValueListenableBuilder(
              valueListenable: _pageIndex,
              builder: (context, value, child) => TransitionIndicatorDot(
                currentPageIndex: value,
                currentContainerIndex: index,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
