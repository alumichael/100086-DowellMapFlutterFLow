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
import 'package:google_map_polyline_new/google_map_polyline_new.dart';
import 'package:provider/provider.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as loca;
import 'package:socket_io_client/socket_io_client.dart' as IO;

class MyMapWidget extends StatefulWidget {
  const MyMapWidget({
    Key? key,
    this.width,
    this.height,
    this.origin,
    required this.radius1,
    required this.radius2,
    this.query,
    this.result,
    this.groupLocList,
    this.groupLocAddress,
    this.googleLocsId,
    this.address,
    required this.clearmap,
    required this.iOSGoogleMapsApiKey,
    required this.androidGoogleMapsApiKey,
    required this.webGoogleMapsApiKey,
    this.dbResult,
    this.dbAddress,
    this.PlaceIds,
    required this.navigateTo,
    required this.deleteAction,
    required this.updateAction,
  }) : super(key: key);

  final double? width;
  final double? height;
  final LatLng? origin;
  final double? radius1;
  final double radius2;
  final String? query;
  final List<LatLng>? result;
  final List<LatLng>? groupLocList;
  final List<String>? address;
  final bool clearmap;
  final String iOSGoogleMapsApiKey;
  final String androidGoogleMapsApiKey;
  final String webGoogleMapsApiKey;
  final List<LatLng>? dbResult;
  final List<String>? dbAddress;
  final List<String>? groupLocAddress;
  final List<String>? googleLocsId;
  final List<String>? PlaceIds;
  final Future<dynamic> Function() navigateTo;
  final Future<dynamic> Function() deleteAction;
  final Future<dynamic> Function() updateAction;

  @override
  _MyMapWidget createState() => _MyMapWidget();
}

class _MyMapWidget extends State<MyMapWidget> {
  GoogleMapController? _controller;
  StreamSubscription<loca.LocationData>? locationSubscription;
  Position? position;
  IO.Socket? socket;
  late GoogleMapPolyline? googleMapPolyline;
  loca.Location location = loca.Location();
  Position? currentPosition;
  latlng.LatLng? destinationCoords;
  double zoomValue = 13;

  Set<Marker> markers = new Set();
  Set<Marker> draggableMarkers = new Set();

  late var placepicked;
  late var selectedlocatn;
  late BitmapDescriptor pinLocationIcon;

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
    getCurrentLocation();

