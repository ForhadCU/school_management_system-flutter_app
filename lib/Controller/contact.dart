import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ContactController extends GetxController {
  static ContactController get to => Get.find();

  var adress = Rxn<String>();
  var phone = Rxn<String>();
  var email = Rxn<String>();
  var website = Rxn<String>();
  var lattitude = Rxn<double>();
  var longitude = Rxn<double>();
  var whatsapp = Rxn<String>();
  var facebook = Rxn<String>();
  var youtube = Rxn<String>();
  var kMapCameraPosition = Rxn<CameraPosition>();

  final Completer<GoogleMapController> controllerGoogleMap =
      Completer<GoogleMapController>();

  @override
  void onInit() {
    super.onInit();
    _mInitiateValue();
  }

  void _mInitiateValue() {
    adress.value = "demo text";
    phone.value = "01021029393";
    email.value = "demo@gamil.com";
    website.value = "www.demo.or";
    lattitude.value = 37.42796133580664;
    longitude.value = -122.085749655962;
    kMapCameraPosition.value = CameraPosition(
      target: LatLng(lattitude.value!, longitude.value!),
      zoom: 14.4746,
    );
  }
}
