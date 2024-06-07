import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AttendedRecord extends FirestoreRecord {
  AttendedRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "checkIn" field.
  DateTime? _checkIn;
  DateTime? get checkIn => _checkIn;
  bool hasCheckIn() => _checkIn != null;

  // "checkOut" field.
  DateTime? _checkOut;
  DateTime? get checkOut => _checkOut;
  bool hasCheckOut() => _checkOut != null;

  // "selfiePic" field.
  String? _selfiePic;
  String get selfiePic => _selfiePic ?? '';
  bool hasSelfiePic() => _selfiePic != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _checkIn = snapshotData['checkIn'] as DateTime?;
    _checkOut = snapshotData['checkOut'] as DateTime?;
    _selfiePic = snapshotData['selfiePic'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Attended');

  static Stream<AttendedRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AttendedRecord.fromSnapshot(s));

  static Future<AttendedRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AttendedRecord.fromSnapshot(s));

  static AttendedRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AttendedRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AttendedRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AttendedRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AttendedRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AttendedRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAttendedRecordData({
  DateTime? checkIn,
  DateTime? checkOut,
  String? selfiePic,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'checkIn': checkIn,
      'checkOut': checkOut,
      'selfiePic': selfiePic,
      'userRef': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class AttendedRecordDocumentEquality implements Equality<AttendedRecord> {
  const AttendedRecordDocumentEquality();

  @override
  bool equals(AttendedRecord? e1, AttendedRecord? e2) {
    return e1?.checkIn == e2?.checkIn &&
        e1?.checkOut == e2?.checkOut &&
        e1?.selfiePic == e2?.selfiePic &&
        e1?.userRef == e2?.userRef;
  }

  @override
  int hash(AttendedRecord? e) => const ListEquality()
      .hash([e?.checkIn, e?.checkOut, e?.selfiePic, e?.userRef]);

  @override
  bool isValidKey(Object? o) => o is AttendedRecord;
}
