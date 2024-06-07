// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AddressStruct extends FFFirebaseStruct {
  AddressStruct({
    String? ppcrc,
    String? library,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _ppcrc = ppcrc,
        _library = library,
        super(firestoreUtilData);

  // "PPCRC" field.
  String? _ppcrc;
  String get ppcrc => _ppcrc ?? 'PPCRC';
  set ppcrc(String? val) => _ppcrc = val;
  bool hasPpcrc() => _ppcrc != null;

  // "Library" field.
  String? _library;
  String get library => _library ?? 'Library';
  set library(String? val) => _library = val;
  bool hasLibrary() => _library != null;

  static AddressStruct fromMap(Map<String, dynamic> data) => AddressStruct(
        ppcrc: data['PPCRC'] as String?,
        library: data['Library'] as String?,
      );

  static AddressStruct? maybeFromMap(dynamic data) =>
      data is Map ? AddressStruct.fromMap(data.cast<String, dynamic>()) : null;

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

  static AddressStruct fromSerializableMap(Map<String, dynamic> data) =>
      AddressStruct(
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
  String toString() => 'AddressStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AddressStruct &&
        ppcrc == other.ppcrc &&
        library == other.library;
  }

  @override
  int get hashCode => const ListEquality().hash([ppcrc, library]);
}

AddressStruct createAddressStruct({
  String? ppcrc,
  String? library,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AddressStruct(
      ppcrc: ppcrc,
      library: library,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AddressStruct? updateAddressStruct(
  AddressStruct? address, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    address
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAddressStructData(
  Map<String, dynamic> firestoreData,
  AddressStruct? address,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (address == null) {
    return;
  }
  if (address.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && address.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final addressData = getAddressFirestoreData(address, forFieldValue);
  final nestedData = addressData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = address.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAddressFirestoreData(
  AddressStruct? address, [
  bool forFieldValue = false,
]) {
  if (address == null) {
    return {};
  }
  final firestoreData = mapToFirestore(address.toMap());

  // Add any Firestore field values
  address.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAddressListFirestoreData(
  List<AddressStruct>? addresss,
) =>
    addresss?.map((e) => getAddressFirestoreData(e, true)).toList() ?? [];
