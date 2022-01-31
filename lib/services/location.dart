// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart' hide LocationAccuracy;
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

class Locate {
  Position? _currentPosition;
  String? _address = "";
  Location location = new Location();
  var geolocator = Geolocator();
  fetchLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    Position? position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    position = _currentPosition;
    print(
        "Lat:${_currentPosition!.latitude} + Long: ${_currentPosition!.longitude} ");
    getAddress(_currentPosition!.latitude, _currentPosition!.longitude)
        .then((value) {
      _address = value.first.addressLine +
          value.first.featureName +
          value.first.adminArea +
          value.first.locality;
      print(_address);
    });

    // location.onLocationChanged.listen((LocationData currentLocation) {
    //   setState(() {
    //     _currentPosition = currentLocation;
    //     getAddress(_currentPosition.latitude, _currentPosition.longitude)
    //         .then((value) {
    //       setState(() {
    //         _address = "${value.first.addressLine}";
    //       });
    //     });
    //   });
    // });
  }

  Future<List<Address>> getAddress(double? lat, double? lang) async {
    final coordinates = new Coordinates(lat, lang);
    List<Address> address =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    return address;
  }
}
