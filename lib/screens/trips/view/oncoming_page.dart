import 'file:///C:/Users/Ceren/Desktop/piton_taxi_app/lib/core/constants/dummy_data/dummy_data.dart';
import 'package:flutter/material.dart';
import 'trip_card.dart';

class OncomingPage extends StatefulWidget{
  @override
  _OncomingPageState createState() => _OncomingPageState();
}

// Kullanılan mixin ile servis işlemlerini gerçekleştiren initState metodu sadece tab ilk açıldığında tetiklenir ve tablar arası geçişte tekrar tetiklenmez.
// Bu sayede ekranın yeniden yüklenmesi durumu gözlenmez.
class _OncomingPageState extends State<OncomingPage> with AutomaticKeepAliveClientMixin<OncomingPage>{
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => TripCard(trip: DummyData.oncoming[index]),
      itemCount: DummyData.oncoming.length,
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
