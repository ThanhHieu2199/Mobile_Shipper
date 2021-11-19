// import 'package:flutter/cupertino.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:mobile_shipper/blocs/place_bloc.dart';
// import 'package:mobile_shipper/model/place.dart';
//
//
// class Configs {
// static const _baseUrl =
// 'https://maps.googleapis.com/maps/api/place/textsearch/json?';
// final PlaceBloc _placeBloc;
// Configs({PlaceBloc placeBloc}) : _placeBloc = placeBloc?? PlaceBloc();
//
// Future<Configs> getConfigs({
//   @required LatLng origin,
//   @required LatLng destination,
// })async{
//   final response = await _placeBloc.get(
//     _baseUrl,
//     queryParameters:{
//       'origin': '${origin.latitude}, ${origin.longitude}',
//       'destination': '${destination.latitude}, ${destination.longitude}',
//       'key': AIzaSyDY2jcwsyIkpRHiB3HUVkLw36fo6pdvQY4,
//     }
//   );
// }
// }