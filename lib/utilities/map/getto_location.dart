import 'dart:async';
import 'package:footzone/providers/field_model.dart';
import 'package:footzone/providers/markers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../../screens/map/add_marker.dart';
import '../../utilities/map/location_permission.dart';

Future getToMyLocaction(Location _location,
    Completer<GoogleMapController> _controller, Markers markers) async {
  _location = Location();
  locationPermission(_location);
  final GoogleMapController controller = await _controller.future;
  LocationData currentLocation;
  try {
    currentLocation = await _location.getLocation();

    if (currentLocation != null) {
      markers.addMarker('myLocation',
          Locate(currentLocation.latitude, currentLocation.longitude));

      controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 0,
          target: LatLng(currentLocation.latitude!, currentLocation.longitude!),
          zoom: 13.0,
        ),
      ));
    }
  } catch (e) {
    print(e);
  }
}

//Add location to the map as a Marker