    if (FFAppState().allowLocationTracking == true &&
        FFAppState().isAuthUser == false) {
      activateSocket();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    trackMe();

    debugPrint(
        ":::from the marker room:: ${FFAppState().groupList} :: radius2 :: ${widget.radius2} :: zoomValue :: $zoomValue");
    bool isOriginZero =
        (widget.origin!.latitude == 0 && widget.origin!.longitude == 0);

    latlng.LatLng repPosition =
        latlng.LatLng(position?.latitude ?? 0, position?.longitude ?? 0);

    // debugPrint("------widget redbuilding ::: ----${widget.origin}-");

    return Stack(children: [
      Container(
          width: widget.width,
          height: widget.height,
          child: GoogleMap(
            zoomControlsEnabled: false,
            tiltGesturesEnabled: true,
            //debugPrint(
            //"..............................THIS Check Point crossed.....................");
            polylines: Set.from(polyline),
            initialCameraPosition: CameraPosition(
                target: getPlacePicker(), bearing: 180.0, tilt: 30.0),
            circles: Set.from([
              Circle(
                  circleId: CircleId(generateRandomString(10)),
                  center: isOriginZero
                      ? repPosition
                      : latlng.LatLng(
                          widget.origin!.latitude, widget.origin!.longitude),
                  radius: widget.radius1 ?? 0,
                  strokeWidth: 2,
                  strokeColor: Color.fromARGB(255, 3, 124, 7),
                  fillColor: Colors.transparent),
              Circle(
                  circleId: CircleId(generateRandomString(10)),
                  center: isOriginZero
                      ? repPosition
                      : latlng.LatLng(
                          widget.origin!.latitude, widget.origin!.longitude),
                  radius: widget.radius2,
                  strokeWidth: 2,
                  strokeColor: Color.fromARGB(255, 3, 124, 7),
                  fillColor: Colors.transparent),
            ]),
            markers: getmarkers(
                    widget.PlaceIds,
                    widget.result,
                    widget.dbResult,
                    widget.dbAddress,
                    widget.address,
                    isOriginZero
                        ? repPosition
                        : latlng.LatLng(
                            widget.origin!.latitude, widget.origin!.longitude),
                    widget.clearmap,
                    context,
                    widget.groupLocList,
                    widget.groupLocAddress,
                    widget.googleLocsId)
                .toSet(),
            myLocationEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              setState(() {
                _controller = controller;
                googleMapPolyline =
                    new GoogleMapPolyline(apiKey: googleMapsApiKey);
                _controller?.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: latlng.LatLng(
                          widget.origin!.latitude, widget.origin!.longitude),
                      zoom: zoomValue,
                      bearing: 180.0,
                      tilt: 30.0,
                    ),
                  ),
                );
              });
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

  ///
  ///
  ///
  String getlatlngToString(latlng.LatLng latlng) {
    double lat = latlng.latitude;
    double lng = latlng.longitude;
    return "$lat,$lng";
  }

  ///
  ///
  ///
  trackMe() {
    if (FFAppState().allowLocationTracking == true &&
        FFAppState().isAuthUser == false) {
      addSocketMessage();
    }

    print("from the tracking end::::: 0");
    locationSubscription =
        location.onLocationChanged.listen((loca.LocationData locationData) {
      print("from the tracking end::::1: $locationData");
      setState(() {
        currentPosition = Position(
            latitude: locationData.latitude!,
            longitude: locationData.longitude!,
            timestamp: DateTime.now(),
            accuracy: 60,
            altitude: 0,
            heading: 0,
            speed: 100,
            speedAccuracy: 10);
        print("from the tracking end::::: 2:::: $currentPosition");

        if (FFAppState().enableTracking) {
          print(
              "from the tracking end::::: 20:::: ${FFAppState().enableTracking}");
          _controller?.animateCamera(
            CameraUpdate.newLatLng(
              latlng.LatLng(locationData.latitude!, locationData.longitude!),
            ),
          );
          //This is for updating the polyline while the user is changing position
          if (destinationCoords != null) {
            print(
                "from the tracking end::::: 21:::: ${FFAppState().enableTracking}");
            _computeTrackingPath(
              latlng.LatLng(locationData.latitude!, locationData.longitude!),
              destinationCoords!,
            );
          }
          print(
              "from the tracking end::::: 22:::: ${FFAppState().enableTracking}");
          print("from the tracking end::::: 3 ::: $destinationCoords");
        } else {
          print(
              "from the tracking end::::: 23:::: ${FFAppState().enableTracking}");
          for (latlng.Polyline? line in polyline) {
            print(
                "from the tracking end::::: 24:::: ${FFAppState().enableTracking}");
            polyline.removeWhere((m) => m.polylineId == 'tracking');
            // polyline.removeWhere((key, value) => key == line?.polylineId);
          }
        }
      });
    });
  }

  ///
  ///
  ///
  getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {});
  }

  ///
  ///
  ///

  _getDraggableMarkers(
      latlng.LatLng origin, bool clearmap, BuildContext context) async {
    setState(() async {
      double meters = 800;
      double coef = meters / 111320.0;
      double originLat = origin!.latitude;
      double originLong = origin!.longitude;

      // debugPrint(
      //     ":::: The origin lat and long is :::::: $originLat  :::::: $originLong >>>><<<<");

      // debugPrint(":::: The position fetch  is :::::: $position >>>><<<<");

      double new_lat = originLat + coef;

      double new_long = originLong + coef / cos(originLong * 0.01745);

      markers.add(Marker(
          draggable: true,
          markerId: MarkerId(generateRandomString(10)),
          position: latlng.LatLng(new_lat, new_long), //position of marker
          infoWindow: InfoWindow(title: "Add Location"),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          onDragEnd: ((newPosition) {
            // debugPrint("Dragged Loc ${newPosition}");
            selectedlocatn = getlatlngToString(
                latlng.LatLng(newPosition.latitude, newPosition.longitude));

            FFAppState().selectedLocation = getlatlngToString(
                latlng.LatLng(newPosition.latitude, newPosition.longitude));
          }),
          onTap: () async {
            FFAppState().toEditJson = null;
            Widget addToMyMap = SimpleDialogOption(
              child: const Text('Add Place to Map'),
              onPressed: () {
                widget.navigateTo();
              },
            );

            // set up the SimpleDialog
            SimpleDialog dialog = SimpleDialog(
              title: Text('Location Selected: $selectedlocatn'),
              children: <Widget>[addToMyMap],
            );

            showDialog(
              context: context,
              builder: (BuildContext context) {
                return dialog;
              },
            );
          }));
    });
  }

