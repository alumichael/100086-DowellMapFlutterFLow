// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/gestures.dart';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

//import 'package:do_well_maps/flutter_flow/flutter_flow_google_map.dart';
// Set your widget name, define your parameter, and then add the
// boilerplate code using the button on the right!
import 'package:google_maps_flutter/google_maps_flutter.dart' hide LatLng;
import 'package:google_maps_flutter/google_maps_flutter.dart' as latlng;
import 'dart:math';
import 'dart:async';
import 'dart:convert';
import 'package:google_map_polyline_new/google_map_polyline_new.dart';
//import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class MapWithPolygonsAndCircles extends StatefulWidget {
  const MapWithPolygonsAndCircles({
    Key? key,
    this.width,
    this.height,
    this.origin,
    required this.radius1,
    required this.radius2,
    this.query,
    this.result,
    this.address,
    required this.clearmap,
    required this.iOSGoogleMapsApiKey,
    required this.androidGoogleMapsApiKey,
    required this.webGoogleMapsApiKey,
  }) : super(key: key);

  final double? width;
  final double? height;
  final LatLng? origin;
  final double radius1;
  final double radius2;
  final String? query;
  final List<LatLng>? result;
  final List<String>? address;
  final bool clearmap;
  final String iOSGoogleMapsApiKey;
  final String androidGoogleMapsApiKey;
  final String webGoogleMapsApiKey;
  @override
  _MapWithPolygonsAndCirclesState createState() =>
      _MapWithPolygonsAndCirclesState();
}

class _MapWithPolygonsAndCirclesState extends State<MapWithPolygonsAndCircles> {
  //late var ori;
  //Completer<GoogleMapController> _controller = Completer();
  GoogleMapController? _controller;
  late GoogleMapPolyline? googleMapPolyline;
  final Set<Marker> markers = new Set();
  late var placepicked;

  String get googleMapsApiKey {
    if (kIsWeb) {
      return widget.webGoogleMapsApiKey;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        return '';
      case TargetPlatform.iOS:
        return widget.iOSGoogleMapsApiKey;
      case TargetPlatform.android:
        return widget.androidGoogleMapsApiKey;
      default:
        return widget.webGoogleMapsApiKey;
    }
  }

  final List<latlng.Polyline> polyline = [];
  List<latlng.LatLng>? routeCoords = [];

  String generateRandomString(int lengthOfString) {
    final random = Random();
    const allChars =
        'AaBbCcDdlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1EeFfGgHhIiJjKkL234567890';
    // below statement will generate a random string of length using the characters
    // and length provided to it
    final randomString = List.generate(lengthOfString,
        (index) => allChars[random.nextInt(allChars.length)]).join();
    return randomString; // return the generated string
  }

