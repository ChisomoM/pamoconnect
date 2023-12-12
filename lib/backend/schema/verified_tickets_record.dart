import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VerifiedTicketsRecord extends FirestoreRecord {
  VerifiedTicketsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ticket" field.
  CartItemTypeStruct? _ticket;
  CartItemTypeStruct get ticket => _ticket ?? CartItemTypeStruct();
  bool hasTicket() => _ticket != null;

  // "is_verified" field.
  bool? _isVerified;
  bool get isVerified => _isVerified ?? false;
  bool hasIsVerified() => _isVerified != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _ticket = CartItemTypeStruct.maybeFromMap(snapshotData['ticket']);
    _isVerified = snapshotData['is_verified'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('verified_tickets')
          : FirebaseFirestore.instance.collectionGroup('verified_tickets');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('verified_tickets').doc();

  static Stream<VerifiedTicketsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VerifiedTicketsRecord.fromSnapshot(s));

  static Future<VerifiedTicketsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VerifiedTicketsRecord.fromSnapshot(s));

  static VerifiedTicketsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VerifiedTicketsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VerifiedTicketsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VerifiedTicketsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VerifiedTicketsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VerifiedTicketsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVerifiedTicketsRecordData({
  CartItemTypeStruct? ticket,
  bool? isVerified,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ticket': CartItemTypeStruct().toMap(),
      'is_verified': isVerified,
    }.withoutNulls,
  );

  // Handle nested data for "ticket" field.
  addCartItemTypeStructData(firestoreData, ticket, 'ticket');

  return firestoreData;
}

class VerifiedTicketsRecordDocumentEquality
    implements Equality<VerifiedTicketsRecord> {
  const VerifiedTicketsRecordDocumentEquality();

  @override
  bool equals(VerifiedTicketsRecord? e1, VerifiedTicketsRecord? e2) {
    return e1?.ticket == e2?.ticket && e1?.isVerified == e2?.isVerified;
  }

  @override
  int hash(VerifiedTicketsRecord? e) =>
      const ListEquality().hash([e?.ticket, e?.isVerified]);

  @override
  bool isValidKey(Object? o) => o is VerifiedTicketsRecord;
}
