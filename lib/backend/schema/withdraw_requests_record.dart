import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WithdrawRequestsRecord extends FirestoreRecord {
  WithdrawRequestsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "event_ref" field.
  DocumentReference? _eventRef;
  DocumentReference? get eventRef => _eventRef;
  bool hasEventRef() => _eventRef != null;

  // "organizer" field.
  DocumentReference? _organizer;
  DocumentReference? get organizer => _organizer;
  bool hasOrganizer() => _organizer != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "request_time" field.
  DateTime? _requestTime;
  DateTime? get requestTime => _requestTime;
  bool hasRequestTime() => _requestTime != null;

  void _initializeFields() {
    _eventRef = snapshotData['event_ref'] as DocumentReference?;
    _organizer = snapshotData['organizer'] as DocumentReference?;
    _amount = castToType<double>(snapshotData['amount']);
    _description = snapshotData['description'] as String?;
    _requestTime = snapshotData['request_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('withdraw_requests');

  static Stream<WithdrawRequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WithdrawRequestsRecord.fromSnapshot(s));

  static Future<WithdrawRequestsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => WithdrawRequestsRecord.fromSnapshot(s));

  static WithdrawRequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WithdrawRequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WithdrawRequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WithdrawRequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WithdrawRequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WithdrawRequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWithdrawRequestsRecordData({
  DocumentReference? eventRef,
  DocumentReference? organizer,
  double? amount,
  String? description,
  DateTime? requestTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'event_ref': eventRef,
      'organizer': organizer,
      'amount': amount,
      'description': description,
      'request_time': requestTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class WithdrawRequestsRecordDocumentEquality
    implements Equality<WithdrawRequestsRecord> {
  const WithdrawRequestsRecordDocumentEquality();

  @override
  bool equals(WithdrawRequestsRecord? e1, WithdrawRequestsRecord? e2) {
    return e1?.eventRef == e2?.eventRef &&
        e1?.organizer == e2?.organizer &&
        e1?.amount == e2?.amount &&
        e1?.description == e2?.description &&
        e1?.requestTime == e2?.requestTime;
  }

  @override
  int hash(WithdrawRequestsRecord? e) => const ListEquality().hash(
      [e?.eventRef, e?.organizer, e?.amount, e?.description, e?.requestTime]);

  @override
  bool isValidKey(Object? o) => o is WithdrawRequestsRecord;
}
