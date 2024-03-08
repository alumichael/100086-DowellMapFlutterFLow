// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SocketTeamModelStruct extends FFFirebaseStruct {
  SocketTeamModelStruct({
    String? username,
    double? lat,
    double? lon,
    DateTime? timestamp,
    String? workspaceId,
    String? docType,
    bool? teamStatus,
    List<String>? teamList,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _username = username,
        _lat = lat,
        _lon = lon,
        _timestamp = timestamp,
        _workspaceId = workspaceId,
        _docType = docType,
        _teamStatus = teamStatus,
        _teamList = teamList,
        super(firestoreUtilData);

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  set username(String? val) => _username = val;
  bool hasUsername() => _username != null;

  // "lat" field.
  double? _lat;
  double get lat => _lat ?? 0.0;
  set lat(double? val) => _lat = val;
  void incrementLat(double amount) => _lat = lat + amount;
  bool hasLat() => _lat != null;

  // "lon" field.
  double? _lon;
  double get lon => _lon ?? 0.0;
  set lon(double? val) => _lon = val;
  void incrementLon(double amount) => _lon = lon + amount;
  bool hasLon() => _lon != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  set timestamp(DateTime? val) => _timestamp = val;
  bool hasTimestamp() => _timestamp != null;

  // "workspace_id" field.
  String? _workspaceId;
  String get workspaceId => _workspaceId ?? '';
  set workspaceId(String? val) => _workspaceId = val;
  bool hasWorkspaceId() => _workspaceId != null;

  // "doc_type" field.
  String? _docType;
  String get docType => _docType ?? 'slave';
  set docType(String? val) => _docType = val;
  bool hasDocType() => _docType != null;

  // "team_status" field.
  bool? _teamStatus;
  bool get teamStatus => _teamStatus ?? true;
  set teamStatus(bool? val) => _teamStatus = val;
  bool hasTeamStatus() => _teamStatus != null;

  // "team_list" field.
  List<String>? _teamList;
  List<String> get teamList => _teamList ?? const [];
  set teamList(List<String>? val) => _teamList = val;
  void updateTeamList(Function(List<String>) updateFn) =>
      updateFn(_teamList ??= []);
  bool hasTeamList() => _teamList != null;

  static SocketTeamModelStruct fromMap(Map<String, dynamic> data) =>
      SocketTeamModelStruct(
        username: data['username'] as String?,
        lat: castToType<double>(data['lat']),
        lon: castToType<double>(data['lon']),
        timestamp: data['timestamp'] as DateTime?,
        workspaceId: data['workspace_id'] as String?,
        docType: data['doc_type'] as String?,
        teamStatus: data['team_status'] as bool?,
        teamList: getDataList(data['team_list']),
      );

  static SocketTeamModelStruct? maybeFromMap(dynamic data) => data is Map
      ? SocketTeamModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'username': _username,
        'lat': _lat,
        'lon': _lon,
        'timestamp': _timestamp,
        'workspace_id': _workspaceId,
        'doc_type': _docType,
        'team_status': _teamStatus,
        'team_list': _teamList,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'username': serializeParam(
          _username,
          ParamType.String,
        ),
        'lat': serializeParam(
          _lat,
          ParamType.double,
        ),
        'lon': serializeParam(
          _lon,
          ParamType.double,
        ),
        'timestamp': serializeParam(
          _timestamp,
          ParamType.DateTime,
        ),
        'workspace_id': serializeParam(
          _workspaceId,
          ParamType.String,
        ),
        'doc_type': serializeParam(
          _docType,
          ParamType.String,
        ),
        'team_status': serializeParam(
          _teamStatus,
          ParamType.bool,
        ),
        'team_list': serializeParam(
          _teamList,
          ParamType.String,
          true,
        ),
      }.withoutNulls;

  static SocketTeamModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      SocketTeamModelStruct(
        username: deserializeParam(
          data['username'],
          ParamType.String,
          false,
        ),
        lat: deserializeParam(
          data['lat'],
          ParamType.double,
          false,
        ),
        lon: deserializeParam(
          data['lon'],
          ParamType.double,
          false,
        ),
        timestamp: deserializeParam(
          data['timestamp'],
          ParamType.DateTime,
          false,
        ),
        workspaceId: deserializeParam(
          data['workspace_id'],
          ParamType.String,
          false,
        ),
        docType: deserializeParam(
          data['doc_type'],
          ParamType.String,
          false,
        ),
        teamStatus: deserializeParam(
          data['team_status'],
          ParamType.bool,
          false,
        ),
        teamList: deserializeParam<String>(
          data['team_list'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'SocketTeamModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SocketTeamModelStruct &&
        username == other.username &&
        lat == other.lat &&
        lon == other.lon &&
        timestamp == other.timestamp &&
        workspaceId == other.workspaceId &&
        docType == other.docType &&
        teamStatus == other.teamStatus &&
        listEquality.equals(teamList, other.teamList);
  }

  @override
  int get hashCode => const ListEquality().hash([
        username,
        lat,
        lon,
        timestamp,
        workspaceId,
        docType,
        teamStatus,
        teamList
      ]);
}

SocketTeamModelStruct createSocketTeamModelStruct({
  String? username,
  double? lat,
  double? lon,
  DateTime? timestamp,
  String? workspaceId,
  String? docType,
  bool? teamStatus,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SocketTeamModelStruct(
      username: username,
      lat: lat,
      lon: lon,
      timestamp: timestamp,
      workspaceId: workspaceId,
      docType: docType,
      teamStatus: teamStatus,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SocketTeamModelStruct? updateSocketTeamModelStruct(
  SocketTeamModelStruct? socketTeamModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    socketTeamModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSocketTeamModelStructData(
  Map<String, dynamic> firestoreData,
  SocketTeamModelStruct? socketTeamModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (socketTeamModel == null) {
    return;
  }
  if (socketTeamModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && socketTeamModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final socketTeamModelData =
      getSocketTeamModelFirestoreData(socketTeamModel, forFieldValue);
  final nestedData =
      socketTeamModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = socketTeamModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSocketTeamModelFirestoreData(
  SocketTeamModelStruct? socketTeamModel, [
  bool forFieldValue = false,
]) {
  if (socketTeamModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(socketTeamModel.toMap());

  // Add any Firestore field values
  socketTeamModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSocketTeamModelListFirestoreData(
  List<SocketTeamModelStruct>? socketTeamModels,
) =>
    socketTeamModels
        ?.map((e) => getSocketTeamModelFirestoreData(e, true))
        .toList() ??
    [];
