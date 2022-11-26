import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';

import '../utilities/map/location_permission.dart';

class CurrentLocation extends ChangeNotifier {
  LocationData currentLocation =
      LocationData.fromMap({'latitude': 41.3288, 'longitude': 69.2856});
  Future getCurrentLocaton() async {
    final location = Location();
    locationPermission(location);
    currentLocation = await location.getLocation();
    print(currentLocation);
    notifyListeners();
  }
}
