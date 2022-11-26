import 'package:flutter/cupertino.dart';
import 'package:footzone/providers/field_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Markers extends ChangeNotifier {
  List<Marker> _fieldsMarkers = [];
  List<Marker> get getFieldMarkers => _fieldsMarkers;
  void addMarker(String id, Locate location, BitmapDescriptor icon) {
    _fieldsMarkers.add(
      Marker(
        markerId: MarkerId(id),
        position: LatLng(location.latitude!, location.longitude!),
        infoWindow: const InfoWindow(
          title: 'My Location',
          anchor: Offset(0.5, 0.0),
        ),
        icon: icon,
      ),
    );
    notifyListeners();
  }
}
