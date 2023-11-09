import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PromoCodesRecord extends FirestoreRecord {
  PromoCodesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "event_ref" field.
  DocumentReference? _eventRef;
  DocumentReference? get eventRef => _eventRef;
  bool hasEventRef() => _eventRef != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "expiry_date" field.
  DateTime? _expiryDate;
  DateTime? get expiryDate => _expiryDate;
  bool hasExpiryDate() => _expiryDate != null;

  // "promo_code" field.
  String? _promoCode;
  String get promoCode => _promoCode ?? '';
  bool hasPromoCode() => _promoCode != null;

  // "discount_amount" field.
  double? _discountAmount;
  double get discountAmount => _discountAmount ?? 0.0;
  bool hasDiscountAmount() => _discountAmount != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _eventRef = snapshotData['event_ref'] as DocumentReference?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _expiryDate = snapshotData['expiry_date'] as DateTime?;
    _promoCode = snapshotData['promo_code'] as String?;
    _discountAmount = castToType<double>(snapshotData['discount_amount']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('promo_codes')
          : FirebaseFirestore.instance.collectionGroup('promo_codes');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('promo_codes').doc();

  static Stream<PromoCodesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PromoCodesRecord.fromSnapshot(s));

  static Future<PromoCodesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PromoCodesRecord.fromSnapshot(s));

  static PromoCodesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PromoCodesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PromoCodesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PromoCodesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PromoCodesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PromoCodesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPromoCodesRecordData({
  DocumentReference? eventRef,
  DateTime? createdTime,
  DateTime? expiryDate,
  String? promoCode,
  double? discountAmount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'event_ref': eventRef,
      'created_time': createdTime,
      'expiry_date': expiryDate,
      'promo_code': promoCode,
      'discount_amount': discountAmount,
    }.withoutNulls,
  );

  return firestoreData;
}

class PromoCodesRecordDocumentEquality implements Equality<PromoCodesRecord> {
  const PromoCodesRecordDocumentEquality();

  @override
  bool equals(PromoCodesRecord? e1, PromoCodesRecord? e2) {
    return e1?.eventRef == e2?.eventRef &&
        e1?.createdTime == e2?.createdTime &&
        e1?.expiryDate == e2?.expiryDate &&
        e1?.promoCode == e2?.promoCode &&
        e1?.discountAmount == e2?.discountAmount;
  }

  @override
  int hash(PromoCodesRecord? e) => const ListEquality().hash([
        e?.eventRef,
        e?.createdTime,
        e?.expiryDate,
        e?.promoCode,
        e?.discountAmount
      ]);

  @override
  bool isValidKey(Object? o) => o is PromoCodesRecord;
}
