import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ticket_id" field.
  String? _ticketId;
  String get ticketId => _ticketId ?? '';
  bool hasTicketId() => _ticketId != null;

  // "event_name" field.
  String? _eventName;
  String get eventName => _eventName ?? '';
  bool hasEventName() => _eventName != null;

  // "ticket_name" field.
  String? _ticketName;
  String get ticketName => _ticketName ?? '';
  bool hasTicketName() => _ticketName != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "ticket_ref" field.
  DocumentReference? _ticketRef;
  DocumentReference? get ticketRef => _ticketRef;
  bool hasTicketRef() => _ticketRef != null;

  // "event_ref" field.
  DocumentReference? _eventRef;
  DocumentReference? get eventRef => _eventRef;
  bool hasEventRef() => _eventRef != null;

  // "is_verified" field.
  bool? _isVerified;
  bool get isVerified => _isVerified ?? false;
  bool hasIsVerified() => _isVerified != null;

  // "ticket_owner" field.
  DocumentReference? _ticketOwner;
  DocumentReference? get ticketOwner => _ticketOwner;
  bool hasTicketOwner() => _ticketOwner != null;

  // "has_checkedIn" field.
  bool? _hasCheckedIn;
  bool get hasCheckedIn => _hasCheckedIn ?? false;
  bool hasHasCheckedIn() => _hasCheckedIn != null;

  void _initializeFields() {
    _ticketId = snapshotData['ticket_id'] as String?;
    _eventName = snapshotData['event_name'] as String?;
    _ticketName = snapshotData['ticket_name'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _quantity = castToType<int>(snapshotData['quantity']);
    _ticketRef = snapshotData['ticket_ref'] as DocumentReference?;
    _eventRef = snapshotData['event_ref'] as DocumentReference?;
    _isVerified = snapshotData['is_verified'] as bool?;
    _ticketOwner = snapshotData['ticket_owner'] as DocumentReference?;
    _hasCheckedIn = snapshotData['has_checkedIn'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  static OrdersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      OrdersRecord.getDocumentFromData(
        {
          'ticket_id': snapshot.data['ticket_id'],
          'event_name': snapshot.data['event_name'],
          'ticket_name': snapshot.data['ticket_name'],
          'price': convertAlgoliaParam(
            snapshot.data['price'],
            ParamType.double,
            false,
          ),
          'quantity': convertAlgoliaParam(
            snapshot.data['quantity'],
            ParamType.int,
            false,
          ),
          'ticket_ref': convertAlgoliaParam(
            snapshot.data['ticket_ref'],
            ParamType.DocumentReference,
            false,
          ),
          'event_ref': convertAlgoliaParam(
            snapshot.data['event_ref'],
            ParamType.DocumentReference,
            false,
          ),
          'is_verified': snapshot.data['is_verified'],
          'ticket_owner': convertAlgoliaParam(
            snapshot.data['ticket_owner'],
            ParamType.DocumentReference,
            false,
          ),
          'has_checkedIn': snapshot.data['has_checkedIn'],
        },
        OrdersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<OrdersRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'orders',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  String? ticketId,
  String? eventName,
  String? ticketName,
  double? price,
  int? quantity,
  DocumentReference? ticketRef,
  DocumentReference? eventRef,
  bool? isVerified,
  DocumentReference? ticketOwner,
  bool? hasCheckedIn,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ticket_id': ticketId,
      'event_name': eventName,
      'ticket_name': ticketName,
      'price': price,
      'quantity': quantity,
      'ticket_ref': ticketRef,
      'event_ref': eventRef,
      'is_verified': isVerified,
      'ticket_owner': ticketOwner,
      'has_checkedIn': hasCheckedIn,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    return e1?.ticketId == e2?.ticketId &&
        e1?.eventName == e2?.eventName &&
        e1?.ticketName == e2?.ticketName &&
        e1?.price == e2?.price &&
        e1?.quantity == e2?.quantity &&
        e1?.ticketRef == e2?.ticketRef &&
        e1?.eventRef == e2?.eventRef &&
        e1?.isVerified == e2?.isVerified &&
        e1?.ticketOwner == e2?.ticketOwner &&
        e1?.hasCheckedIn == e2?.hasCheckedIn;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.ticketId,
        e?.eventName,
        e?.ticketName,
        e?.price,
        e?.quantity,
        e?.ticketRef,
        e?.eventRef,
        e?.isVerified,
        e?.ticketOwner,
        e?.hasCheckedIn
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
