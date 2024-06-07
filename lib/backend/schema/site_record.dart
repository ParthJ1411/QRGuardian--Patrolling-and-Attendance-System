import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SiteRecord extends FirestoreRecord {
  SiteRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "phone" field.
  int? _phone;
  int get phone => _phone ?? 0;
  bool hasPhone() => _phone != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "latlong" field.
  LatLng? _latlong;
  LatLng? get latlong => _latlong;
  bool hasLatlong() => _latlong != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _phone = castToType<int>(snapshotData['phone']);
    _address = snapshotData['address'] as String?;
    _latlong = snapshotData['latlong'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('site');

  static Stream<SiteRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SiteRecord.fromSnapshot(s));

  static Future<SiteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SiteRecord.fromSnapshot(s));

  static SiteRecord fromSnapshot(DocumentSnapshot snapshot) => SiteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SiteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SiteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SiteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SiteRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSiteRecordData({
  String? name,
  int? phone,
  String? address,
  LatLng? latlong,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'phone': phone,
      'address': address,
      'latlong': latlong,
    }.withoutNulls,
  );

  return firestoreData;
}

class SiteRecordDocumentEquality implements Equality<SiteRecord> {
  const SiteRecordDocumentEquality();

  @override
  bool equals(SiteRecord? e1, SiteRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.phone == e2?.phone &&
        e1?.address == e2?.address &&
        e1?.latlong == e2?.latlong;
  }

  @override
  int hash(SiteRecord? e) =>
      const ListEquality().hash([e?.name, e?.phone, e?.address, e?.latlong]);

  @override
  bool isValidKey(Object? o) => o is SiteRecord;
}
