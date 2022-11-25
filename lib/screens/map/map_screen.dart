import 'dart:async';

import 'package:flutter/material.dart';
import 'package:footzone/providers/field_model.dart';
import 'package:footzone/providers/fields.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';

List<Marker> fieldsMap = [];
const CameraPosition _tashkent = CameraPosition(
  target: LatLng(41.311081, 69.240562),
  zoom: 12,
);

class MapPage extends StatefulWidget {
  static const id = 'map';
  MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller = Completer();
  Location _location = Location();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // await getLocaction(_location, _controller);
  }

  @override
  Widget build(BuildContext context) {
    //* Adding Data to fieldsMap
    final fieldsData = Provider.of<Fields>(context);
    final List<FieldModel> fields = fieldsData.getFields;
    print(fields);
    for (FieldModel element in fields) {
      fieldsMap.add(
        Marker(
          markerId: MarkerId(
            element.id.toString(),
          ),
          position:
              LatLng(element.location.latitude, element.location.longitude),
          infoWindow: InfoWindow(
            title: element.name,
            anchor: const Offset(0.5, 0.0),
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
      print(fieldsMap.length);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Xaritadan izlash'),
        centerTitle: true,
        backgroundColor: mainBlue,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: _tashkent,
              scrollGesturesEnabled: true,
              tiltGesturesEnabled: true,
              trafficEnabled: false,
              compassEnabled: true,
              rotateGesturesEnabled: true,
              zoomGesturesEnabled: true,
              cameraTargetBounds: CameraTargetBounds(
                LatLngBounds(
                  northeast:
                      const LatLng(41.411982335901634, 69.43317528514588),
                  southwest: const LatLng(41.16226111133259, 69.08573267762881),
                ),
              ),
              markers: fieldsMap.toSet(),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            Positioned(
              bottom: 30,
              left: 20,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    const CircleBorder(),
                  ),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.all(15),
                  ),
                ),
                child: const Icon(Icons.location_on_rounded),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future getLocaction(
    Location _location, Completer<GoogleMapController> _controller) async {
  _location = Location();
  locationPermission(_location);
  final GoogleMapController controller = await _controller.future;
  LocationData currentLocation;
  try {
    currentLocation = await _location.getLocation();
    if (currentLocation != null) {
      controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 0,
          target: LatLng(currentLocation.latitude!, currentLocation.longitude!),
          zoom: 13.0,
        ),
      ));
      addMarker(currentLocation);
    }
  } catch (e) {
    print(e);
  }
}

//Add location to the map as a Marker
void addMarker(LocationData currentLocation) {
  fieldsMap.add(
    Marker(
      markerId: const MarkerId(
        'myLocation',
      ),
      position: LatLng(currentLocation.latitude!, currentLocation.longitude!),
      infoWindow: const InfoWindow(
        title: 'My Location',
        anchor: Offset(0.5, 0.0),
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(200),
    ),
  );
}

// }

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
