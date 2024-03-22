// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TeamModelStruct extends FFFirebaseStruct {
  TeamModelStruct({
    String? username,
    String? teamName,
    List<MemberModelStruct>? teamMembers,
    String? id,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _username = username,
        _teamName = teamName,
        _teamMembers = teamMembers,
        _id = id,
        super(firestoreUtilData);

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  set username(String? val) => _username = val;
  bool hasUsername() => _username != null;

  // "team_name" field.
  String? _teamName;
  String get teamName => _teamName ?? '';
  set teamName(String? val) => _teamName = val;
  bool hasTeamName() => _teamName != null;

  // "teamMembers" field.
  List<MemberModelStruct>? _teamMembers;
  List<MemberModelStruct> get teamMembers => _teamMembers ?? const [];
  set teamMembers(List<MemberModelStruct>? val) => _teamMembers = val;
  void updateTeamMembers(Function(List<MemberModelStruct>) updateFn) =>
      updateFn(_teamMembers ??= []);
  bool hasTeamMembers() => _teamMembers != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  static TeamModelStruct fromMap(Map<String, dynamic> data) => TeamModelStruct(
        username: data['username'] as String?,
        teamName: data['team_name'] as String?,
        teamMembers: getStructList(
          data['teamMembers'],
          MemberModelStruct.fromMap,
        ),
        id: data['id'] as String?,
      );

  static TeamModelStruct? maybeFromMap(dynamic data) => data is Map
      ? TeamModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'username': _username,
        'team_name': _teamName,
        'teamMembers': _teamMembers?.map((e) => e.toMap()).toList(),
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'username': serializeParam(
          _username,
          ParamType.String,
        ),
        'team_name': serializeParam(
          _teamName,
          ParamType.String,
        ),
        'teamMembers': serializeParam(
          _teamMembers,
          ParamType.DataStruct,
          true,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static TeamModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      TeamModelStruct(
        username: deserializeParam(
          data['username'],
          ParamType.String,
          false,
        ),
        teamName: deserializeParam(
          data['team_name'],
          ParamType.String,
          false,
        ),
        teamMembers: deserializeStructParam<MemberModelStruct>(
          data['teamMembers'],
          ParamType.DataStruct,
          true,
          structBuilder: MemberModelStruct.fromSerializableMap,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TeamModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TeamModelStruct &&
        username == other.username &&
        teamName == other.teamName &&
        listEquality.equals(teamMembers, other.teamMembers) &&
        id == other.id;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([username, teamName, teamMembers, id]);
}

TeamModelStruct createTeamModelStruct({
  String? username,
  String? teamName,
  String? id,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TeamModelStruct(
      username: username,
      teamName: teamName,
      id: id,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TeamModelStruct? updateTeamModelStruct(
  TeamModelStruct? teamModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    teamModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTeamModelStructData(
  Map<String, dynamic> firestoreData,
  TeamModelStruct? teamModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (teamModel == null) {
    return;
  }
  if (teamModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && teamModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final teamModelData = getTeamModelFirestoreData(teamModel, forFieldValue);
  final nestedData = teamModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = teamModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTeamModelFirestoreData(
  TeamModelStruct? teamModel, [
  bool forFieldValue = false,
]) {
  if (teamModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(teamModel.toMap());

  // Add any Firestore field values
  teamModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTeamModelListFirestoreData(
  List<TeamModelStruct>? teamModels,
) =>
    teamModels?.map((e) => getTeamModelFirestoreData(e, true)).toList() ?? [];
