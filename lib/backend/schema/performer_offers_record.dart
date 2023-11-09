import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PerformerOffersRecord extends FirestoreRecord {
  PerformerOffersRecord._(
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

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _offerAmount = castToType<double>(snapshotData['offer_amount']);
    _performer = snapshotData['performer'] as DocumentReference?;
    _offerDetails = snapshotData['offer_details'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('performer_offers')
          : FirebaseFirestore.instance.collectionGroup('performer_offers');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('performer_offers').doc();

  static Stream<PerformerOffersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PerformerOffersRecord.fromSnapshot(s));

  static Future<PerformerOffersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PerformerOffersRecord.fromSnapshot(s));

  static PerformerOffersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PerformerOffersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PerformerOffersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PerformerOffersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PerformerOffersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PerformerOffersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPerformerOffersRecordData({
  double? offerAmount,
  DocumentReference? performer,
  String? offerDetails,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'offer_amount': offerAmount,
      'performer': performer,
      'offer_details': offerDetails,
    }.withoutNulls,
  );

  return firestoreData;
}

class PerformerOffersRecordDocumentEquality
    implements Equality<PerformerOffersRecord> {
  const PerformerOffersRecordDocumentEquality();

  @override
  bool equals(PerformerOffersRecord? e1, PerformerOffersRecord? e2) {
    return e1?.offerAmount == e2?.offerAmount &&
        e1?.performer == e2?.performer &&
        e1?.offerDetails == e2?.offerDetails;
  }

  @override
  int hash(PerformerOffersRecord? e) => const ListEquality()
      .hash([e?.offerAmount, e?.performer, e?.offerDetails]);

  @override
  bool isValidKey(Object? o) => o is PerformerOffersRecord;
}
