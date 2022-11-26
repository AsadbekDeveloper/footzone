import 'package:location/location.dart';

Future locationPermission(Location _location) async {
  bool serviceEnabled = await _location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await _location.requestService();
    if (!serviceEnabled) {
      return;
    }
  }
  PermissionStatus permissionGranted = await _location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await _location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      return;
    }
  }
}
