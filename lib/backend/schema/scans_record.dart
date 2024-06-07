import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ScansRecord extends FirestoreRecord {
  ScansRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "LatLong" field.
  LatLng? _latLong;
  LatLng? get latLong => _latLong;
  bool hasLatLong() => _latLong != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "selfie" field.
  String? _selfie;
  String get selfie => _selfie ?? '';
  bool hasSelfie() => _selfie != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _latLong = snapshotData['LatLong'] as LatLng?;
    _username = snapshotData['username'] as String?;
    _selfie = snapshotData['selfie'] as String?;
    _location = snapshotData['location'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Scans');

  static Stream<ScansRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ScansRecord.fromSnapshot(s));

  static Future<ScansRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ScansRecord.fromSnapshot(s));

  static ScansRecord fromSnapshot(DocumentSnapshot snapshot) => ScansRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ScansRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ScansRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ScansRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ScansRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createScansRecordData({
  DateTime? createdTime,
  LatLng? latLong,
  String? username,
  String? selfie,
  String? location,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'LatLong': latLong,
      'username': username,
      'selfie': selfie,
      'location': location,
    }.withoutNulls,
  );

  return firestoreData;
}

class ScansRecordDocumentEquality implements Equality<ScansRecord> {
  const ScansRecordDocumentEquality();

  @override
  bool equals(ScansRecord? e1, ScansRecord? e2) {
    return e1?.createdTime == e2?.createdTime &&
        e1?.latLong == e2?.latLong &&
        e1?.username == e2?.username &&
        e1?.selfie == e2?.selfie &&
        e1?.location == e2?.location;
  }

  @override
  int hash(ScansRecord? e) => const ListEquality()
      .hash([e?.createdTime, e?.latLong, e?.username, e?.selfie, e?.location]);

  @override
  bool isValidKey(Object? o) => o is ScansRecord;
}
