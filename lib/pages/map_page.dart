// import 'package:flutter/material.dart';
// import 'package:yandex_maps_mapkit/image.dart' as imgY;

// import 'package:yandex_maps_mapkit/mapkit.dart';
// import 'package:yandex_maps_mapkit/yandex_map.dart';



// class MyMap extends StatefulWidget {
//   const MyMap({super.key});
  
//   @override
//   State<MyMap> createState() => _MyMapState();
// }

  
// class _MyMapState extends State<MyMap> {
  
//   late final list = MapObjectTapListenerImpl();

//   MapWindow? _mapWindow;

  

//   void _maps(MapWindow map_){

//      const AlertDialog(title: Text("123"));
   
//     _mapWindow = map_;

//     _mapWindow?.map.mapType = MapType.Map;
//     _mapWindow?.map.set2DMode(true);

//     var prov = imgY.ImageProvider.fromImageProvider(const AssetImage("assets/bigMark.png"));

//     _mapWindow?.map.move(
//       const CameraPosition(
//           Point(latitude: 55.751225, longitude: 37.62954),
//           zoom: 17.0,
//           azimuth: 0,//150.0,
//           tilt: 0//30.0
//         )
//     );


//     var placeMark = _mapWindow?.map.mapObjects.addPlacemarkWithImage(
//       const Point(latitude: 55.751225, longitude: 37.62954),
//       prov,
//       );

//       placeMark?.addTapListener(list);
      
//   }
  
//   @override
//   Widget build(BuildContext context) {
    
    
//     return MaterialApp(
//       home: Scaffold(
//         body: YandexMap(
//           onMapCreated: _maps,
          

//           )
          
//       )
//     );
//   }
// }

// final class MapObjectTapListenerImpl implements MapObjectTapListener {


//   @override
//   bool onMapObjectTap(MapObject mapObject, Point point) {

//     mapObject as PlacemarkMapObject;
//     var prov = imgY.ImageProvider.fromImageProvider(const AssetImage("assets/ball_place_mark.png"));

//     mapObject.setIcon(prov);
    

//     //ScaffoldMessenger.of().showSnackBar(snackBar);
//     return true;
//   }
// }

