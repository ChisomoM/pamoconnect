import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VenueRequestRecord extends FirestoreRecord {
  VenueRequestRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "offer_details" field.
  String? _offerDetails;
  String get offerDetails => _offerDetails ?? '';
  bool hasOfferDetails() => _offerDetails != null;

  // "event_ref" field.
  DocumentReference? _eventRef;
  DocumentReference? get eventRef => _eventRef;
  bool hasEventRef() => _eventRef != null;

  // "venue_ref" field.
  DocumentReference? _venueRef;
  DocumentReference? get venueRef => _venueRef;
  bool hasVenueRef() => _venueRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _offerDetails = snapshotData['offer_details'] as String?;
    _eventRef = snapshotData['event_ref'] as DocumentReference?;
    _venueRef = snapshotData['venue_ref'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('venue_request')
          : FirebaseFirestore.instance.collectionGroup('venue_request');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('venue_request').doc();

  static Stream<VenueRequestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VenueRequestRecord.fromSnapshot(s));

  static Future<VenueRequestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VenueRequestRecord.fromSnapshot(s));

  static VenueRequestRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VenueRequestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VenueRequestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VenueRequestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VenueRequestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VenueRequestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVenueRequestRecordData({
  String? offerDetails,
  DocumentReference? eventRef,
  DocumentReference? venueRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'offer_details': offerDetails,
      'event_ref': eventRef,
      'venue_ref': venueRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class VenueRequestRecordDocumentEquality
    implements Equality<VenueRequestRecord> {
  const VenueRequestRecordDocumentEquality();

  @override
  bool equals(VenueRequestRecord? e1, VenueRequestRecord? e2) {
    return e1?.offerDetails == e2?.offerDetails &&
        e1?.eventRef == e2?.eventRef &&
        e1?.venueRef == e2?.venueRef;
  }

  @override
  int hash(VenueRequestRecord? e) =>
      const ListEquality().hash([e?.offerDetails, e?.eventRef, e?.venueRef]);

  @override
  bool isValidKey(Object? o) => o is VenueRequestRecord;
}
