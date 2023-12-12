import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookingRequestsRecord extends FirestoreRecord {
  BookingRequestsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "offer_amount" field.
  double? _offerAmount;
  double get offerAmount => _offerAmount ?? 0.0;
  bool hasOfferAmount() => _offerAmount != null;

  // "performer" field.
  DocumentReference? _performer;
  DocumentReference? get performer => _performer;
  bool hasPerformer() => _performer != null;

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

  // "event_name" field.
  String? _eventName;
  String get eventName => _eventName ?? '';
  bool hasEventName() => _eventName != null;

  // "has_accepted" field.
  bool? _hasAccepted;
  bool get hasAccepted => _hasAccepted ?? false;
  bool hasHasAccepted() => _hasAccepted != null;

  // "has_declined" field.
  bool? _hasDeclined;
  bool get hasDeclined => _hasDeclined ?? false;
  bool hasHasDeclined() => _hasDeclined != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _offerAmount = castToType<double>(snapshotData['offer_amount']);
    _performer = snapshotData['performer'] as DocumentReference?;
    _offerDetails = snapshotData['offer_details'] as String?;
    _eventRef = snapshotData['event_ref'] as DocumentReference?;
    _venueRef = snapshotData['venue_ref'] as DocumentReference?;
    _eventName = snapshotData['event_name'] as String?;
    _hasAccepted = snapshotData['has_accepted'] as bool?;
    _hasDeclined = snapshotData['has_declined'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('booking_requests')
          : FirebaseFirestore.instance.collectionGroup('booking_requests');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('booking_requests').doc();

  static Stream<BookingRequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookingRequestsRecord.fromSnapshot(s));

  static Future<BookingRequestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookingRequestsRecord.fromSnapshot(s));

  static BookingRequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookingRequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookingRequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookingRequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookingRequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookingRequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookingRequestsRecordData({
  double? offerAmount,
  DocumentReference? performer,
  String? offerDetails,
  DocumentReference? eventRef,
  DocumentReference? venueRef,
  String? eventName,
  bool? hasAccepted,
  bool? hasDeclined,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'offer_amount': offerAmount,
      'performer': performer,
      'offer_details': offerDetails,
      'event_ref': eventRef,
      'venue_ref': venueRef,
      'event_name': eventName,
      'has_accepted': hasAccepted,
      'has_declined': hasDeclined,
    }.withoutNulls,
  );

  return firestoreData;
}

class BookingRequestsRecordDocumentEquality
    implements Equality<BookingRequestsRecord> {
  const BookingRequestsRecordDocumentEquality();

  @override
  bool equals(BookingRequestsRecord? e1, BookingRequestsRecord? e2) {
    return e1?.offerAmount == e2?.offerAmount &&
        e1?.performer == e2?.performer &&
        e1?.offerDetails == e2?.offerDetails &&
        e1?.eventRef == e2?.eventRef &&
        e1?.venueRef == e2?.venueRef &&
        e1?.eventName == e2?.eventName &&
        e1?.hasAccepted == e2?.hasAccepted &&
        e1?.hasDeclined == e2?.hasDeclined;
  }

  @override
  int hash(BookingRequestsRecord? e) => const ListEquality().hash([
        e?.offerAmount,
        e?.performer,
        e?.offerDetails,
        e?.eventRef,
        e?.venueRef,
        e?.eventName,
        e?.hasAccepted,
        e?.hasDeclined
      ]);

  @override
  bool isValidKey(Object? o) => o is BookingRequestsRecord;
}
