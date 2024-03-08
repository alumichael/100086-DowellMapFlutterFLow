// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GuestInfoStruct extends FFFirebaseStruct {
  GuestInfoStruct({
    String? name,
    String? email,
    String? userId,
    String? country,
    String? companyId,
    String? companyName,
    List<String>? orgByIdTeams,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _email = email,
        _userId = userId,
        _country = country,
        _companyId = companyId,
        _companyName = companyName,
        _orgByIdTeams = orgByIdTeams,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;
  bool hasUserId() => _userId != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;
  bool hasCountry() => _country != null;

  // "companyId" field.
  String? _companyId;
  String get companyId => _companyId ?? '';
  set companyId(String? val) => _companyId = val;
  bool hasCompanyId() => _companyId != null;

  // "companyName" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  set companyName(String? val) => _companyName = val;
  bool hasCompanyName() => _companyName != null;

  // "orgByIdTeams" field.
  List<String>? _orgByIdTeams;
  List<String> get orgByIdTeams => _orgByIdTeams ?? const [];
  set orgByIdTeams(List<String>? val) => _orgByIdTeams = val;
  void updateOrgByIdTeams(Function(List<String>) updateFn) =>
      updateFn(_orgByIdTeams ??= []);
  bool hasOrgByIdTeams() => _orgByIdTeams != null;

  static GuestInfoStruct fromMap(Map<String, dynamic> data) => GuestInfoStruct(
        name: data['name'] as String?,
        email: data['email'] as String?,
        userId: data['userId'] as String?,
        country: data['country'] as String?,
        companyId: data['companyId'] as String?,
        companyName: data['companyName'] as String?,
        orgByIdTeams: getDataList(data['orgByIdTeams']),
      );

  static GuestInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? GuestInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'email': _email,
        'userId': _userId,
        'country': _country,
        'companyId': _companyId,
        'companyName': _companyName,
        'orgByIdTeams': _orgByIdTeams,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'userId': serializeParam(
          _userId,
          ParamType.String,
        ),
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
        'companyId': serializeParam(
          _companyId,
          ParamType.String,
        ),
        'companyName': serializeParam(
          _companyName,
          ParamType.String,
        ),
        'orgByIdTeams': serializeParam(
          _orgByIdTeams,
          ParamType.String,
          true,
        ),
      }.withoutNulls;

  static GuestInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      GuestInfoStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        userId: deserializeParam(
          data['userId'],
          ParamType.String,
          false,
        ),
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
        companyId: deserializeParam(
          data['companyId'],
          ParamType.String,
          false,
        ),
        companyName: deserializeParam(
          data['companyName'],
          ParamType.String,
          false,
        ),
        orgByIdTeams: deserializeParam<String>(
          data['orgByIdTeams'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'GuestInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is GuestInfoStruct &&
        name == other.name &&
        email == other.email &&
        userId == other.userId &&
        country == other.country &&
        companyId == other.companyId &&
        companyName == other.companyName &&
        listEquality.equals(orgByIdTeams, other.orgByIdTeams);
  }

  @override
  int get hashCode => const ListEquality().hash(
      [name, email, userId, country, companyId, companyName, orgByIdTeams]);
}

GuestInfoStruct createGuestInfoStruct({
  String? name,
  String? email,
  String? userId,
  String? country,
  String? companyId,
  String? companyName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GuestInfoStruct(
      name: name,
      email: email,
      userId: userId,
      country: country,
      companyId: companyId,
      companyName: companyName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GuestInfoStruct? updateGuestInfoStruct(
  GuestInfoStruct? guestInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    guestInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGuestInfoStructData(
  Map<String, dynamic> firestoreData,
  GuestInfoStruct? guestInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (guestInfo == null) {
    return;
  }
  if (guestInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && guestInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final guestInfoData = getGuestInfoFirestoreData(guestInfo, forFieldValue);
  final nestedData = guestInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = guestInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGuestInfoFirestoreData(
  GuestInfoStruct? guestInfo, [
  bool forFieldValue = false,
]) {
  if (guestInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(guestInfo.toMap());

  // Add any Firestore field values
  guestInfo.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGuestInfoListFirestoreData(
  List<GuestInfoStruct>? guestInfos,
) =>
    guestInfos?.map((e) => getGuestInfoFirestoreData(e, true)).toList() ?? [];
