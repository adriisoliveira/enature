import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:payflow/services/geolocator_service.dart';
import 'package:payflow/services/places_service.dart';

class ApplicationBloc with ChangeNotifier {
  final geolocatorService = GeolocatorService();
  final placesService = PlacesService();

  //Variables
  late Position currentLocation;

  ApplicationBloc() {
    setCurrentLocation();
  }

  setCurrentLocation() async {
    currentLocation = await geolocatorService.getCurrentLocation();
    notifyListeners();
  }

  searchPlaces(String searchTerm) async {
    await placesService.getAutocomplete(searchTerm);
  }
}
