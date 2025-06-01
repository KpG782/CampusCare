// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class StringResultStruct extends FFFirebaseStruct {
  StringResultStruct({
    String? stringOne,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _stringOne = stringOne,
        super(firestoreUtilData);

  // "StringOne" field.
  String? _stringOne;
  String get stringOne => _stringOne ?? '';
  set stringOne(String? val) => _stringOne = val;

  bool hasStringOne() => _stringOne != null;

  static StringResultStruct fromMap(Map<String, dynamic> data) =>
      StringResultStruct(
        stringOne: data['StringOne'] as String?,
      );

  static StringResultStruct? maybeFromMap(dynamic data) => data is Map
      ? StringResultStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'StringOne': _stringOne,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'StringOne': serializeParam(
          _stringOne,
          ParamType.String,
        ),
      }.withoutNulls;

  static StringResultStruct fromSerializableMap(Map<String, dynamic> data) =>
      StringResultStruct(
        stringOne: deserializeParam(
          data['StringOne'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'StringResultStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StringResultStruct && stringOne == other.stringOne;
  }

  @override
  int get hashCode => const ListEquality().hash([stringOne]);
}

StringResultStruct createStringResultStruct({
  String? stringOne,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StringResultStruct(
      stringOne: stringOne,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StringResultStruct? updateStringResultStruct(
  StringResultStruct? stringResult, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    stringResult
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStringResultStructData(
  Map<String, dynamic> firestoreData,
  StringResultStruct? stringResult,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (stringResult == null) {
    return;
  }
  if (stringResult.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && stringResult.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final stringResultData =
      getStringResultFirestoreData(stringResult, forFieldValue);
  final nestedData =
      stringResultData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = stringResult.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStringResultFirestoreData(
  StringResultStruct? stringResult, [
  bool forFieldValue = false,
]) {
  if (stringResult == null) {
    return {};
  }
  final firestoreData = mapToFirestore(stringResult.toMap());

  // Add any Firestore field values
  stringResult.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStringResultListFirestoreData(
  List<StringResultStruct>? stringResults,
) =>
    stringResults?.map((e) => getStringResultFirestoreData(e, true)).toList() ??
    [];
