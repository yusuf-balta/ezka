import 'package:ezka/constans/enums/end_point.dart';
import 'package:ezka/services/firebase_service.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../model/adress_model.dart';

class HomeController extends GetxController {
  static String instanceName = "/home-controller";

  FireBaseService fireBaseService = FireBaseService();
  late GoogleMapController mapController;

  CameraPosition initPlex = const CameraPosition(
    target: LatLng(38.734802, 35.467987),
    zoom: 4.5,
  );

  Future<void> getAddressFromLatLong(Position position) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    fireBaseService.setData(endPoint: EndPoint.adress.path, data: _setAdressModel(place).toJson());
  }

  Future<void> postLocationToFirebase() async {
    Position position = await _getGeoLocationPosition();
    await getAddressFromLatLong(position);
  }

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  AdressModel _setAdressModel(Placemark address) {
    return AdressModel(cityName: address.administrativeArea, streetName: address.street, countyName: address.subAdministrativeArea);
  }
}
