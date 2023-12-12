import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TicketsRecord extends FirestoreRecord {
  TicketsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ticket_name" field.
  String? _ticketName;
  String get ticketName => _ticketName ?? '';
  bool hasTicketName() => _ticketName != null;

  // "ticket_price" field.
  double? _ticketPrice;
  double get ticketPrice => _ticketPrice ?? 0.0;
  bool hasTicketPrice() => _ticketPrice != null;

  // "ticket_description" field.
  String? _ticketDescription;
  String get ticketDescription => _ticketDescription ?? '';
  bool hasTicketDescription() => _ticketDescription != null;

  // "is_paid" field.
  bool? _isPaid;
  bool get isPaid => _isPaid ?? false;
  bool hasIsPaid() => _isPaid != null;

  // "event_ref" field.
  DocumentReference? _eventRef;
  DocumentReference? get eventRef => _eventRef;
  bool hasEventRef() => _eventRef != null;

  // "has_limit" field.
  bool? _hasLimit;
  bool get hasLimit => _hasLimit ?? false;
  bool hasHasLimit() => _hasLimit != null;

  // "tickets_sold" field.
  List<DocumentReference>? _ticketsSold;
  List<DocumentReference> get ticketsSold => _ticketsSold ?? const [];
  bool hasTicketsSold() => _ticketsSold != null;

  // "ticket_limit" field.
  int? _ticketLimit;
  int get ticketLimit => _ticketLimit ?? 0;
  bool hasTicketLimit() => _ticketLimit != null;

  // "purchase_deadline" field.
  DateTime? _purchaseDeadline;
  DateTime? get purchaseDeadline => _purchaseDeadline;
  bool hasPurchaseDeadline() => _purchaseDeadline != null;

  // "event_end" field.
  DateTime? _eventEnd;
  DateTime? get eventEnd => _eventEnd;
  bool hasEventEnd() => _eventEnd != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _ticketName = snapshotData['ticket_name'] as String?;
    _ticketPrice = castToType<double>(snapshotData['ticket_price']);
    _ticketDescription = snapshotData['ticket_description'] as String?;
    _isPaid = snapshotData['is_paid'] as bool?;
    _eventRef = snapshotData['event_ref'] as DocumentReference?;
    _hasLimit = snapshotData['has_limit'] as bool?;
    _ticketsSold = getDataList(snapshotData['tickets_sold']);
    _ticketLimit = castToType<int>(snapshotData['ticket_limit']);
    _purchaseDeadline = snapshotData['purchase_deadline'] as DateTime?;
    _eventEnd = snapshotData['event_end'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('tickets')
          : FirebaseFirestore.instance.collectionGroup('tickets');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('tickets').doc();

  static Stream<TicketsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TicketsRecord.fromSnapshot(s));

  static Future<TicketsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TicketsRecord.fromSnapshot(s));

  static TicketsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TicketsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TicketsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TicketsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TicketsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TicketsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTicketsRecordData({
  String? ticketName,
  double? ticketPrice,
  String? ticketDescription,
  bool? isPaid,
  DocumentReference? eventRef,
  bool? hasLimit,
  int? ticketLimit,
  DateTime? purchaseDeadline,
  DateTime? eventEnd,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ticket_name': ticketName,
      'ticket_price': ticketPrice,
      'ticket_description': ticketDescription,
      'is_paid': isPaid,
      'event_ref': eventRef,
      'has_limit': hasLimit,
      'ticket_limit': ticketLimit,
      'purchase_deadline': purchaseDeadline,
      'event_end': eventEnd,
    }.withoutNulls,
  );

  return firestoreData;
}

class TicketsRecordDocumentEquality implements Equality<TicketsRecord> {
  const TicketsRecordDocumentEquality();

  @override
  bool equals(TicketsRecord? e1, TicketsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.ticketName == e2?.ticketName &&
        e1?.ticketPrice == e2?.ticketPrice &&
        e1?.ticketDescription == e2?.ticketDescription &&
        e1?.isPaid == e2?.isPaid &&
        e1?.eventRef == e2?.eventRef &&
        e1?.hasLimit == e2?.hasLimit &&
        listEquality.equals(e1?.ticketsSold, e2?.ticketsSold) &&
        e1?.ticketLimit == e2?.ticketLimit &&
        e1?.purchaseDeadline == e2?.purchaseDeadline &&
        e1?.eventEnd == e2?.eventEnd;
  }

  @override
  int hash(TicketsRecord? e) => const ListEquality().hash([
        e?.ticketName,
        e?.ticketPrice,
        e?.ticketDescription,
        e?.isPaid,
        e?.eventRef,
        e?.hasLimit,
        e?.ticketsSold,
        e?.ticketLimit,
        e?.purchaseDeadline,
        e?.eventEnd
      ]);

  @override
  bool isValidKey(Object? o) => o is TicketsRecord;
}
