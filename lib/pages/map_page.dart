import 'package:chat/components/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:yandex_maps_mapkit/image.dart' as imgY;

import 'package:yandex_maps_mapkit/mapkit.dart';
import 'package:yandex_maps_mapkit/yandex_map.dart';

import 'package:yandex_maps_mapkit/mapkit_factory.dart';

class MyMapPage extends StatefulWidget {
  const MyMapPage({super.key});

  
  @override
  State<MyMapPage> createState() => _MyMapPageState();
}

  
class _MyMapPageState extends State<MyMapPage> {
  
  late final list = MapObjectTapListenerImpl();
  MapWindow? _mapWindow;


  void _maps(MapWindow map_){

     const AlertDialog(title: Text("123"));
   
    _mapWindow = map_;

    _mapWindow?.map.mapType = MapType.Map;
    _mapWindow?.map.set2DMode(true);

    var prov = imgY.ImageProvider.fromImageProvider(const AssetImage("assets/bigMark.png"));

    _mapWindow?.map.move(
      const CameraPosition(
          Point(latitude: 55.751225, longitude: 37.62954),
          zoom: 17.0,
          azimuth: 0,//150.0,
          tilt: 0//30.0
        )
    );


    var placeMark = _mapWindow?.map.mapObjects.addPlacemarkWithImage(
      const Point(latitude: 55.751225, longitude: 37.62954),
      prov,
      );

      placeMark?.addTapListener(list);
      
  }
  
  @override
  Widget build(BuildContext context) {
    
    
    
    return (
      Scaffold(
         appBar: AppBar(
        title: const Text("К А Р Т А"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
        body: YandexMap(
          onMapCreated: _maps,
          

          ),
          drawer: const MyDrawer(),
      )
    );
  }
}

final class MapObjectTapListenerImpl implements MapObjectTapListener {


  @override
  bool onMapObjectTap(MapObject mapObject, Point point) {

    mapObject as PlacemarkMapObject;
    var prov = imgY.ImageProvider.fromImageProvider(const AssetImage("assets/ball_place_mark.png"));

    mapObject.setIcon(prov);
    

    //ScaffoldMessenger.of().showSnackBar(snackBar);
    return true;
  }
}

