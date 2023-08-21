import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';
import '../cloud_functions/cloud_functions.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class LinkBageLoginCall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? os = '',
    String? device = '',
    String? browser = '',
    String? location = '',
    String? time = '',
    String? connection = '',
    String? ip = '',
  }) {
    final body = '''
{
  "Username": "${username}",
  "OS": "${os}",
  "Device": "${device}",
  "Browser": "${browser}",
  "Location": "${location}",
  "Time": "${time}",
  "Connection": "${connection}",
  "IP": "${ip}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'link bage login ',
      apiUrl: 'https://100014.pythonanywhere.com/api/linkbased/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic sessionID(dynamic response) => getJsonField(
        response,
        r'''$.qrid''',
      );
}

class CreateRoomForDigitalQCall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? qrid = '',
    String? product = 'DigitalQ',
  }) {
    final body = '''
{
  "user_name": "${username}",
  "qrid": "${qrid}",
  "product": "${product}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'create room for digitalQ',
      apiUrl: 'https://100069.pythonanywhere.com/chat/create-room',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class NearbyPlaceCall {
  static Future<ApiCallResponse> call({
    String? query = 'school',
    String? location = '6.5243793, 3.3792057',
    int? radius = 2000,
    String? key = 'AIzaSyAsH8omDk8y0lSGLTW9YtZiiQ2MkmsF-uQ',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'NearbyPlaceCall',
        'variables': {
          'query': query,
          'location': location,
          'radius': radius,
          'key': key,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static dynamic lat(dynamic response) => getJsonField(
        response,
        r'''$.results[:].geometry.location.lat''',
        true,
      );
  static dynamic lng(dynamic response) => getJsonField(
        response,
        r'''$.results[:].geometry.location.lng''',
        true,
      );
  static dynamic placeID(dynamic response) => getJsonField(
        response,
        r'''$.results[:].place_id''',
        true,
      );
  static dynamic address(dynamic response) => getJsonField(
        response,
        r'''$.results[:].formatted_address''',
        true,
      );
  static dynamic placeName(dynamic response) => getJsonField(
        response,
        r'''$.results[:].name''',
        true,
      );
  static dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      );
  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
}

class DirectionCall {
  static Future<ApiCallResponse> call({
    String? origin = '',
    String? destination = '',
    String? mode = '',
    String? waypoint = '',
    String? key = 'AIzaSyAsH8omDk8y0lSGLTW9YtZiiQ2MkmsF-uQ',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'DirectionCall',
        'variables': {
          'origin': origin,
          'destination': destination,
          'mode': mode,
          'waypoint': waypoint,
          'key': key,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class DirectionDetailsCall {
  static Future<ApiCallResponse> call() async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'DirectionDetailsCall',
        'variables': {},
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateEventCall {
  static Future<ApiCallResponse> call({
    String? ipAddress = '192.168.0.155',
    String? loginId = '',
    String? sessionId = '',
    String? regionalTime = '',
    String? dowellTime = '',
    String? location = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateEventCall',
        'variables': {
          'ipAddress': ipAddress,
          'loginId': loginId,
          'sessionId': sessionId,
          'regionalTime': regionalTime,
          'dowellTime': dowellTime,
          'location': location,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static dynamic eventID(dynamic response) => getJsonField(
        response,
        r'''$.event_id''',
      );
  static dynamic isSuccess(dynamic response) => getJsonField(
        response,
        r'''$.is_success''',
      );
}

class NearbyPlacesDataCall {
  static Future<ApiCallResponse> call({
    String? startLocation = '',
    String? queryText = '',
    String? radiusDistanceFrom = '',
    String? eventId = '',
    String? radiusDistanceTo = '',
    String? startAddress = '',
    bool? isError,
    String? error = '',
    String? dateTimeDone = '',
    dynamic? latLongJson,
    List<String>? addressList,
    String? data = '',
    dynamic? responseJson,
  }) {
    final address = _serializeList(addressList);
    final latLong = _serializeJson(latLongJson);
    final response = _serializeJson(responseJson);
    final body = '''
{
  "cluster": "dowellmap",
  "database": "dowellmap",
  "collection": "nearby_places_req",
  "document": "nearby_places_req",
  "team_member_ID": "1153",
  "function_ID": "ABCDE",
  "command": "insert",
  "field": {
    "eventId": "${eventId}",
    "start_address": "${startAddress}",
    "start_lat_lon": "${startLocation}",
    "url": "None",
    "query_text": "${queryText}",
    "radius_distance_from": "${radiusDistanceFrom}",
    "radius_distance_to": "${radiusDistanceTo}",
    "is_error": ${isError},
    "error": "${error}",
    "data_time_done": "${dateTimeDone}"
  },
  "update_field": {
    "order_nos": 1
  },
  "platform": "bangalore"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Nearby Places Data',
      apiUrl: 'https://uxlivinglab.pythonanywhere.com/',
      callType: ApiCallType.POST,
      headers: {
        'Access-Control-Allow-Origin': '*',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic success(dynamic response) => getJsonField(
        response,
        r'''$.isSuccess''',
      );
  static dynamic insertID(dynamic response) => getJsonField(
        response,
        r'''$.inserted_id''',
      );
}

class SendLogDataCall {
  static Future<ApiCallResponse> call({
    String? mongoID = '',
    String? reqID = '',
    String? reqType = '',
    String? eventId = '',
    String? dataTimeDone = '',
    String? userName = '',
    String? sessionId = '',
    String? locationDone = '',
  }) {
    final body = '''
{
  "cluster": "dowellmap",
  "collection": "log",
  "command": "insert",
  "database": "dowellmap",
  "document": "log",
  "field": {
    "data_time_done": "${dataTimeDone}",
    "eventId": "${eventId}",
    "location_done": "${locationDone}",
    "req_type": "${reqType}",
    "session_id": "${sessionId}",
    "user_name": "${userName}",
    "mongo_id": "${mongoID}",
    "req_id": "${reqID}"
  },
  "function_ID": "ABCDE",
  "platform": "bangalore",
  "team_member_ID": "1155",
  "update_field": {
    "order_nos": 1
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send Log Data',
      apiUrl: 'https://uxlivinglab.pythonanywhere.com/',
      callType: ApiCallType.POST,
      headers: {
        'Access-Control-Allow-Origin': '*',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class IpifyCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'ipify',
      apiUrl: 'https://api.ipify.org/?format=json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic deviceIP(dynamic response) => getJsonField(
        response,
        r'''$.ip''',
      );
}

class MymapCall {
  static Future<ApiCallResponse> call({
    String? placeName = '',
    String? category = '',
    String? address = '',
    String? locationCord = '',
    String? dayHours = '',
    String? phone = '',
    String? website = '',
    String? hours = '',
    String? typeOfData = '',
    String? eventId = '',
    bool? isTestData = true,
    String? country = '',
  }) {
    final body = '''
{
  "cluster": "dowellmap",
  "database": "dowellmap",
  "collection": "my_map",
  "document": "my_map",
  "team_member_ID": "1164",
  "function_ID": "ABCDE",
  "command": "insert",
  "field": {
    "place_name": "${placeName}",
    "category": "${category}",
    "address": "${address}",
    "country": "${country}",
    "location_coord": "${locationCord}",
    "day_hours": "${dayHours}",
    "phone": "${phone}",
    "website": "${website}",
    "hours": "${hours}",
    "type_of_data": "${typeOfData}",
    "eventId": "${eventId}",
    "is_test_data": ${isTestData}
  },
  "update_field": {
    "order_nos": 21
  },
  "platform": "bangalore"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'mymap',
      apiUrl: 'https://uxlivinglab.pythonanywhere.com/',
      callType: ApiCallType.POST,
      headers: {
        'Access-Control-Allow-Origin': '*',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic isSuccessful(dynamic response) => getJsonField(
        response,
        r'''$.isSuccess''',
      );
  static dynamic insertedIDD(dynamic response) => getJsonField(
        response,
        r'''$.inserted_id''',
      );
}

class GetMymapCall {
  static Future<ApiCallResponse> call({
    double? radius1,
    double? radius2,
    double? centerLat,
    double? centerLon,
    String? query = '',
    String? dataType = '',
    String? apiKey = 'EhdQUTM2K0hNLCBOYWlyb2JpLCBLZW55YSImOiQKCg2PPDr',
  }) {
    final body = '''
{
  "radius1": ${radius1},
  "radius2": ${radius2},
  "center_lat": ${centerLat},
  "center_lon": ${centerLon},
  "query_string": "${query}",
  "data_type": "registered",
  "api_key": "${apiKey}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetMymap',
      apiUrl: 'https://100086.pythonanywhere.com/accounts/get-local-nearby/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic locationCord(dynamic response) => getJsonField(
        response,
        r'''$.data[:].location_coord''',
        true,
      );
  static dynamic distance(dynamic response) => getJsonField(
        response,
        r'''$.data[:].hav_distances''',
        true,
      );
  static dynamic category(dynamic response) => getJsonField(
        response,
        r'''$.data[:].category''',
        true,
      );
  static dynamic placeId(dynamic response) => getJsonField(
        response,
        r'''$.data[:].place_id''',
        true,
      );
  static dynamic placeName(dynamic response) => getJsonField(
        response,
        r'''$.data[:].place_name''',
        true,
      );
  static dynamic refinedData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class GetCategoryCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Category',
      apiUrl: 'https://100086.pythonanywhere.com/accounts/get-categories/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic categoryList(dynamic response) => getJsonField(
        response,
        r'''$.categories''',
        true,
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