  @override
  void initState() {
    googleMapPolyline = new GoogleMapPolyline(apiKey: googleMapsApiKey);
    //debugPrint("ApiKey $googleMapsApiKey");
    //debugPrint("ClearMap ${widget.clearmap}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
        child: GestureDetector(
            onVerticalDragStart: (start) {},
            child: GoogleMap(
                zoomGesturesEnabled: true,
                zoomControlsEnabled: false,
                tiltGesturesEnabled: true,
                rotateGesturesEnabled: true,
                gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                  new Factory<OneSequenceGestureRecognizer>(
                    () => new EagerGestureRecognizer(),
                  ),
                ].toSet(),
                markers: getmarkers(widget.result, widget.address,
                        widget.origin!, widget.clearmap)
                    .toSet(),
                polylines: Set.from(polyline),
                initialCameraPosition: CameraPosition(
                    target: getPlacePicker(), bearing: 180.0, tilt: 60.0),
                circles: Set.from([
                  Circle(
                      circleId: CircleId(generateRandomString(10)),
                      center: latlng.LatLng(
                          widget.origin!.latitude, widget.origin!.longitude),
                      radius: widget.radius1,
                      strokeWidth: 2,
                      strokeColor: Color.fromARGB(255, 3, 124, 7),
                      fillColor: Colors.transparent),
                  Circle(
                      circleId: CircleId(generateRandomString(10)),
                      center: latlng.LatLng(
                          widget.origin!.latitude, widget.origin!.longitude),
                      radius: widget.radius2,
                      strokeWidth: 2,
                      strokeColor: Color.fromARGB(255, 3, 124, 7),
                      fillColor: Colors.transparent),
                ]),
                myLocationEnabled: true,
                onMapCreated: (GoogleMapController controller) {
                  setState(() {
                    _controller = controller;
                    googleMapPolyline =
                        new GoogleMapPolyline(apiKey: googleMapsApiKey);

                    _controller?.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                            target: latlng.LatLng(widget.origin!.latitude,
                                widget.origin!.longitude),
                            zoom: 16,
                            bearing: 180.0,
                            tilt: 60.0),
                      ),
                    );
                  });
                })));
  }

  Set<Marker> getmarkers(List<LatLng>? locationInfo, List<String>? Titl,
      LatLng origin, bool clearmap) {
    debugPrint("locationInfo $locationInfo");
    debugPrint("Place picked $Titl");

    debugPrint("Is ClearMap $clearmap");

    if (clearmap) {
      removeMarker();
    } else {
      setState(() {
        if (locationInfo != null) {
          debugPrint("$locationInfo.length");
          for (var i = 0; i < locationInfo.length; i++) {
            markers.add(Marker(
                markerId: MarkerId(generateRandomString(10)),
                position: latlng.LatLng(locationInfo[i].latitude,
                    locationInfo[i].longitude), //position of marker
                infoWindow: InfoWindow(title: Titl!.elementAt(i)),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueBlue),
                onTap: () async {
                  _computePath(
                      latlng.LatLng(
                          widget.origin!.latitude, widget.origin!.longitude),
                      latlng.LatLng(
                          locationInfo[i].latitude, locationInfo[i].longitude));
                }));
          }
        }
      });
    }

    debugPrint("Markers $markers");
    return markers;
  }

  removeMarker() {
    setState(() {
      if (markers.length > 1) {
        // Keep the first marker
        final firstMarker = markers.first;
        markers.clear();
        markers.add(firstMarker);
        debugPrint("ClearMap ${widget.clearmap}");
      }
    });
  }

  _computePath(latlng.LatLng origin, latlng.LatLng destination) async {
    routeCoords = await googleMapPolyline?.getCoordinatesWithLocation(
        origin: origin, destination: destination, mode: RouteMode.driving);

    debugPrint("Result --- ${routeCoords}");

    CameraPosition nepPos =
        CameraPosition(target: origin, zoom: 16, bearing: 180.0, tilt: 60.0);

    _controller?.animateCamera(CameraUpdate.newCameraPosition(nepPos));

    setState(() {
      polyline.clear();
      if (routeCoords != null) {
        polyline.add(latlng.Polyline(
            polylineId: latlng.PolylineId('iter'),
            visible: true,
            points: routeCoords!,
            width: 4,
            color: Colors.blue,
            startCap: Cap.roundCap,
            endCap: Cap.buttCap));
      }
    });
  }

  latlng.LatLng getPlacePicker() {
    if (markers.length > 0) {
      markers.clear();
    }
    setState(() {
      placepicked =
          latlng.LatLng(widget.origin!.latitude, widget.origin!.longitude);
      _controller?.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: placepicked, zoom: 14)));

      markers.add(Marker(
        markerId: MarkerId(generateRandomString(10)),
        position: latlng.LatLng(widget.origin!.latitude,
            widget.origin!.longitude), //position of marker
        infoWindow: InfoWindow(
            //popup info
            title: "Starting Point"),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
    });
    debugPrint("Place picked $placepicked");
    return placepicked;
  }
}
