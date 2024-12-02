import 'package:chat/components/my_bottombar.dart';
import 'package:flutter/material.dart';
//import 'package:yandex_maps_mapkit/mapkit.dart';
//import 'package:yandex_maps_mapkit/yandex_map.dart';

class SettingsPage extends StatelessWidget{
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),

      bottomNavigationBar: const MyBottomBar(),
    );
  }
}

class MapScreen extends StatelessWidget{
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Expanded(child: Map()),
      ],
    );
  }
}

class Map extends StatelessWidget{
  const Map({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
       // YandexMap(onMapCreated: (MapWindow) => {},),
      ],
    );
  }
}