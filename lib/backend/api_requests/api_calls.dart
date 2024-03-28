import 'dart:convert';
import 'dart:typed_data';
import '../cloud_functions/cloud_functions.dart';
import '../schema/structs/index.dart';

import '/flutter_flow/flutter_flow_util.dart';
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
  }) async {
    final ffApiRequestBody = '''
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
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? sessionID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.qrid''',
      ));
}

class CreateRoomForDigitalQCall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? qrid = '',
    String? product = 'DigitalQ',
  }) async {
    final ffApiRequestBody = '''
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
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
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

  static List<double>? lat(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].geometry.location.lat''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<double>? lng(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].geometry.location.lng''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<String>? placeID(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].place_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].formatted_address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? placeName(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? data(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      ) as List?;
  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
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

  static String? eventID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.event_id''',
      ));
  static bool? isSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.is_success''',
      ));
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
  }) async {
    final address = _serializeList(addressList);
    final latLong = _serializeJson(latLongJson);
    final response = _serializeJson(responseJson);
    final ffApiRequestBody = '''
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
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.isSuccess''',
      ));
  static String? insertID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.inserted_id''',
      ));
}

class SendLogDataCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Send Log Data',
      apiUrl: 'https://www.qrcodereviews.uxlivinglab.online/api/v3/masterlink/',
      callType: ApiCallType.GET,
      headers: {
        'Access-Control-Allow-Origin': '*',
      },
      params: {
        'api_key': "2304034444490576366",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class IpifyCall {
  static Future<ApiCallResponse> call() async {
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
      alwaysAllowBody: false,
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
  }) async {
    final ffApiRequestBody = '''
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
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
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
  }) async {
    final ffApiRequestBody = '''
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
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? locationCord(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].location_coord''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<double>? distance(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].hav_distances''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<String>? category(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].category''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? placeId(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].place_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? placeName(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].place_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? refinedData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetCategoryCall {
  static Future<ApiCallResponse> call() async {
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
      alwaysAllowBody: false,
    );
  }

  static List<String>? categoryList(dynamic response) => (getJsonField(
        response,
        r'''$.categories''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetUserAPIKeyCall {
  static Future<ApiCallResponse> call({
    String? type = 'get_api_key',
    String? workspaceId = '63a2b3fb2be81449d3a30d3f',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get User API Key',
      apiUrl: 'https://100105.pythonanywhere.com/api/v3/user/',
      callType: ApiCallType.GET,
      headers: {
        'Accept': '*/*',
      },
      params: {
        'type': type,
        'workspace_id': workspaceId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  static bool? isActive(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data.is_active''',
      ));
  static String? apiKey(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.api_key''',
      ));
  static dynamic totalCredits(dynamic response) => getJsonField(
        response,
        r'''$.data.total_credits''',
      );
}

class ProcessProductRequestCall {
  static Future<ApiCallResponse> call({
    String? type = 'api_service',
    String? apiKey = '',
    String? serviceId = '',
    String? subServiceIds = '',
  }) async {
    final ffApiRequestBody = '''
{
  "sub_service_ids": [
    "${subServiceIds}"
  ],
  "service_id": "${serviceId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Process Product Request',
      apiUrl:
          'https://100105.pythonanywhere.com/api/v3/process-services/?type=product_service&api_key=${apiKey}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic credits(dynamic response) => getJsonField(
        response,
        r'''$.remaining_credits''',
      );
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class GetLocationByUserCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? username = '',
    String? docType = '',
  }) async {
    final ffApiRequestBody = '''
{
  "filters": {
    "username": "${username}",
    "doc_type": "${docType}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Location by User',
      apiUrl:
          'https://100086.pythonanywhere.com/accounts/get-locs/?api_key=${apiKey}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List? groupList(dynamic response) => getJsonField(
        response,
        r'''$.data[:].group_list''',
        true,
      ) as List?;
  static dynamic docType(dynamic response) => getJsonField(
        response,
        r'''$.data[:].doc_type''',
      );
}

class CreateProfileCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? username = '',
  }) async {
    final ffApiRequestBody = '''
{
  "username": "${username}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Profile',
      apiUrl:
          'https://100086.pythonanywhere.com/accounts/create-profile/?api_key=${apiKey}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic isSucess(dynamic response) => getJsonField(
        response,
        r'''$.success''',
      );
}

class CreateLocationGroupCall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? groupName = '',
    String? apiKey = '',
  }) async {
    final ffApiRequestBody = '''
{
  "username": "${username}",
  "group_name": "${groupName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Location Group',
      apiUrl:
          'https://100086.pythonanywhere.com/accounts/create-loc-group/?api_key=${apiKey}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateLocationCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? username = '',
    String? groupName = '',
    String? placeName = '',
    String? placeCategory = '',
    String? placeAddress = '',
    String? country = '',
    String? locationCord = '',
    String? dayHours = '',
    String? phoneNumber = '',
    String? website = '',
    String? hours = '',
    String? typeOfData = '',
    bool? isTestData,
    bool? makePublic,
    bool? isDeleted,
  }) async {
    final ffApiRequestBody = '''
{
  "username": "${username}",
  "group_name": "${groupName}",
  "loc_detail": {
    "place_name": "${placeName}",
    "category": "${placeCategory}",
    "address": "${placeAddress}",
    "country": "${country}",
    "location_coord": "${locationCord}",
    "day_hours": "${dayHours}",
    "phone": "${phoneNumber}",
    "website": "${website}",
    "hours": "${hours}",
    "type_of_data": "${typeOfData}",
    "is_test_data": ${isTestData},
    "make_public": ${makePublic},
    "is_deleted": ${isDeleted}
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Location',
      apiUrl:
          'https://100086.pythonanywhere.com/accounts/create-location/?api_key=${apiKey}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateGroupLocationCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? username = '',
    String? oldGroupName = '',
    String? newGroupName = '',
  }) async {
    final ffApiRequestBody = '''
{
  "username": "${username}",
  "old_group_name": "${oldGroupName}",
  "new_group_name": "${newGroupName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Group Location',
      apiUrl:
          'https://100086.pythonanywhere.com/accounts/update-loc-group/?api_key=${apiKey}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateLocationCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? locationId = '',
    String? placeName = '',
    String? country = '',
    String? locationCoordinate = '',
    String? dayHours = '',
    String? phoneNumber = '',
    String? website = '',
    int? hours,
    String? typeOfData = '',
    String? eventId = '',
    bool? isTestData,
    bool? makePublic,
    bool? isDeleted,
    String? category = '',
    String? address = '',
  }) async {
    final ffApiRequestBody = '''
{
  "loc_id": "${locationId}",
  "new_loc_detail": {
    "place_name": "${placeName}",
    "category": "${category}",
    "address": "${address}",
    "country": "${country}",
    "location_coord": "${locationCoordinate}",
    "day_hours": "${dayHours}",
    "phone": "${phoneNumber}",
    "website": "${website}",
    "hours": ${hours},
    "type_of_data": "${typeOfData}",
    "eventId": "${eventId}",
    "is_test_data": ${isTestData},
    "make_public": ${makePublic},
    "is_deleted": ${isDeleted}
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Location',
      apiUrl:
          'https://100086.pythonanywhere.com/accounts/update-location/?api_key=${apiKey}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteUserLocsCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? username = '',
  }) async {
    final ffApiRequestBody = '''
{
  "username": "${username}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Delete User Locs',
      apiUrl:
          'https://100086.pythonanywhere.com/accounts/delete-user-loc/?api_key=${apiKey}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteLocationGroupCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? username = '',
    String? groupName = '',
  }) async {
    final ffApiRequestBody = '''
{
  "username": "${username}",
  "group_name": "${groupName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Delete Location Group',
      apiUrl:
          'https://100086.pythonanywhere.com/accounts/delete-loc-group/?api_key=${apiKey}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteLocCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? dataId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete Loc',
      apiUrl:
          'https://100086.pythonanywhere.com/accounts/delete-loc/?api_key=${apiKey}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetLocationByGroupNameCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? username = '',
    String? groupName = '',
  }) async {
    final ffApiRequestBody = '''
{
  "filters": {
    "username": "${username}",
    "group_name": "${groupName}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Location by group name',
      apiUrl:
          'https://100086.pythonanywhere.com/accounts/get-locs/?api_key=${apiKey}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? locationId(dynamic response) => (getJsonField(
        response,
        r'''$.data[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? locationObject(dynamic response) => getJsonField(
        response,
        r'''$.data[:].loc_details''',
        true,
      ) as List?;
  static List<String>? groupName(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].group_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? locationCord(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].loc_details.location_coord''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? locationAddress(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].loc_details.address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ConvertCoordinatesCall {
  static Future<ApiCallResponse> call({
    double? length = 0,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Convert coordinates',
      apiUrl: 'https://100070.pythonanywhere.com/convert_coordinates/',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'type': "squares",
        'length': length,
        'width': length,
        'value': 1,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic allResponse(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
  static List? convertedCordinate(dynamic response) => getJsonField(
        response,
        r'''$.response.converted_coordinates''',
        true,
      ) as List?;
  static int? squareCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.response.square_count''',
      ));
}

class GuestLoginCall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? os = '',
    String? device = '',
    String? location = '',
    String? time = '',
  }) async {
    final ffApiRequestBody = '''
{
    "Username":"User_test(2)",
    "OS":"linux",
    "Device":"mobile",
    "Browser":"chrome",
    "Location":"Mumbai",
    "Time":"13-10-2022",
    "Connection":"wifi",
    "IP":"198.162.1.71"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'guest login',
      apiUrl: 'https://100014.pythonanywhere.com/api/linklogin/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetQrCodeByIdCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: ' GetQrCodeById',
      apiUrl:
          'https://www.qrcodereviews.uxlivinglab.online/api/v1/update-qr-code/${id}/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserInfoCall {
  static Future<ApiCallResponse> call({
    String? sessionId = 'xt3u83sb7rt6od6eaywidlx4v8n3n7yt',
  }) async {
    final ffApiRequestBody = '''
{
  "session_id": "${sessionId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getUserInfo',
      apiUrl: 'https://100014.pythonanywhere.com/api/userinfo/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? clientid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.userinfo.client_admin_id''',
      ));
  static List? usernames(dynamic response) => getJsonField(
        response,
        r'''$.selected_product.userportfoli''',
        true,
      ) as List?;
  static String? teammembernames(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.members.team_member[:].first_name''',
      ));
  static List? teammember(dynamic response) => getJsonField(
        response,
        r'''$.members.team_member''',
        true,
      ) as List?;
}

class FinalizedLinkCall {
  static Future<ApiCallResponse> call({
    String? linkId = '',
    String? product = '',
  }) async {
    final ffApiRequestBody = '''
{
  "is_finalized": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'FinalizedLink',
      apiUrl:
          'https://www.qrcodereviews.uxlivinglab.online/api/v3/masterlink/?link_id=${linkId}&product=${product}',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GenerateQRcodeCall {
  static Future<ApiCallResponse> call({
    dynamic? linksJson,
    String? cliendId = '',
    String? product = '',
  }) async {
    final links = _serializeJson(linksJson, true);
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GenerateQRcodeCall',
        'variables': {
          'links': links,
          'cliendId': cliendId,
          'product': product,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? imageUrl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.qrcodes[:].qrcode_image_url''',
      ));
  static String? masterLink(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.qrcodes[:].masterlink''',
      ));
}

class UpdateGuestTrackingCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? companyId = '',
    String? userId = '',
    double? lat,
    double? lng,
    String? linkId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_email": "${email}",
  "company_id": "${companyId}",
  "user_id": "${userId}",
  "lat": ${lat},
  "lng": ${lng},
  "link_id": "${linkId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateGuestTracking',
      apiUrl: 'google.com',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetPublicLinksCall {
  static Future<ApiCallResponse> call({
    String? orgId = '',
    String? product = 'LivingLab Maps ',
  }) async {
    final ffApiRequestBody = '''
{
  "org_id": "${orgId}",
  "product": "${product}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Public Links',
      apiUrl: 'https://100093.pythonanywhere.com/api/get_public_usernames/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? usernameList(dynamic response) => (getJsonField(
        response,
        r'''$.usernames''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class FetchUserCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '0699dbbb-2786-4dfa-a1db-fc12f2210228',
    String? email = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_key": "${apiKey}",
  "db_name": "dowell_tracking",
  "coll_name": "user_info",
  "operation": "fetch",
  "filters": {
    "email": "${email}"
  },
  "limit": 1,
  "offset": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Fetch User',
      apiUrl: 'https://datacube.uxlivinglab.online/db_api/get_data/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class InsertUserCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '0699dbbb-2786-4dfa-a1db-fc12f2210228',
    String? name = '',
    String? email = '',
    String? comapnyName = '',
    String? userid = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_key": "${apiKey}",
  "db_name": "dowell_tracking",
  "coll_name": "user_info",
  "operation": "insert",
  "data": {
    "id": "65a8bb1f2d73765634fdcaf5",
    "user_id": "${userid}",
    "name": "${name}",
    "email": "${email}",
    "org_name": "${comapnyName}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Insert User',
      apiUrl: 'https://datacube.uxlivinglab.online/db_api/crud/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateTeamCall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? owner = '',
    String? clientAdminId = '',
    String? teamName = '',
  }) async {
    final ffApiRequestBody = '''
{
  "username": "${username}",
  "owner": "${owner}",
  "client_admin_id": "${clientAdminId}",
  "team_name": "${teamName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Team',
      apiUrl: 'https://100093.pythonanywhere.com/api/create_team_data/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetTeamsByUsernameCall {
  static Future<ApiCallResponse> call({
    String? username = '',
  }) async {
    final ffApiRequestBody = '''
{
  "username": "${username}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetTeamsByUsername',
      apiUrl:
          'https://100093.pythonanywhere.com/api/get_team_names_by_username/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? teamList(dynamic response) => (getJsonField(
        response,
        r'''$.teams''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class AddMemberToTeamCall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? teamName = '',
    dynamic? membersJson,
    String? type = '',
  }) async {
    final members = _serializeJson(membersJson, true);
    final ffApiRequestBody = '''
{
  "username": "${username}",
  "team_name": "${teamName}",
  "members": ${members},
  "type": "team_members"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Member to Team',
      apiUrl: 'https://100093.pythonanywhere.com/api/add_member_to_team/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetMemberByTeamNameCall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? teamName = '',
    String? memberType = '',
  }) async {
    final ffApiRequestBody = '''
{
  "username": "${username}",
  "team_name": "${teamName}",
  "member_type": "${memberType}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetMemberByTeamName',
      apiUrl: 'https://100093.pythonanywhere.com/api/get_member_names_by_team/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? memberObject(dynamic response) => getJsonField(
        response,
        r'''$.members''',
        true,
      ) as List?;
  static List<String>? memebersName(dynamic response) => (getJsonField(
        response,
        r'''$.members[:].member_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? error(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error''',
      ));
}

class FindTeamByOrgIdCall {
  static Future<ApiCallResponse> call({
    String? clientAdminId = '',
    String? memberEmail = '',
  }) async {
    final ffApiRequestBody = '''
{
  "client_admin_id": "${clientAdminId}",
  "member_email": "${memberEmail}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'FindTeamByOrgId',
      apiUrl:
          'http://100093.pythonanywhere.com/api/find_teams_by_member_email/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? teamName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.teams[:].team_name''',
      ));
  static List? responseBody(dynamic response) => getJsonField(
        response,
        r'''$.teams''',
        true,
      ) as List?;
}

class SendEmailToSingleUserCall {
  static Future<ApiCallResponse> call({
    String? toname = '',
    String? toemail = '',
    String? subject = '',
    String? emailContent = '',
  }) async {
    final ffApiRequestBody = '''
{
  "toname": "${toname}",
  "toemail": "${toemail}",
  "subject": "${subject}",
  "email_content": "${emailContent}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sendEmailToSingleUser',
      apiUrl: 'https://100085.pythonanywhere.com/api/email/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SendBulkEmailCall {
  static Future<ApiCallResponse> call({
    dynamic? toEmailListJson,
    String? fromname = '',
    String? fromemail = '',
    String? subject = '',
    String? emailContent = '',
  }) async {
    final toEmailList = _serializeJson(toEmailListJson, true);
    final ffApiRequestBody = '''
{
  "to_email_list": ${toEmailList},
  "fromname": "${fromname}",
  "fromemail": "${fromemail}",
  "subject": "${subject}",
  "email_content": "${emailContent}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendBulkEmail',
      apiUrl: 'https://100085.pythonanywhere.com/api/dowell_bulk_email/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteTeamMemberCall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? teamName = '',
    String? memberEmail = '',
  }) async {
    final ffApiRequestBody = '''
{
  "username": "${username}",
  "team_name": "${teamName}",
  "member_email": "${memberEmail}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'deleteTeamMember',
      apiUrl: 'https://100093.pythonanywhere.com/api/remove_member_from_team/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SaveTrackingDetailsCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    dynamic? jsonBodyJson,
  }) async {
    final jsonBody = _serializeJson(jsonBodyJson, true);
    final ffApiRequestBody = '''
{
  "payload": ${jsonBody}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'saveTrackingDetails',
      apiUrl:
          'http://100086.pythonanywhere.com/create-current-loc/?api_key=${apiKey}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteTeamCall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? teamName = '',
  }) async {
    final ffApiRequestBody = '''
{
"username":"${username}" ,
  "team_name": "${teamName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'deleteTeam',
      apiUrl: 'https://100093.pythonanywhere.com/api/delete_team_data/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ThreeCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'three',
      apiUrl: 'www.google.com',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class FourCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'four',
      apiUrl: 'www.google.com',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class FiveCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'five',
      apiUrl: 'www.google.com',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
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
