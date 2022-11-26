import 'dart:async';
import 'package:flutter/material.dart';
import 'package:footzone/providers/field_model.dart';
import 'package:footzone/providers/fields.dart';
import 'package:footzone/providers/markers.dart';
import 'package:footzone/utilities/map/getto_location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import '../../constants/colors.dart';

const CameraPosition _tashkent = CameraPosition(
  target: LatLng(41.311081, 69.240562),
  zoom: 12,
);

class MapPage extends StatefulWidget {
  static const id = 'map';
  const MapPage({super.key});

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
    //* Adding Data to fieldsMap

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final fieldsData = Provider.of<Fields>(context, listen: false);
      final markers = Provider.of<Markers>(context, listen: false);
      final List<FieldModel> fields = fieldsData.getFields;
      for (FieldModel element in fields) {
        markers.addMarker(element.id, element.location);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final markers = Provider.of<Markers>(context);
    print(markers.getFieldMarkers);
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
              markers: markers.getFieldMarkers.toSet(),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            Positioned(
              bottom: 30,
              left: 20,
              child: ElevatedButton(
                onPressed: () {
                  getToMyLocaction(_location, _controller, markers);
                },
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