  addGroupLocs(
      latlng.LatLng origin,
      bool clearmap,
      BuildContext context,
      List<LatLng>? groupLocList,
      List<String>? groupLocAddress,
      List<String>? googleLocsId) async {
    setState(() async {
      if (groupLocList != null) {
        debugPrint("$groupLocList.length");
        debugPrint("This is run groupLoc");
        CameraPosition nepPos = CameraPosition(
            target: latlng.LatLng(
                groupLocList[0].latitude, groupLocList[0].longitude),
            zoom: zoomValue,
            bearing: 180.0,
            tilt: 30.0);
        _controller?.animateCamera(CameraUpdate.newCameraPosition(nepPos));

        for (var i = 0; i < groupLocList.length; i++) {
          markers.add(Marker(
              markerId: MarkerId(googleLocsId!.elementAt(i)),
              position: latlng.LatLng(groupLocList[i].latitude,
                  groupLocList[i].longitude), //position of marker
              infoWindow: InfoWindow(title: groupLocAddress!.elementAt(i)),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueOrange),
              onTap: () async {
                // logic for direction api request
                _computePath(
                    latlng.LatLng(origin!.latitude, origin!.longitude),
                    latlng.LatLng(
                        groupLocList[i].latitude, groupLocList[i].longitude));
                getGroupPlaceDetails(context, i);
                // );
              }));
        }
        // ));
      }
    });
  }

  getGroupPlaceDetails(BuildContext context, int index) async {
    List<dynamic> dataList = FFAppState().groupLocs;
    if (dataList.isNotEmpty) {
      dynamic dataBox = dataList[index];
      if (dataBox != null) {
        await showModalBottomSheet(
            context: context,
            isDismissible: false,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24))),
            builder: (context) {
              var locDetails = dataBox["loc_details"];
              return Stack(children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox.shrink(),
                              Container(
                                  height: 5,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black54,
                                  )),
                              const SizedBox.shrink()
                            ]),
                        const SizedBox(height: 50),
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    child: locDetails["place_name"].length > 25
                                        ? FittedBox(
                                            alignment: Alignment.centerLeft,
                                            child: CustomText(
                                              text: locDetails["place_name"]
                                                  .toString(),
                                              weight: FontWeight.w600,
                                              size: 15,
                                            ),
                                          )
                                        : CustomText(
                                            text: locDetails["place_name"]
                                                .toString(),
                                            weight: FontWeight.w600,
                                            size: 15,
                                          ),
                                  ),
                                  const SizedBox(height: 10),
                                  // CustomText(
                                  //   text: locDetails["day_hours"].toString(),
                                  //   weight: FontWeight.w500,
                                  //   size: 13,
                                  //   color: Colors.black,
                                  // ),
                                  buildMapInfoTap(
                                    context,
                                    icon: Icons.access_time,
                                    label: locDetails["day_hours"].toString(),
                                  ),
                                  const SizedBox(height: 15),
                                  buildMapInfoTap(
                                    context,
                                    icon: Icons.location_city,
                                    label:
                                        "${locDetails["address"]}, ${locDetails["country"]}. ",
                                  ),
                                  const SizedBox(height: 15),
                                  buildMapInfoTap(
                                    context,
                                    icon: Icons.phone,
                                    label: locDetails["phone"] ?? "N/A",
                                  ),
                                  const SizedBox(height: 15),
                                  buildMapInfoTap(
                                    context,
                                    icon: Icons.wb_cloudy,
                                    label: locDetails["website"] ?? "N/A",
                                  ),
                                  const SizedBox(height: 30),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              FFAppState().toEditJson = dataBox;
                                              print(
                                                  "toEditJson: ${FFAppState().toEditJson}");
                                            });

                                            widget.updateAction();
                                            Navigator.pop(context);
                                          },
                                          style: TextButton.styleFrom(
                                              foregroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              backgroundColor: Colors.green,
                                              fixedSize: Size(100, 50)),
                                          child: Text(
                                            "Update",
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            FFAppState().deleteId =
                                                dataBox["_id"];

                                            print(
                                                "deleteId: ${FFAppState().deleteId}");

                                            widget.deleteAction();
                                            Navigator.pop(context);
                                          },
                                          style: TextButton.styleFrom(
                                              foregroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              backgroundColor: Colors.red,
                                              fixedSize: Size(100, 50)),
                                          child: Text(
                                            "Delete",
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ]),
                                ]),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ]),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.black54,
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ]);
            });
      }
    }
  }

  Set<Marker> getmarkers(
      List<String>? PlaceIds,
      List<LatLng>? locationInfo,
      List<LatLng>? dblocationInfo,
      List<String>? dbAddress,
      List<String>? googeAddress,
      latlng.LatLng origin,
      bool clearmap,
      BuildContext context,
      List<LatLng>? groupLocList,
      List<String>? groupLocAddress,
      List<String>? googleLocsId) {
    debugPrint(
        "from the getmarkers section checking the given address:: $dbAddress::::> googleAddress::: $googeAddress::::locationInf0::>>>$locationInfo::::placeIds::::$PlaceIds");

    debugPrint(
        "from the getmarkers section checking the clearmarker value:::0:: $clearmap :::");
    if (clearmap) {
      setState(() {
        polyline.clear();
      });
      debugPrint(
          "from the getmarkers section checking the clearmarker value:::1:: $clearmap :::");
      if (markers.length >= 1) {
        debugPrint(
            "from the getmarkers section checking the clearmarker value:::2:: $clearmap :::");
        removeMarker();
      }
      if (FFAppState().isAuthUser == true) {
        _getDraggableMarkers(origin, clearmap, context);
      }
    } else {
      debugPrint(
          "from the getmarkers section checking the clearmarker value:::3:: ${markers.length} :::");
      if (markers.length > 1) {
        debugPrint(
            "from the getmarkers section checking the clearmarker value:::4:: $clearmap :::");

        setState(() {});
      }

      if (FFAppState().isAuthUser == true) {
        _getDraggableMarkers(origin, clearmap, context);
      }
      if (FFAppState().showMyLocs == true) {
        addGroupLocs(origin, clearmap, context, groupLocList, groupLocAddress,
            googleLocsId);
      }
      if (locationInfo == null) {
        debugPrint("Location Info is null");
      }
      if (locationInfo != null) {
        debugPrint("$locationInfo.length");
        debugPrint("This is run");
        for (var i = 0; i < locationInfo.length; i++) {
          markers.add(Marker(
              markerId: MarkerId(PlaceIds!.elementAt(i)),
              position: latlng.LatLng(locationInfo[i].latitude,
                  locationInfo[i].longitude), //position of marker
              infoWindow: InfoWindow(title: googeAddress!.elementAt(i)),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueBlue),
              onTap: () async {
                //logic for direction api request
                if (FFAppState().showBottomSheet) {
                  FFAppState().showBottomSheet = false;
                }
                _computePath(
                    latlng.LatLng(origin!.latitude, origin!.longitude),
                    latlng.LatLng(
                        locationInfo[i].latitude, locationInfo[i].longitude));

                getPlaceDetail(context, PlaceIds.elementAt(i), locationInfo[i]);
                destinationCoords = latlng.LatLng(
                    locationInfo[i].latitude, locationInfo[i].longitude);
              }));
        }
        debugPrint("G Markers $markers");
      }

      if (dblocationInfo != null) {
        for (var i = 0; i < dblocationInfo.length; i++) {
          markers.add(Marker(
              markerId: MarkerId(PlaceIds!.elementAt(i)),
              position: latlng.LatLng(dblocationInfo[i].latitude,
                  dblocationInfo[i].longitude), //position of marker
              infoWindow: InfoWindow(title: dbAddress!.elementAt(i)),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueOrange),
              onTap: () async {
                _computePath(
                    latlng.LatLng(origin!.latitude, origin!.longitude),
                    latlng.LatLng(dblocationInfo[i].latitude,
                        dblocationInfo[i].longitude));
              }));
        }
        debugPrint("Db Markers $markers");
        debugPrint("Db Markers ${markers.length}");
      }
    }
    setState(() {});
    return markers;
  }

  getPlaceDetail(
      BuildContext context, String? PlaceIds, LatLng? locationInfo) async {
    //logic for getting more details from google api
    ///
    ///ADDING OF PRELOADER
    ///
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24))),
        builder: (context) {
          return SizedBox(
              height: 100,
              width: double.infinity,
              child:
                  Center(child: CircularProgressIndicator(color: Colors.red)));
        });

    ///
    ///
    ///
    if (PlaceIds != null && locationInfo != null) {
      Map<String, dynamic>? markerDetails;
      var markerId = PlaceIds;
      List<Elements?>? distanceListInfo;

      String getdetailUrl =
          'https://corsproxy.io/?https://maps.googleapis.com/maps/api/place/details/json?placeid=$markerId&key=$googleMapsApiKey';
      try {
        Map<String, String> headers = {
          'Origin':
              '*', // Replace with the origin of your client (your Flutter app's domain)
          'X-Requested-With':
              'XMLHttpRequest', // Indicate that the request was sent using XMLHttpRequest
        };
        final response =
            await http.get(Uri.parse(getdetailUrl), headers: headers);
        if (response.statusCode == 200) {
          final jsonResponse = json.decode(response.body);
          // debugPrint("::::::details url:::: $getdetailUrl");
          // debugPrint(":::::: details:::: $jsonResponse");
          if (jsonResponse['status'] == 'OK') {
            markerDetails = jsonResponse['result'];
            String getdistancetimeUrl =
                'https://corsproxy.io/?https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=${widget.origin!.latitude}, ${widget.origin!.longitude}&destinations=${locationInfo.latitude},${locationInfo.longitude}&key=$googleMapsApiKey';

            try {
              final distanceTimeResponse =
                  await http.get(Uri.parse(getdistancetimeUrl));
              if (response.statusCode == 200) {
                final parsed = json.decode(distanceTimeResponse.body);

                DistanceTime distanceTime = DistanceTime.fromJson(parsed);

                //final jsonResponse = json.decode(distanceTimeResponse.body);

                List<Elements?> elements = [];

                if (distanceTime.status == 'OK') {
                  // debugPrint("::::: from the distance room element row:::0");
                  if (distanceTime.rows != null &&
                      distanceTime.rows!.length != 0) {
                    // debugPrint("::::: from the distance room element row:::1");
                    for (var i = 0; i < distanceTime.rows!.length; i++) {
                      // debugPrint(
                      //     "::::: from the distance room element row:::2");
                      for (var j = 0;
                          j < distanceTime.rows!.elementAt(i).elements!.length;
                          j++) {
                        // debugPrint(
                        //     "::::: from the distance room element row:::3");
                        if (distanceTime.rows
                                ?.elementAt(i)
                                .elements
                                ?.elementAt(j) !=
                            null) {
                          // debugPrint(
                          //     "::::: from the distance room element row:::4:: ${distanceTime.rows?.elementAt(i).elements?.elementAt(j)}");
                          elements.add(distanceTime.rows
                              ?.elementAt(i)
                              .elements
                              ?.elementAt(j));
                        }
                      }
                    }
                  }
                  elements.isNotEmpty ? distanceListInfo = elements : null;
                  // debugPrint(
                  //     "::::: from the distance room element row::: $elements");
                  // print(distanceTime.rows?.elementAt(0).elements?.elementAt(0));

                  ///
                  ///Location for details 2
                  ///
                } else {
                  // debugPrint("::::: from the distance room element row:::5");
                  print(
                      'Failed to get distance and time. Status code: ${distanceTimeResponse.statusCode}');
                }

                // if (jsonResponse['status'] == 'OK') {

                // } else {
                //   print(
                //       'Failed to get distance and time. Status code: ${distanceTimeResponse.statusCode}');
                // }
              }
            } catch (e) {
              print('Error getting place distance and time: $e');
            }
            /*return {
                          'placeName': placeName,
                          'formattedPhoneNumber': formattedPhoneNumber,
                          'website': website,
                        };*/
          }
        } else {
          print(
              'Failed to load place details. Status code: ${response.statusCode}');
        }
      } catch (e) {
        print('Error fetching place details: $e');
      }

      ///
      /// THE BOTTOMSHEET CALLER
      ///
      if (markerDetails != null && distanceListInfo != null) {
        Navigator.pop(context);
        // debugPrint(":::::::: we have entered the bottomsheet caller::::");
        final res = await showModalBottomSheet(
            context: context,
            isDismissible: false,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24))),
            builder: (context) {
              FFAppState().update(() {
                FFAppState().isDestinationSelected = true;
              });
              return MakerBottomDetailsBuilder(
                dataInfo: markerDetails!,
                distanceInfo: getShortestDistance(distanceListInfo!)!,
              );
            });
      }
    }
  }

  String getSocketMessage() {
    String userEmail = FFAppState().guestEmail.toString();
    String companyId = FFAppState().guestCompanyId.toString();
    String userId = FFAppState().guestUserId.toString();
    String lat = currentPosition!.latitude.toString();
    String lng = currentPosition!.longitude.toString();
    String linkId = "";

    Map<String, dynamic> jsonObject = {
      "user_email": userEmail,
      "company_id": companyId,
      "user_id": userId,
      "lat": lat,
      "lng": lng,
      "link_id": linkId,
    };

    String jsonString = jsonEncode(jsonObject);
    print("JsonString::: $jsonString");

    return jsonString;
  }

  void activateSocket() async {
    socket =
        IO.io("https://tracking.uxlivinglab.online/socket", <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    });

    // Connect to the server
    socket?.connect();
  }

  void addSocketMessage() {
    print("Websocket Event sent successfully::::: 0");
    if (socket != null) {
      // String userEmail = FFAppState().guestEmail;
      // String companyId = "65a8bb1f2d73765634fdcaf5";
      // String userId = generateRandomString(10);
      // String lat = currentPosition!.latitude.toString();
      // String lng = currentPosition!.longitude.toString();
      // String linkId = "";

      // Map<String, dynamic> jsonObject = {
      //   "user_email": userEmail,
      //   "company_id": companyId,
      //   "user_id": userId,
      //   "lat": lat,
      //   "lng": lng,
      //   "link_id": linkId
      // };

      // String jsonString = jsonEncode(jsonObject);

      print("jsonString::::: $getSocketMessage()");

      try {
        print("Websocket Event sent successfully::::: 33");
        socket?.emit('sendMessage', getSocketMessage());
        //socket?.emit('sendMessage', "my json body");
      } catch (e) {
        print("Error:: $e");
      }

      print("Websocket Event sent successfully::::: 12");
    }
  }

  ///
  ///LOGIC TO GET THE SHORTEST DISTANCE
  ///
  Elements? getShortestDistance(List<Elements?> data) {
    if (data.isNotEmpty) {
      Elements shortestElement = data[0]!;
      //This is to prevent unnessary iterations
      if (data.length == 1) {
        return shortestElement;
      }
      for (Elements? element in data) {
        if (element!.distance!.value! < shortestElement.distance!.value!) {
          shortestElement = element;
        }
        return shortestElement;
      }
    }
    return null;
  }

  removeMarker() {
    for (latlng.Polyline? line in polyline) {
      polyline.removeWhere((m) => m.polylineId.value == line?.polylineId);
      //polyline.removeWhere((key, value) => key == line?.polylineId);
    }
    //polyline.removeWhere((key, value) => key == polyline.polylineId);
    // polyline.clear();
    if (markers.length > 1) {
      polyline.clear();
      final firstMarker = markers.first;
      markers.clear();
      markers.add(firstMarker);
    }

    setState(() {});
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

//COMPUTE DISTANCE
  _computePath(latlng.LatLng origin, latlng.LatLng destination) async {
    routeCoords = await googleMapPolyline?.getCoordinatesWithLocation(
        origin: origin, destination: destination, mode: RouteMode.driving);

    // debugPrint("Result --- ${routeCoords}");
    zoomValue = 17;
    CameraPosition nepPos = CameraPosition(
        target: origin, zoom: zoomValue, bearing: 180.0, tilt: 30.0);

    _controller?.animateCamera(CameraUpdate.newCameraPosition(nepPos));

    setState(() {
      for (latlng.Polyline? line in polyline) {
        polyline.removeWhere((m) => m.polylineId.value == line?.polylineId);
        // polyline.removeWhere((key, value) => key == line?.polylineId);
      }
      //polyline.removeWhere((key, value) => key == polyline.polylineId);
      polyline.clear();
      if (routeCoords != null) {
        polyline.add(latlng.Polyline(
            polylineId: latlng.PolylineId('iter'),
            visible: true,
            points: routeCoords!,
            width: 4,
            color: Color(0xff0746F8),
            startCap: Cap.roundCap,
            endCap: Cap.buttCap));
      }
    });
  }

  ///
  ///
  ///
  _computeTrackingPath(latlng.LatLng origin, latlng.LatLng destination) async {
    routeCoords = await googleMapPolyline?.getCoordinatesWithLocation(
        origin: origin, destination: destination, mode: RouteMode.driving);

    // debugPrint("Result --- ${routeCoords}");
    zoomValue = 17;
    CameraPosition nepPos = CameraPosition(
        target: origin, zoom: zoomValue, bearing: 180.0, tilt: 30.0);

    _controller?.animateCamera(CameraUpdate.newCameraPosition(nepPos));

    setState(() {
      // if(polyline.keys.contain('tracking')){
      for (latlng.Polyline? line in polyline) {
        polyline.removeWhere((m) => m.polylineId == 'tracking');
        // polyline.removeWhere((key, value) => key == line?.polylineId);
      }
      // polyline.removeWhere((key, value) => key == polyline.polylineId);
      if (routeCoords != null) {
        polyline.add(latlng.Polyline(
            polylineId: latlng.PolylineId('tracking'),
            visible: true,
            points: routeCoords!,
            width: 2,
            color: Color(0xffF8B907),
            startCap: Cap.roundCap,
            endCap: Cap.buttCap));
      }
    });
  }

  // function for place picked

  latlng.LatLng getPlacePicker() {
    // debugPrint("Marker Length --0- ${markers.length}");
    if (markers.length >= 1) {
      // debugPrint("from getPlacePicker the inner room clear marker is called");
      markers.clear();
      setState(() {});
    }

    // debugPrint("Marker Length --1- ${markers.length}");

    placepicked =
        (widget.origin!.latitude == 0 && widget.origin!.longitude == 0)
            ? latlng.LatLng(position?.latitude ?? 0, position?.longitude ?? 0)
            : latlng.LatLng(widget.origin!.latitude, widget.origin!.longitude);
    // debugPrint(":::::; from the marker trancing::: 3");

    // debugPrint("placepicked Latitude--- ${placepicked}");
    markers.add(Marker(
      markerId: MarkerId(generateRandomString(10)),
      position: placepicked, //position of marker
      infoWindow: InfoWindow(
          //popup info
          title: "Starting Point"),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));

    // debugPrint("Marker Length --- ${markers.length}");
    zoomValue = 14;
    _controller?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: placepicked, zoom: zoomValue, bearing: 180.0, tilt: 30.0)));
    // debugPrint("Place picked $placepicked");

    setState(() {});
    return placepicked;
  }
}

