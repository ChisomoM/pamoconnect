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

class VenuesRecord extends FirestoreRecord {
  VenuesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "venue_name" field.
  String? _venueName;
  String get venueName => _venueName ?? '';
  bool hasVenueName() => _venueName != null;

  // "venue_location" field.
  LatLng? _venueLocation;
  LatLng? get venueLocation => _venueLocation;
  bool hasVenueLocation() => _venueLocation != null;

  // "venue_image" field.
  String? _venueImage;
  String get venueImage => _venueImage ?? '';
  bool hasVenueImage() => _venueImage != null;

  // "venue_owner" field.
  DocumentReference? _venueOwner;
  DocumentReference? get venueOwner => _venueOwner;
  bool hasVenueOwner() => _venueOwner != null;

  // "venue_type" field.
  String? _venueType;
  String get venueType => _venueType ?? '';
  bool hasVenueType() => _venueType != null;

  // "venue_description" field.
  String? _venueDescription;
  String get venueDescription => _venueDescription ?? '';
  bool hasVenueDescription() => _venueDescription != null;

  // "venue_category" field.
  List<String>? _venueCategory;
  List<String> get venueCategory => _venueCategory ?? const [];
  bool hasVenueCategory() => _venueCategory != null;

  // "venue_address" field.
  String? _venueAddress;
  String get venueAddress => _venueAddress ?? '';
  bool hasVenueAddress() => _venueAddress != null;

  // "venue_rating" field.
  List<int>? _venueRating;
  List<int> get venueRating => _venueRating ?? const [];
  bool hasVenueRating() => _venueRating != null;

  // "followers" field.
  List<DocumentReference>? _followers;
  List<DocumentReference> get followers => _followers ?? const [];
  bool hasFollowers() => _followers != null;

  // "date_created" field.
  DateTime? _dateCreated;
  DateTime? get dateCreated => _dateCreated;
  bool hasDateCreated() => _dateCreated != null;

  // "gallery" field.
  List<String>? _gallery;
  List<String> get gallery => _gallery ?? const [];
  bool hasGallery() => _gallery != null;

  void _initializeFields() {
    _venueName = snapshotData['venue_name'] as String?;
    _venueLocation = snapshotData['venue_location'] as LatLng?;
    _venueImage = snapshotData['venue_image'] as String?;
    _venueOwner = snapshotData['venue_owner'] as DocumentReference?;
    _venueType = snapshotData['venue_type'] as String?;
    _venueDescription = snapshotData['venue_description'] as String?;
    _venueCategory = getDataList(snapshotData['venue_category']);
    _venueAddress = snapshotData['venue_address'] as String?;
    _venueRating = getDataList(snapshotData['venue_rating']);
    _followers = getDataList(snapshotData['followers']);
    _dateCreated = snapshotData['date_created'] as DateTime?;
    _gallery = getDataList(snapshotData['gallery']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('venues');

  static Stream<VenuesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VenuesRecord.fromSnapshot(s));

  static Future<VenuesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VenuesRecord.fromSnapshot(s));

  static VenuesRecord fromSnapshot(DocumentSnapshot snapshot) => VenuesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VenuesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VenuesRecord._(reference, mapFromFirestore(data));

  static VenuesRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      VenuesRecord.getDocumentFromData(
        {
          'venue_name': snapshot.data['venue_name'],
          'venue_location': convertAlgoliaParam(
            snapshot.data,
            ParamType.LatLng,
            false,
          ),
          'venue_image': snapshot.data['venue_image'],
          'venue_owner': convertAlgoliaParam(
            snapshot.data['venue_owner'],
            ParamType.DocumentReference,
            false,
          ),
          'venue_type': snapshot.data['venue_type'],
          'venue_description': snapshot.data['venue_description'],
          'venue_category': safeGet(
            () => snapshot.data['venue_category'].toList(),
          ),
          'venue_address': snapshot.data['venue_address'],
          'venue_rating': safeGet(
            () => convertAlgoliaParam<int>(
              snapshot.data['venue_rating'],
              ParamType.int,
              true,
            ).toList(),
          ),
          'followers': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['followers'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'date_created': convertAlgoliaParam(
            snapshot.data['date_created'],
            ParamType.DateTime,
            false,
          ),
          'gallery': safeGet(
            () => snapshot.data['gallery'].toList(),
          ),
        },
        VenuesRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<VenuesRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'venues',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'VenuesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VenuesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVenuesRecordData({
  String? venueName,
  LatLng? venueLocation,
  String? venueImage,
  DocumentReference? venueOwner,
  String? venueType,
  String? venueDescription,
  String? venueAddress,
  DateTime? dateCreated,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'venue_name': venueName,
      'venue_location': venueLocation,
      'venue_image': venueImage,
      'venue_owner': venueOwner,
      'venue_type': venueType,
      'venue_description': venueDescription,
      'venue_address': venueAddress,
      'date_created': dateCreated,
    }.withoutNulls,
  );

  return firestoreData;
}

class VenuesRecordDocumentEquality implements Equality<VenuesRecord> {
  const VenuesRecordDocumentEquality();

  @override
  bool equals(VenuesRecord? e1, VenuesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.venueName == e2?.venueName &&
        e1?.venueLocation == e2?.venueLocation &&
        e1?.venueImage == e2?.venueImage &&
        e1?.venueOwner == e2?.venueOwner &&
        e1?.venueType == e2?.venueType &&
        e1?.venueDescription == e2?.venueDescription &&
        listEquality.equals(e1?.venueCategory, e2?.venueCategory) &&
        e1?.venueAddress == e2?.venueAddress &&
        listEquality.equals(e1?.venueRating, e2?.venueRating) &&
        listEquality.equals(e1?.followers, e2?.followers) &&
        e1?.dateCreated == e2?.dateCreated &&
        listEquality.equals(e1?.gallery, e2?.gallery);
  }

  @override
  int hash(VenuesRecord? e) => const ListEquality().hash([
        e?.venueName,
        e?.venueLocation,
        e?.venueImage,
        e?.venueOwner,
        e?.venueType,
        e?.venueDescription,
        e?.venueCategory,
        e?.venueAddress,
        e?.venueRating,
        e?.followers,
        e?.dateCreated,
        e?.gallery
      ]);

  @override
  bool isValidKey(Object? o) => o is VenuesRecord;
}
