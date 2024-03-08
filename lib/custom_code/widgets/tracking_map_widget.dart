// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
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
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;

//import 'package:do_well_maps/flutter_flow/flutter_flow_google_map.dart';
// Set your widget name, define your parameter, and then add the
// boilerplate code using the button on the right!
import 'package:google_maps_flutter/google_maps_flutter.dart' hide LatLng;
import 'package:google_maps_flutter/google_maps_flutter.dart' as latlng;
import 'dart:math';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:provider/provider.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'dart:math' as math;
//import 'package:flutter_map/flutter_map.dart';
//import 'package:latlong2/latlong.dart';
//import 'package:flutter_map_example/misc/tile_providers.dart';

class TrackingMapWidget extends StatefulWidget {
  const TrackingMapWidget(
      {Key? key,
      this.width,
      this.height,
      this.origin,
      required this.lenght,
      required this.iOSGoogleMapsApiKey,
      required this.androidGoogleMapsApiKey,
      required this.webGoogleMapsApiKey})
      : super(key: key);

  final double? width;
  final double? height;
  final LatLng? origin;
  final double? lenght;
  final String iOSGoogleMapsApiKey;
  final String androidGoogleMapsApiKey;
  final String webGoogleMapsApiKey;

  @override
  _TrackingMapWidget createState() => _TrackingMapWidget();
}

class _TrackingMapWidget extends State<TrackingMapWidget> {
  GoogleMapController? _controller;

  double zoomValue = 14;

  Set<Marker> markers = new Set();

  late var placepicked;
  late BitmapDescriptor pinLocationIcon;
  Set<latlng.Polygon> polygons = {};

  BitmapDescriptor? _markerIcon;

