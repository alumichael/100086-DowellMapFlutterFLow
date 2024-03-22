// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MemberModelStruct extends FFFirebaseStruct {
  MemberModelStruct({
    String? id,
    String? status,
    String? firstName,
    String? lastName,
    String? email,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _status = status,
        _firstName = firstName,
        _lastName = lastName,
        _email = email,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;
  bool hasStatus() => _status != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;
  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;
  bool hasLastName() => _lastName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  static MemberModelStruct fromMap(Map<String, dynamic> data) =>
      MemberModelStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        email: data['email'] as String?,
      );

  static MemberModelStruct? maybeFromMap(dynamic data) => data is Map
      ? MemberModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'first_name': _firstName,
        'last_name': _lastName,
        'email': _email,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'first_name': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'last_name': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
      }.withoutNulls;

  static MemberModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      MemberModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        firstName: deserializeParam(
          data['first_name'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['last_name'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MemberModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MemberModelStruct &&
        id == other.id &&
        status == other.status &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        email == other.email;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, status, firstName, lastName, email]);
}

MemberModelStruct createMemberModelStruct({
  String? id,
  String? status,
  String? firstName,
  String? lastName,
  String? email,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MemberModelStruct(
      id: id,
      status: status,
      firstName: firstName,
      lastName: lastName,
      email: email,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MemberModelStruct? updateMemberModelStruct(
  MemberModelStruct? memberModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    memberModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMemberModelStructData(
  Map<String, dynamic> firestoreData,
  MemberModelStruct? memberModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (memberModel == null) {
    return;
  }
  if (memberModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && memberModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final memberModelData =
      getMemberModelFirestoreData(memberModel, forFieldValue);
  final nestedData =
      memberModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = memberModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMemberModelFirestoreData(
  MemberModelStruct? memberModel, [
  bool forFieldValue = false,
]) {
  if (memberModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(memberModel.toMap());

  // Add any Firestore field values
  memberModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMemberModelListFirestoreData(
  List<MemberModelStruct>? memberModels,
) =>
    memberModels?.map((e) => getMemberModelFirestoreData(e, true)).toList() ??
    [];
