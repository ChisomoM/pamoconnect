import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VerifiedOrdersRecord extends FirestoreRecord {
  VerifiedOrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "verified" field.
  List<DocumentReference>? _verified;
  List<DocumentReference> get verified => _verified ?? const [];
  bool hasVerified() => _verified != null;

  void _initializeFields() {
    _verified = getDataList(snapshotData['verified']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('verified_orders');

  static Stream<VerifiedOrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VerifiedOrdersRecord.fromSnapshot(s));

  static Future<VerifiedOrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VerifiedOrdersRecord.fromSnapshot(s));

  static VerifiedOrdersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VerifiedOrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VerifiedOrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VerifiedOrdersRecord._(reference, mapFromFirestore(data));

  static VerifiedOrdersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      VerifiedOrdersRecord.getDocumentFromData(
        {
          'verified': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['verified'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
        },
        VerifiedOrdersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<VerifiedOrdersRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'verified_orders',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'VerifiedOrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VerifiedOrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVerifiedOrdersRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class VerifiedOrdersRecordDocumentEquality
    implements Equality<VerifiedOrdersRecord> {
  const VerifiedOrdersRecordDocumentEquality();

  @override
  bool equals(VerifiedOrdersRecord? e1, VerifiedOrdersRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.verified, e2?.verified);
  }

  @override
  int hash(VerifiedOrdersRecord? e) => const ListEquality().hash([e?.verified]);

  @override
  bool isValidKey(Object? o) => o is VerifiedOrdersRecord;
}