  final latlng.LatLng equator =
      latlng.LatLng(51.50823998974070000000, 0.03214987724963070000);

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
    super.initState();
    _loadMarkerImage();
  }

  Future<void> _loadMarkerImage() async {
    final ByteData data = await rootBundle.load('assets/overlayed_img.png');
    final Uint8List bytes = data.buffer.asUint8List();
    _markerIcon = BitmapDescriptor.fromBytes(bytes);
  }

  @override
  Widget build(BuildContext context) {
    _drawSquare();
    return Stack(children: [
      Container(
          width: widget.width,
          height: widget.height,
          child: GoogleMap(
            zoomControlsEnabled: false,
            tiltGesturesEnabled: true,
            initialCameraPosition: CameraPosition(
                target: equator, zoom: zoomValue, bearing: 180.0, tilt: 30.0),
            polygons: polygons,
            myLocationEnabled: true,
            markers: Set.from([
              Marker(
                markerId: MarkerId(generateRandomString(10)),
                position: equator, //position of marker
                infoWindow: InfoWindow(title: "Center Point"),
                icon:
                    _markerIcon!, //BitmapDescriptor.defaultMarker, //Icon for Marker
              )
            ]),
            onMapCreated: (GoogleMapController controller) {
              setState(() {
                _controller = controller;
                _controller?.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                        target: equator,
                        zoom: zoomValue,
                        bearing: 180.0,
                        tilt: 30.0),
                  ),
                );
              });
              // controller.addTile(tileLayer);
            },
          )),
      Visibility(
        visible: !(FFAppState().showBottomSheet),
        child: Positioned(
          left: 0,
          right: 0,
          bottom: 2,
          child: GestureDetector(
              onTap: () {
                FFAppState().update(() {
                  FFAppState().showBottomSheet = true;
                });
                // setState(() {});
              },
              child: Container(
                height: 45,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    )),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(
                    Icons.keyboard_arrow_up,
                  ),
                ]),
              )),
        ),
      )
    ]);
  }

  getRadianValue(double value) {
    return (math.pi * value) / 180;
  }

  getDegreeValue(double value) {
    return (180 / math.pi) * value;
  }

  latlng.LatLng calculateNewCoordinates(
      double centerLat, double centerLon, double angle, double distance) {
    // Convert latitude and longitude from degrees to radians
    double centerLatRad = getRadianValue(centerLat);
    double centerLonRad = getRadianValue(centerLon);

    // Convert angle from degrees to radians
    double angleRad = getRadianValue(angle);

    // Radius of the Earth in kilometers (you can adjust this value if needed)
    double earthRadius = 6371.0;

    // Calculate the new latitude
    double newLatRad = math.asin(
        math.sin(centerLatRad) * math.cos(distance / earthRadius) +
            math.cos(centerLatRad) *
                math.sin(distance / earthRadius) *
                math.cos(angleRad));

    // Calculate the new longitude
    double newLonRad = centerLonRad +
        math.atan2(
            math.sin(angleRad) *
                math.sin(distance / earthRadius) *
                math.cos(centerLatRad),
            math.cos(distance / earthRadius) -
                math.sin(centerLatRad) * math.sin(newLatRad));

    // Convert new latitude and longitude from radians to degrees
    double newLat = getDegreeValue(newLatRad);
    double newLon = getDegreeValue(newLonRad);

    return latlng.LatLng(newLat, newLon);
  }

  void _drawSquare() async {
    // Replace these coordinates with your desired location
    latlng.LatLng center = equator;

    // double length = (widget.lenght ?? 0) / 2;
    // List<latlng.LatLng> bigSquareCoordinates = [
    //   latlng.LatLng((center.latitude + (length * 0.000008987)),
    //       (center.longitude - (length * 0.000008987))),
    //   latlng.LatLng((center.latitude + (length * 0.000008987)),
    //       (center.longitude + (length * 0.000008987))),
    //   latlng.LatLng((center.latitude - (length * 0.000008987)),
    //       (center.longitude + (length * 0.000008987))),
    //   latlng.LatLng((center.latitude - (length * 0.000008987)),
    //       (center.longitude - (length * 0.000008987)))
    // ];

    // double length = ((widget.lenght ?? 0) / 2) * 0.001;
    // latlng.LatLng southwest = calculateNewCoordinates(
    //     center.latitude, center.longitude, 225.0, length);
    // latlng.LatLng northwest = calculateNewCoordinates(
    //     center.latitude, center.longitude, 315.0, length);
    // latlng.LatLng northeast = calculateNewCoordinates(
    //     center.latitude, center.longitude, 45.0, length);
    // latlng.LatLng southeast = calculateNewCoordinates(
    //     center.latitude, center.longitude, 135.0, length);

    // List<latlng.LatLng> bigSquareCoordinates = [
    //   northwest,
    //   northeast,
    //   southeast,
    //   southwest
    // ];

    List<latlng.LatLng> bigSquareCoordinates = [
      latlng.LatLng(51.50972107105440000000, 0.02990562260010410000),
      latlng.LatLng(51.50972107105440000000, 0.03440229807415630000),
      latlng.LatLng(51.50676418642850000000, 0.03440229807415630000),
      latlng.LatLng(51.50676418642850000000, 0.02990562260010410000),
    ];

    print("the center is ::: $center");

    print("Corner Cordinates ::: $bigSquareCoordinates");

    for (latlng.Polygon? line in polygons) {
      polygons.removeWhere((m) => m.polygonId == 'square');
    }

    setState(() {
      polygons.add(
        latlng.Polygon(
          polygonId: latlng.PolygonId('square'),
          points: bigSquareCoordinates,
          fillColor: Colors.transparent, //blue.withOpacity(0.1)
          strokeColor: Colors.blue,
          strokeWidth: 3,
        ),
      );
    });
    drawSmallerSquare();
  }

  void drawSmallerSquare() {
    latlng.LatLng center = equator;

    var convertCord = FFAppState().convertedCordinate;
    var square_count = FFAppState().squareCounts;
    debugPrint("ConvertedCordnate:${convertCord} ${square_count}");
    if (square_count > 0) {
      double actual_lenght = 1;
      for (var j in convertCord) {
        for (var i in j) {
          debugPrint("Latitude: ${i[0]} ${i[0].runtimeType}");
          smallSquare(
              latlng.LatLng((center.latitude + double.parse(i[0])),
                  (center.longitude + double.parse(i[1]))),
              actual_lenght);
        }
      }
    }
  }

  void smallSquare(latlng.LatLng centerCord, double distance) {
    // double length = (distance/2) * 0.001;

    // latlng.LatLng southwest = calculateNewCoordinates(
    //     centerCord.latitude, centerCord.longitude, 225.0, length);
    // latlng.LatLng northwest = calculateNewCoordinates(
    //     centerCord.latitude, centerCord.longitude, 315.0, length);
    // latlng.LatLng northeast = calculateNewCoordinates(
    //     centerCord.latitude, centerCord.longitude, 45.0, length);
    // latlng.LatLng southeast = calculateNewCoordinates(
    //     centerCord.latitude, centerCord.longitude, 135.0, length);

    // List<latlng.LatLng> squareCoordinates = [
    //   northwest,
    //   northeast,
    //   southeast,
    //   southwest
    // ];

    double length = (distance / 2);
    List<latlng.LatLng> squareCoordinates = [
      latlng.LatLng((centerCord.latitude + (length * 0.000008987)),
          (centerCord.longitude - (length * 0.000008987))),
      latlng.LatLng((centerCord.latitude + (length * 0.000008987)),
          (centerCord.longitude + (length * 0.000008987))),
      latlng.LatLng((centerCord.latitude - (length * 0.000008987)),
          (centerCord.longitude + (length * 0.000008987))),
      latlng.LatLng((centerCord.latitude - (length * 0.000008987)),
          (centerCord.longitude - (length * 0.000008987)))
    ];

    setState(() {
      polygons.add(
        latlng.Polygon(
          polygonId: latlng.PolygonId('square' + generateRandomString(10)),
          points: squareCoordinates,
          fillColor: Colors.transparent,
          strokeColor: Color.fromARGB(255, 243, 37, 33),
          strokeWidth: 1,
        ),
      );
    });
  }

  latlng.LatLng getPlacePicker() {
    if (markers.length >= 1) {
      markers.clear();
      setState(() {});
    }

    placepicked = latlng.LatLng(
        widget.origin?.latitude ?? 0.0, widget.origin?.longitude ?? 0.0);
    markers.add(Marker(
      markerId: MarkerId(generateRandomString(10)),
      position: placepicked, //position of marker
      infoWindow: InfoWindow(title: "Starting Point"),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));

    zoomValue = 14;
    _controller?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: placepicked, zoom: zoomValue, bearing: 180.0, tilt: 30.0)));
    // debugPrint("Place picked $placepicked");

    setState(() {});
    return placepicked;
  }

  ///
  String getlatlngToString(latlng.LatLng latlng) {
    double lat = latlng.latitude;
    double lng = latlng.longitude;
    return "$lat,$lng";
  }

  ///
  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  // Working on placing image on the polygon
  // latlng.TileOverlay myTileOverlay = latlng.TileOverlay(
  //   tileOverlayId: latlng.TileOverlayId("myTileOverlay"),
  //   tileProvider: latlng.BitmapTileProvider(
  //     overlayImage: latlng.ImageConfiguration(size: Size(300, 300)),
  //     bitmapDescriptor: await latlng.BitmapDescriptor.fromAssetImage(
  //       latlng.ImageConfiguration(size: Size(300, 300)),
  //       'assets/your_image.png',
  //     ),
  //   ),
  //   zIndex: 2,
  // );

  // latlng.Tile tileLayer = latlng.Tile(
  //   urlTemplate:
  //       "https://th.bing.com/th/id/OIP.SQQFm-oK6Lu_eMaiGGRI1AAAAA?rs=1&pid=ImgDetMain",
  //   size: 256,
  //   opacity: 0.75,
  // );
}
