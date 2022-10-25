import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;



  void addCustomIcon(){
    BitmapDescriptor.fromAssetImage(const ImageConfiguration(), 'assets/Location_marker.png').then((icon){
      setState(() {
        markerIcon = icon;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    addCustomIcon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(37.4221, -122.084081),
          zoom: 14
        ),
        markers: {
          Marker(
            markerId: const MarkerId('demo'),
            position: const LatLng(37.4221, -122.084081),
            draggable: true,
            onDragEnd: (value){
              debugPrint(value.toString());
            },
            icon: markerIcon,

          )
        },
      ),
    );
  }
}
