import 'package:ezka/constans/enums/end_point.dart';
import 'package:ezka/model/user_model.dart';
import 'package:ezka/services/firebase_service.dart';
import 'package:ezka/widgets/app_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../model/adress_model.dart';

class HomeController extends GetxController {
  static String instanceName = "/home-controller";

  FireBaseService fireBaseService = FireBaseService();
  late GoogleMapController mapController;

  UserModel? _userModel;
  UserModel? get getUserModel => _userModel;
  clearUser() => _userModel = null;

  late final TextEditingController nameController;
  late final TextEditingController surNameController;
  late final TextEditingController cityNameController;
  @override
  void onClose() {
    nameController.dispose();
    surNameController.dispose();
    cityNameController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    surNameController = TextEditingController();
    cityNameController = TextEditingController();
  }

  CameraPosition initPlex = const CameraPosition(
    target: LatLng(38.734802, 35.467987),
    zoom: 4.5,
  );

  Future<void> getAddressFromLatLong(Position position) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    try {
      fireBaseService.setAdress(endPoint: EndPoint.users.path, data: _setAdressModel(place).toMap());
    } catch (e) {
      AppDialogs.failedSnackbar(e.toString());
    }
  }

  Future<void> getDataFromDb(BuildContext context) async {
    _userModel = await fireBaseService.getAdress(name: nameController.text, surName: surNameController.text, cityName: cityNameController.text);
  }

  Future<void> postLocationToFirebase(BuildContext context) async {
    AppDialogs.loadingDialog(context);
    Position position = await _getGeoLocationPosition();
    await getAddressFromLatLong(position);
    Get.back();
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
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  AdressModel _setAdressModel(Placemark address) {
    return AdressModel(cityName: address.administrativeArea, streetName: address.street, countyName: address.subAdministrativeArea);
  }
}
