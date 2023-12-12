import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BetaUsersRecord extends FirestoreRecord {
  BetaUsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "emails" field.
  List<String>? _emails;
  List<String> get emails => _emails ?? const [];
  bool hasEmails() => _emails != null;

  void _initializeFields() {
    _emails = getDataList(snapshotData['emails']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('beta_users');

  static Stream<BetaUsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BetaUsersRecord.fromSnapshot(s));

  static Future<BetaUsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BetaUsersRecord.fromSnapshot(s));

  static BetaUsersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BetaUsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BetaUsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BetaUsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BetaUsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BetaUsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBetaUsersRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class BetaUsersRecordDocumentEquality implements Equality<BetaUsersRecord> {
  const BetaUsersRecordDocumentEquality();

  @override
  bool equals(BetaUsersRecord? e1, BetaUsersRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.emails, e2?.emails);
  }

  @override
  int hash(BetaUsersRecord? e) => const ListEquality().hash([e?.emails]);

  @override
  bool isValidKey(Object? o) => o is BetaUsersRecord;
}
