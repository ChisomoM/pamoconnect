import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MyTicketsRecord extends FirestoreRecord {
  MyTicketsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ticket_name" field.
  String? _ticketName;
  String get ticketName => _ticketName ?? '';
  bool hasTicketName() => _ticketName != null;

  // "event_ref" field.
  DocumentReference? _eventRef;
  DocumentReference? get eventRef => _eventRef;
  bool hasEventRef() => _eventRef != null;

  // "ticket_ref" field.
  DocumentReference? _ticketRef;
  DocumentReference? get ticketRef => _ticketRef;
  bool hasTicketRef() => _ticketRef != null;

  // "my_ticket" field.
  CartItemTypeStruct? _myTicket;
  CartItemTypeStruct get myTicket => _myTicket ?? CartItemTypeStruct();
  bool hasMyTicket() => _myTicket != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _ticketName = snapshotData['ticket_name'] as String?;
    _eventRef = snapshotData['event_ref'] as DocumentReference?;
    _ticketRef = snapshotData['ticket_ref'] as DocumentReference?;
    _myTicket = CartItemTypeStruct.maybeFromMap(snapshotData['my_ticket']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('my_tickets')
          : FirebaseFirestore.instance.collectionGroup('my_tickets');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('my_tickets').doc();

  static Stream<MyTicketsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MyTicketsRecord.fromSnapshot(s));

  static Future<MyTicketsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MyTicketsRecord.fromSnapshot(s));

  static MyTicketsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MyTicketsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MyTicketsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MyTicketsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MyTicketsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MyTicketsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMyTicketsRecordData({
  String? ticketName,
  DocumentReference? eventRef,
  DocumentReference? ticketRef,
  CartItemTypeStruct? myTicket,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ticket_name': ticketName,
      'event_ref': eventRef,
      'ticket_ref': ticketRef,
      'my_ticket': CartItemTypeStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "my_ticket" field.
  addCartItemTypeStructData(firestoreData, myTicket, 'my_ticket');

  return firestoreData;
}

class MyTicketsRecordDocumentEquality implements Equality<MyTicketsRecord> {
  const MyTicketsRecordDocumentEquality();

  @override
  bool equals(MyTicketsRecord? e1, MyTicketsRecord? e2) {
    return e1?.ticketName == e2?.ticketName &&
        e1?.eventRef == e2?.eventRef &&
        e1?.ticketRef == e2?.ticketRef &&
        e1?.myTicket == e2?.myTicket;
  }

  @override
  int hash(MyTicketsRecord? e) => const ListEquality()
      .hash([e?.ticketName, e?.eventRef, e?.ticketRef, e?.myTicket]);

  @override
  bool isValidKey(Object? o) => o is MyTicketsRecord;
}