///
/// TO REPLACE FROM HERE
///
class DistanceTime {
  List<String>? destinationAddresses;
  List<String>? originAddresses;
  List<Rows>? rows;
  String? status;

  DistanceTime(
      {this.destinationAddresses,
      this.originAddresses,
      this.rows,
      this.status});

  DistanceTime.fromJson(Map<String, dynamic> json) {
    destinationAddresses = json['destination_addresses'].cast<String>();
    originAddresses = json['origin_addresses'].cast<String>();
    if (json['rows'] != null) {
      rows = <Rows>[];
      json['rows'].forEach((v) {
        rows!.add(new Rows.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['destination_addresses'] = this.destinationAddresses;
    data['origin_addresses'] = this.originAddresses;
    if (this.rows != null) {
      data['rows'] = this.rows!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

///
class Rows {
  List<Elements>? elements;

  Rows({this.elements});

  Rows.fromJson(Map<String, dynamic> json) {
    if (json['elements'] != null) {
      elements = <Elements>[];
      json['elements'].forEach((v) {
        elements!.add(new Elements.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.elements != null) {
      data['elements'] = this.elements!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

///
class Elements {
  Distance? distance;
  Distance? duration;
  String? status;

  Elements({this.distance, this.duration, this.status});

  Elements.fromJson(Map<String, dynamic> json) {
    distance = json['distance'] != null
        ? new Distance.fromJson(json['distance'])
        : null;
    duration = json['duration'] != null
        ? new Distance.fromJson(json['duration'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.distance != null) {
      data['distance'] = this.distance!.toJson();
    }
    if (this.duration != null) {
      data['duration'] = this.duration!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

///
class Distance {
  String? text;
  int? value;

  Distance({this.text, this.value});

  Distance.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['value'] = this.value;
    return data;
  }
}

///
/// IT ENDS HERE
///

//TODO: To be make better later
class CustomText extends StatelessWidget {
  final String text;
  final double? size;
  final bool? isCenter;
  final FontStyle? isItalic;
  final Color? color;
  final TextOverflow? overflow;
  final FontWeight? weight;
  const CustomText({
    Key? key,
    required this.text,
    this.size,
    this.color,
    this.weight,
    this.isCenter,
    this.isItalic,
    this.overflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: (isCenter == true) ? TextAlign.center : TextAlign.left,
      overflow: overflow ?? TextOverflow.clip,
      style: TextStyle(
        fontStyle: isItalic ?? FontStyle.normal,
        fontWeight: weight ?? FontWeight.normal,
        color: color ?? Colors.black,
        fontSize: size ?? 16,
      ),
    );
  }
}

///
/// LOGIC FOR RATING
///
RatingBar generateRating(
    {required double rate, Color? color, double? size, bool? allowHalfRating}) {
  return RatingBar(
    initialRating: rate,
    itemSize: size ?? 12,
    direction: Axis.horizontal,
    allowHalfRating: allowHalfRating ?? false,
    itemCount: 5,
    ignoreGestures: true,
    ratingWidget: RatingWidget(
      full: Icon(Icons.star, color: color ?? Colors.green),
      half: Icon(Icons.star_half, color: color ?? Colors.green),
      empty: Icon(Icons.star_border_outlined, color: color ?? Colors.grey),
    ),
    itemPadding: const EdgeInsets.symmetric(horizontal: 0),
    onRatingUpdate: (rating) {
      print(rating);
    },
  );
}

///
class MakerBottomDetailsBuilder extends StatefulWidget {
  final Map<String, dynamic> dataInfo;
  final Elements distanceInfo;
  const MakerBottomDetailsBuilder(
      {super.key, required this.dataInfo, required this.distanceInfo});

  @override
  State<MakerBottomDetailsBuilder> createState() =>
      _MakerBottomDetailsBuilderState();
}

class _MakerBottomDetailsBuilderState extends State<MakerBottomDetailsBuilder> {
  @override
  Widget build(BuildContext context) {
    debugPrint(":::::marker Details:::: ${widget.dataInfo}");
    return Stack(children: [
      Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.7,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const SizedBox.shrink(),
            Container(
                height: 5,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black54,
                )),
            const SizedBox.shrink()
          ]),
          const SizedBox(height: 50),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  //
                  // TESTER 3
                  //
                  if (widget.dataInfo["icon_background_color"] != null &&
                      widget.dataInfo["icon"] != null)
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Color(
                        int.tryParse(widget.dataInfo["icon_background_color"]
                                .replaceFirst("#", "0xff")) ??
                            0xff000000,
                      ),
                      child: Image.network(
                        widget.dataInfo["icon"],
                        height: 20,
                        width: 20,
                        fit: BoxFit.cover,
                      ),
                    ),
                  const SizedBox(width: 10),

                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: FittedBox(
                      alignment: Alignment.centerLeft,
                      child: CustomText(
                        text: widget.dataInfo["name"],
                        weight: FontWeight.w600,
                        size: 20,
                      ),
                    ),
                  ),
                ]),
                const SizedBox(height: 5),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  //
                  // TESTER 2
                  //
                  generateRating(
                      rate: widget.dataInfo["rating"] != null
                          ? double.parse(widget.dataInfo["rating"].toString())
                          : 0,
                      allowHalfRating: true),
                  const SizedBox(width: 15),
                  //
                  // TESTER 1
                  //
                  widget.dataInfo["opening_hours"] != null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                              Container(
                                height: 12,
                                width: 3,
                                color: Colors.black54,
                              ),
                              const SizedBox(width: 15),
                              CustomText(
                                text: widget.dataInfo["opening_hours"]
                                        ["open_now"]
                                    ? "OPEN"
                                    : "CLOSE",
                                weight: FontWeight.w500,
                                size: 13,
                                color: widget.dataInfo["opening_hours"]
                                        ["open_now"]
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ])
                      : SizedBox.shrink(),
                ]),

                ///
                ///
                ///
                const SizedBox(height: 15),
                buildMapInfoTap(
                  context,
                  icon: Icons.location_city,
                  label: widget.dataInfo["formatted_address"] ?? "N/A",
                ),
                const SizedBox(height: 15),
                buildMapInfoTap(
                  context,
                  icon: Icons.phone,
                  label: widget.dataInfo["formatted_phone_number"] ?? "N/A",
                ),

                //
                // TESTER 2
                //
                const SizedBox(height: 15),
                buildMapInfoTap(
                  context,
                  icon: Icons.social_distance,
                  label:
                      "${widget.distanceInfo.distance?.value ?? "N/A"}m ( ${((widget.distanceInfo.distance?.value ?? 0) / 1000).toStringAsFixed(2)} Km )",
                ),
                //
                // TESTER 2
                //
                const SizedBox(height: 15),
                buildMapInfoTap(
                  context,
                  icon: Icons.timer,
                  label: "${widget.distanceInfo.duration?.text ?? "N/A"}",
                ),

                ///
                ///
                ///
                const SizedBox(height: 15),
                buildMapInfoTap(
                  context,
                  icon: Icons.wb_cloudy,
                  label: widget.dataInfo["website"] ?? "N/A",
                ),
              ]),
            ),
          ),
        ]),
      ),
      Positioned(
        top: 10,
        right: 10,
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const CircleAvatar(
            backgroundColor: Colors.black54,
            child: Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
        ),
      )
    ]);
  }
}

//TODO: convert to custom widget
Row buildMapInfoTap(BuildContext context,
    {required String label, required IconData icon}) {
  return Row(children: [
    Icon(
      icon,
      color: Colors.black26,
    ),
    const SizedBox(width: 10),
    SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: CustomText(
        text: label,
        overflow: TextOverflow.clip,
        color: Colors.black54,
        weight: FontWeight.w500,
      ),
    )
  ]);
}
