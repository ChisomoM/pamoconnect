import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MomentsRecord extends FirestoreRecord {
  MomentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_posting" field.
  DocumentReference? _userPosting;
  DocumentReference? get userPosting => _userPosting;
  bool hasUserPosting() => _userPosting != null;

  // "caption" field.
  String? _caption;
  String get caption => _caption ?? '';
  bool hasCaption() => _caption != null;

  // "likes" field.
  DocumentReference? _likes;
  DocumentReference? get likes => _likes;
  bool hasLikes() => _likes != null;

  void _initializeFields() {
    _userPosting = snapshotData['user_posting'] as DocumentReference?;
    _caption = snapshotData['caption'] as String?;
    _likes = snapshotData['likes'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('moments');

  static Stream<MomentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MomentsRecord.fromSnapshot(s));

  static Future<MomentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MomentsRecord.fromSnapshot(s));

  static MomentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MomentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MomentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MomentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MomentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MomentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMomentsRecordData({
  DocumentReference? userPosting,
  String? caption,
  DocumentReference? likes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_posting': userPosting,
      'caption': caption,
      'likes': likes,
    }.withoutNulls,
  );

  return firestoreData;
}

class MomentsRecordDocumentEquality implements Equality<MomentsRecord> {
  const MomentsRecordDocumentEquality();

  @override
  bool equals(MomentsRecord? e1, MomentsRecord? e2) {
    return e1?.userPosting == e2?.userPosting &&
        e1?.caption == e2?.caption &&
        e1?.likes == e2?.likes;
  }

  @override
  int hash(MomentsRecord? e) =>
      const ListEquality().hash([e?.userPosting, e?.caption, e?.likes]);

  @override
  bool isValidKey(Object? o) => o is MomentsRecord;
}
