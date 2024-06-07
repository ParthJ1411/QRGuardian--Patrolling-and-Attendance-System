// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AddressmainStruct extends FFFirebaseStruct {
  AddressmainStruct({
    String? ppcrc,
    String? library,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _ppcrc = ppcrc,
        _library = library,
        super(firestoreUtilData);

  // "PPCRC" field.
  String? _ppcrc;
  String get ppcrc => _ppcrc ?? '';
  set ppcrc(String? val) => _ppcrc = val;
  bool hasPpcrc() => _ppcrc != null;

  // "Library" field.
  String? _library;
  String get library => _library ?? '';
  set library(String? val) => _library = val;
  bool hasLibrary() => _library != null;

  static AddressmainStruct fromMap(Map<String, dynamic> data) =>
      AddressmainStruct(
        ppcrc: data['PPCRC'] as String?,
        library: data['Library'] as String?,
      );

  static AddressmainStruct? maybeFromMap(dynamic data) => data is Map
      ? AddressmainStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'PPCRC': _ppcrc,
        'Library': _library,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'PPCRC': serializeParam(
          _ppcrc,
          ParamType.String,
        ),
        'Library': serializeParam(
          _library,
          ParamType.String,
        ),
      }.withoutNulls;

  static AddressmainStruct fromSerializableMap(Map<String, dynamic> data) =>
      AddressmainStruct(
        ppcrc: deserializeParam(
          data['PPCRC'],
          ParamType.String,
          false,
        ),
        library: deserializeParam(
          data['Library'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AddressmainStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AddressmainStruct &&
        ppcrc == other.ppcrc &&
        library == other.library;
  }

  @override
  int get hashCode => const ListEquality().hash([ppcrc, library]);
}

AddressmainStruct createAddressmainStruct({
  String? ppcrc,
  String? library,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AddressmainStruct(
      ppcrc: ppcrc,
      library: library,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AddressmainStruct? updateAddressmainStruct(
  AddressmainStruct? addressmain, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    addressmain
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAddressmainStructData(
  Map<String, dynamic> firestoreData,
  AddressmainStruct? addressmain,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (addressmain == null) {
    return;
  }
  if (addressmain.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && addressmain.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final addressmainData =
      getAddressmainFirestoreData(addressmain, forFieldValue);
  final nestedData =
      addressmainData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = addressmain.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAddressmainFirestoreData(
  AddressmainStruct? addressmain, [
  bool forFieldValue = false,
]) {
  if (addressmain == null) {
    return {};
  }
  final firestoreData = mapToFirestore(addressmain.toMap());

  // Add any Firestore field values
  addressmain.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAddressmainListFirestoreData(
  List<AddressmainStruct>? addressmains,
) =>
    addressmains?.map((e) => getAddressmainFirestoreData(e, true)).toList() ??
    [];
