// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CampusLocationsStruct extends FFFirebaseStruct {
  CampusLocationsStruct({
    LatLng? hostelParking,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _hostelParking = hostelParking,
        super(firestoreUtilData);

  // "HostelParking" field.
  LatLng? _hostelParking;
  LatLng? get hostelParking => _hostelParking;
  set hostelParking(LatLng? val) => _hostelParking = val;
  bool hasHostelParking() => _hostelParking != null;

  static CampusLocationsStruct fromMap(Map<String, dynamic> data) =>
      CampusLocationsStruct(
        hostelParking: data['HostelParking'] as LatLng?,
      );

  static CampusLocationsStruct? maybeFromMap(dynamic data) => data is Map
      ? CampusLocationsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'HostelParking': _hostelParking,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'HostelParking': serializeParam(
          _hostelParking,
          ParamType.LatLng,
        ),
      }.withoutNulls;

  static CampusLocationsStruct fromSerializableMap(Map<String, dynamic> data) =>
      CampusLocationsStruct(
        hostelParking: deserializeParam(
          data['HostelParking'],
          ParamType.LatLng,
          false,
        ),
      );

  @override
  String toString() => 'CampusLocationsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CampusLocationsStruct &&
        hostelParking == other.hostelParking;
  }

  @override
  int get hashCode => const ListEquality().hash([hostelParking]);
}

CampusLocationsStruct createCampusLocationsStruct({
  LatLng? hostelParking,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CampusLocationsStruct(
      hostelParking: hostelParking,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CampusLocationsStruct? updateCampusLocationsStruct(
  CampusLocationsStruct? campusLocations, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    campusLocations
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCampusLocationsStructData(
  Map<String, dynamic> firestoreData,
  CampusLocationsStruct? campusLocations,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (campusLocations == null) {
    return;
  }
  if (campusLocations.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && campusLocations.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final campusLocationsData =
      getCampusLocationsFirestoreData(campusLocations, forFieldValue);
  final nestedData =
      campusLocationsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = campusLocations.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCampusLocationsFirestoreData(
  CampusLocationsStruct? campusLocations, [
  bool forFieldValue = false,
]) {
  if (campusLocations == null) {
    return {};
  }
  final firestoreData = mapToFirestore(campusLocations.toMap());

  // Add any Firestore field values
  campusLocations.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCampusLocationsListFirestoreData(
  List<CampusLocationsStruct>? campusLocationss,
) =>
    campusLocationss
        ?.map((e) => getCampusLocationsFirestoreData(e, true))
        .toList() ??
    [];
