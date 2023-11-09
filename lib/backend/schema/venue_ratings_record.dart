import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VenueRatingsRecord extends FirestoreRecord {
  VenueRatingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_rating" field.
  DocumentReference? _userRating;
  DocumentReference? get userRating => _userRating;
  bool hasUserRating() => _userRating != null;

  // "review" field.
  String? _review;
  String get review => _review ?? '';
  bool hasReview() => _review != null;

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  bool hasRating() => _rating != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userRating = snapshotData['user_rating'] as DocumentReference?;
    _review = snapshotData['review'] as String?;
    _rating = castToType<int>(snapshotData['rating']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('venue_ratings')
          : FirebaseFirestore.instance.collectionGroup('venue_ratings');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('venue_ratings').doc();

  static Stream<VenueRatingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VenueRatingsRecord.fromSnapshot(s));

  static Future<VenueRatingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VenueRatingsRecord.fromSnapshot(s));

  static VenueRatingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VenueRatingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VenueRatingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VenueRatingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VenueRatingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VenueRatingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVenueRatingsRecordData({
  DocumentReference? userRating,
  String? review,
  int? rating,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_rating': userRating,
      'review': review,
      'rating': rating,
    }.withoutNulls,
  );

  return firestoreData;
}

class VenueRatingsRecordDocumentEquality
    implements Equality<VenueRatingsRecord> {
  const VenueRatingsRecordDocumentEquality();

  @override
  bool equals(VenueRatingsRecord? e1, VenueRatingsRecord? e2) {
    return e1?.userRating == e2?.userRating &&
        e1?.review == e2?.review &&
        e1?.rating == e2?.rating;
  }

  @override
  int hash(VenueRatingsRecord? e) =>
      const ListEquality().hash([e?.userRating, e?.review, e?.rating]);

  @override
  bool isValidKey(Object? o) => o is VenueRatingsRecord;
}
