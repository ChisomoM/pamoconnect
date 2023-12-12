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

class EventsRecord extends FirestoreRecord {
  EventsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "event_name" field.
  String? _eventName;
  String get eventName => _eventName ?? '';
  bool hasEventName() => _eventName != null;

  // "event_Org" field.
  DocumentReference? _eventOrg;
  DocumentReference? get eventOrg => _eventOrg;
  bool hasEventOrg() => _eventOrg != null;

  // "event_poster" field.
  String? _eventPoster;
  String get eventPoster => _eventPoster ?? '';
  bool hasEventPoster() => _eventPoster != null;

  // "event_description" field.
  String? _eventDescription;
  String get eventDescription => _eventDescription ?? '';
  bool hasEventDescription() => _eventDescription != null;

  // "event_details" field.
  String? _eventDetails;
  String get eventDetails => _eventDetails ?? '';
  bool hasEventDetails() => _eventDetails != null;

  // "event_location" field.
  LatLng? _eventLocation;
  LatLng? get eventLocation => _eventLocation;
  bool hasEventLocation() => _eventLocation != null;

  // "event_start" field.
  DateTime? _eventStart;
  DateTime? get eventStart => _eventStart;
  bool hasEventStart() => _eventStart != null;

  // "event_end" field.
  DateTime? _eventEnd;
  DateTime? get eventEnd => _eventEnd;
  bool hasEventEnd() => _eventEnd != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "performers" field.
  List<DocumentReference>? _performers;
  List<DocumentReference> get performers => _performers ?? const [];
  bool hasPerformers() => _performers != null;

  // "is_draft" field.
  bool? _isDraft;
  bool get isDraft => _isDraft ?? false;
  bool hasIsDraft() => _isDraft != null;

  // "event_venue" field.
  DocumentReference? _eventVenue;
  DocumentReference? get eventVenue => _eventVenue;
  bool hasEventVenue() => _eventVenue != null;

  // "requested_performers" field.
  List<DocumentReference>? _requestedPerformers;
  List<DocumentReference> get requestedPerformers =>
      _requestedPerformers ?? const [];
  bool hasRequestedPerformers() => _requestedPerformers != null;

  // "has_ticket" field.
  bool? _hasTicket;
  bool get hasTicket => _hasTicket ?? false;
  bool hasHasTicket() => _hasTicket != null;

  // "has_free" field.
  bool? _hasFree;
  bool get hasFree => _hasFree ?? false;
  bool hasHasFree() => _hasFree != null;

  // "requested_venue" field.
  DocumentReference? _requestedVenue;
  DocumentReference? get requestedVenue => _requestedVenue;
  bool hasRequestedVenue() => _requestedVenue != null;

  // "verified_venue" field.
  bool? _verifiedVenue;
  bool get verifiedVenue => _verifiedVenue ?? false;
  bool hasVerifiedVenue() => _verifiedVenue != null;

  // "has_venue" field.
  bool? _hasVenue;
  bool get hasVenue => _hasVenue ?? false;
  bool hasHasVenue() => _hasVenue != null;

  // "event_ID" field.
  String? _eventID;
  String get eventID => _eventID ?? '';
  bool hasEventID() => _eventID != null;

  // "buyer_gender" field.
  String? _buyerGender;
  String get buyerGender => _buyerGender ?? '';
  bool hasBuyerGender() => _buyerGender != null;

  // "buyer_age" field.
  int? _buyerAge;
  int get buyerAge => _buyerAge ?? 0;
  bool hasBuyerAge() => _buyerAge != null;

  // "revenue" field.
  double? _revenue;
  double get revenue => _revenue ?? 0.0;
  bool hasRevenue() => _revenue != null;

  // "tickets_sold" field.
  List<DocumentReference>? _ticketsSold;
  List<DocumentReference> get ticketsSold => _ticketsSold ?? const [];
  bool hasTicketsSold() => _ticketsSold != null;

  // "buyer_genders" field.
  List<String>? _buyerGenders;
  List<String> get buyerGenders => _buyerGenders ?? const [];
  bool hasBuyerGenders() => _buyerGenders != null;

  // "buyer_ages" field.
  List<int>? _buyerAges;
  List<int> get buyerAges => _buyerAges ?? const [];
  bool hasBuyerAges() => _buyerAges != null;

  // "date_created" field.
  DateTime? _dateCreated;
  DateTime? get dateCreated => _dateCreated;
  bool hasDateCreated() => _dateCreated != null;

  // "has_paid" field.
  bool? _hasPaid;
  bool get hasPaid => _hasPaid ?? false;
  bool hasHasPaid() => _hasPaid != null;

  // "users_bought" field.
  List<DocumentReference>? _usersBought;
  List<DocumentReference> get usersBought => _usersBought ?? const [];
  bool hasUsersBought() => _usersBought != null;

  // "tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  // "sold_tickets" field.
  int? _soldTickets;
  int get soldTickets => _soldTickets ?? 0;
  bool hasSoldTickets() => _soldTickets != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "is_private" field.
  bool? _isPrivate;
  bool get isPrivate => _isPrivate ?? false;
  bool hasIsPrivate() => _isPrivate != null;

  // "age_limit" field.
  int? _ageLimit;
  int get ageLimit => _ageLimit ?? 0;
  bool hasAgeLimit() => _ageLimit != null;

  // "refund_policy" field.
  String? _refundPolicy;
  String get refundPolicy => _refundPolicy ?? '';
  bool hasRefundPolicy() => _refundPolicy != null;

  // "lowest_ticket_price" field.
  double? _lowestTicketPrice;
  double get lowestTicketPrice => _lowestTicketPrice ?? 0.0;
  bool hasLowestTicketPrice() => _lowestTicketPrice != null;

  // "dress_code" field.
  String? _dressCode;
  String get dressCode => _dressCode ?? '';
  bool hasDressCode() => _dressCode != null;

  // "age_ranges" field.
  AgeRangesStruct? _ageRanges;
  AgeRangesStruct get ageRanges => _ageRanges ?? AgeRangesStruct();
  bool hasAgeRanges() => _ageRanges != null;

  void _initializeFields() {
    _eventName = snapshotData['event_name'] as String?;
    _eventOrg = snapshotData['event_Org'] as DocumentReference?;
    _eventPoster = snapshotData['event_poster'] as String?;
    _eventDescription = snapshotData['event_description'] as String?;
    _eventDetails = snapshotData['event_details'] as String?;
    _eventLocation = snapshotData['event_location'] as LatLng?;
    _eventStart = snapshotData['event_start'] as DateTime?;
    _eventEnd = snapshotData['event_end'] as DateTime?;
    _category = snapshotData['category'] as String?;
    _performers = getDataList(snapshotData['performers']);
    _isDraft = snapshotData['is_draft'] as bool?;
    _eventVenue = snapshotData['event_venue'] as DocumentReference?;
    _requestedPerformers = getDataList(snapshotData['requested_performers']);
    _hasTicket = snapshotData['has_ticket'] as bool?;
    _hasFree = snapshotData['has_free'] as bool?;
    _requestedVenue = snapshotData['requested_venue'] as DocumentReference?;
    _verifiedVenue = snapshotData['verified_venue'] as bool?;
    _hasVenue = snapshotData['has_venue'] as bool?;
    _eventID = snapshotData['event_ID'] as String?;
    _buyerGender = snapshotData['buyer_gender'] as String?;
    _buyerAge = castToType<int>(snapshotData['buyer_age']);
    _revenue = castToType<double>(snapshotData['revenue']);
    _ticketsSold = getDataList(snapshotData['tickets_sold']);
    _buyerGenders = getDataList(snapshotData['buyer_genders']);
    _buyerAges = getDataList(snapshotData['buyer_ages']);
    _dateCreated = snapshotData['date_created'] as DateTime?;
    _hasPaid = snapshotData['has_paid'] as bool?;
    _usersBought = getDataList(snapshotData['users_bought']);
    _tags = getDataList(snapshotData['tags']);
    _soldTickets = castToType<int>(snapshotData['sold_tickets']);
    _createdDate = snapshotData['created_date'] as DateTime?;
    _isPrivate = snapshotData['is_private'] as bool?;
    _ageLimit = castToType<int>(snapshotData['age_limit']);
    _refundPolicy = snapshotData['refund_policy'] as String?;
    _lowestTicketPrice =
        castToType<double>(snapshotData['lowest_ticket_price']);
    _dressCode = snapshotData['dress_code'] as String?;
    _ageRanges = AgeRangesStruct.maybeFromMap(snapshotData['age_ranges']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('events');

  static Stream<EventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventsRecord.fromSnapshot(s));

  static Future<EventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventsRecord.fromSnapshot(s));

  static EventsRecord fromSnapshot(DocumentSnapshot snapshot) => EventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventsRecord._(reference, mapFromFirestore(data));

  static EventsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      EventsRecord.getDocumentFromData(
        {
          'event_name': snapshot.data['event_name'],
          'event_Org': convertAlgoliaParam(
            snapshot.data['event_Org'],
            ParamType.DocumentReference,
            false,
          ),
          'event_poster': snapshot.data['event_poster'],
          'event_description': snapshot.data['event_description'],
          'event_details': snapshot.data['event_details'],
          'event_location': convertAlgoliaParam(
            snapshot.data,
            ParamType.LatLng,
            false,
          ),
          'event_start': convertAlgoliaParam(
            snapshot.data['event_start'],
            ParamType.DateTime,
            false,
          ),
          'event_end': convertAlgoliaParam(
            snapshot.data['event_end'],
            ParamType.DateTime,
            false,
          ),
          'category': snapshot.data['category'],
          'performers': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['performers'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'is_draft': snapshot.data['is_draft'],
          'event_venue': convertAlgoliaParam(
            snapshot.data['event_venue'],
            ParamType.DocumentReference,
            false,
          ),
          'requested_performers': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['requested_performers'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'has_ticket': snapshot.data['has_ticket'],
          'has_free': snapshot.data['has_free'],
          'requested_venue': convertAlgoliaParam(
            snapshot.data['requested_venue'],
            ParamType.DocumentReference,
            false,
          ),
          'verified_venue': snapshot.data['verified_venue'],
          'has_venue': snapshot.data['has_venue'],
          'event_ID': snapshot.data['event_ID'],
          'buyer_gender': snapshot.data['buyer_gender'],
          'buyer_age': convertAlgoliaParam(
            snapshot.data['buyer_age'],
            ParamType.int,
            false,
          ),
          'revenue': convertAlgoliaParam(
            snapshot.data['revenue'],
            ParamType.double,
            false,
          ),
          'tickets_sold': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['tickets_sold'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'buyer_genders': safeGet(
            () => snapshot.data['buyer_genders'].toList(),
          ),
          'buyer_ages': safeGet(
            () => convertAlgoliaParam<int>(
              snapshot.data['buyer_ages'],
              ParamType.int,
              true,
            ).toList(),
          ),
          'date_created': convertAlgoliaParam(
            snapshot.data['date_created'],
            ParamType.DateTime,
            false,
          ),
          'has_paid': snapshot.data['has_paid'],
          'users_bought': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['users_bought'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'tags': safeGet(
            () => snapshot.data['tags'].toList(),
          ),
          'sold_tickets': convertAlgoliaParam(
            snapshot.data['sold_tickets'],
            ParamType.int,
            false,
          ),
          'created_date': convertAlgoliaParam(
            snapshot.data['created_date'],
            ParamType.DateTime,
            false,
          ),
          'is_private': snapshot.data['is_private'],
          'age_limit': convertAlgoliaParam(
            snapshot.data['age_limit'],
            ParamType.int,
            false,
          ),
          'refund_policy': snapshot.data['refund_policy'],
          'lowest_ticket_price': convertAlgoliaParam(
            snapshot.data['lowest_ticket_price'],
            ParamType.double,
            false,
          ),
          'dress_code': snapshot.data['dress_code'],
          'age_ranges':
              AgeRangesStruct.fromAlgoliaData(snapshot.data['age_ranges'] ?? {})
                  .toMap(),
        },
        EventsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<EventsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'events',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'EventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventsRecordData({
  String? eventName,
  DocumentReference? eventOrg,
  String? eventPoster,
  String? eventDescription,
  String? eventDetails,
  LatLng? eventLocation,
  DateTime? eventStart,
  DateTime? eventEnd,
  String? category,
  bool? isDraft,
  DocumentReference? eventVenue,
  bool? hasTicket,
  bool? hasFree,
  DocumentReference? requestedVenue,
  bool? verifiedVenue,
  bool? hasVenue,
  String? eventID,
  String? buyerGender,
  int? buyerAge,
  double? revenue,
  DateTime? dateCreated,
  bool? hasPaid,
  int? soldTickets,
  DateTime? createdDate,
  bool? isPrivate,
  int? ageLimit,
  String? refundPolicy,
  double? lowestTicketPrice,
  String? dressCode,
  AgeRangesStruct? ageRanges,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'event_name': eventName,
      'event_Org': eventOrg,
      'event_poster': eventPoster,
      'event_description': eventDescription,
      'event_details': eventDetails,
      'event_location': eventLocation,
      'event_start': eventStart,
      'event_end': eventEnd,
      'category': category,
      'is_draft': isDraft,
      'event_venue': eventVenue,
      'has_ticket': hasTicket,
      'has_free': hasFree,
      'requested_venue': requestedVenue,
      'verified_venue': verifiedVenue,
      'has_venue': hasVenue,
      'event_ID': eventID,
      'buyer_gender': buyerGender,
      'buyer_age': buyerAge,
      'revenue': revenue,
      'date_created': dateCreated,
      'has_paid': hasPaid,
      'sold_tickets': soldTickets,
      'created_date': createdDate,
      'is_private': isPrivate,
      'age_limit': ageLimit,
      'refund_policy': refundPolicy,
      'lowest_ticket_price': lowestTicketPrice,
      'dress_code': dressCode,
      'age_ranges': AgeRangesStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "age_ranges" field.
  addAgeRangesStructData(firestoreData, ageRanges, 'age_ranges');

  return firestoreData;
}

class EventsRecordDocumentEquality implements Equality<EventsRecord> {
  const EventsRecordDocumentEquality();

  @override
  bool equals(EventsRecord? e1, EventsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.eventName == e2?.eventName &&
        e1?.eventOrg == e2?.eventOrg &&
        e1?.eventPoster == e2?.eventPoster &&
        e1?.eventDescription == e2?.eventDescription &&
        e1?.eventDetails == e2?.eventDetails &&
        e1?.eventLocation == e2?.eventLocation &&
        e1?.eventStart == e2?.eventStart &&
        e1?.eventEnd == e2?.eventEnd &&
        e1?.category == e2?.category &&
        listEquality.equals(e1?.performers, e2?.performers) &&
        e1?.isDraft == e2?.isDraft &&
        e1?.eventVenue == e2?.eventVenue &&
        listEquality.equals(e1?.requestedPerformers, e2?.requestedPerformers) &&
        e1?.hasTicket == e2?.hasTicket &&
        e1?.hasFree == e2?.hasFree &&
        e1?.requestedVenue == e2?.requestedVenue &&
        e1?.verifiedVenue == e2?.verifiedVenue &&
        e1?.hasVenue == e2?.hasVenue &&
        e1?.eventID == e2?.eventID &&
        e1?.buyerGender == e2?.buyerGender &&
        e1?.buyerAge == e2?.buyerAge &&
        e1?.revenue == e2?.revenue &&
        listEquality.equals(e1?.ticketsSold, e2?.ticketsSold) &&
        listEquality.equals(e1?.buyerGenders, e2?.buyerGenders) &&
        listEquality.equals(e1?.buyerAges, e2?.buyerAges) &&
        e1?.dateCreated == e2?.dateCreated &&
        e1?.hasPaid == e2?.hasPaid &&
        listEquality.equals(e1?.usersBought, e2?.usersBought) &&
        listEquality.equals(e1?.tags, e2?.tags) &&
        e1?.soldTickets == e2?.soldTickets &&
        e1?.createdDate == e2?.createdDate &&
        e1?.isPrivate == e2?.isPrivate &&
        e1?.ageLimit == e2?.ageLimit &&
        e1?.refundPolicy == e2?.refundPolicy &&
        e1?.lowestTicketPrice == e2?.lowestTicketPrice &&
        e1?.dressCode == e2?.dressCode &&
        e1?.ageRanges == e2?.ageRanges;
  }

  @override
  int hash(EventsRecord? e) => const ListEquality().hash([
        e?.eventName,
        e?.eventOrg,
        e?.eventPoster,
        e?.eventDescription,
        e?.eventDetails,
        e?.eventLocation,
        e?.eventStart,
        e?.eventEnd,
        e?.category,
        e?.performers,
        e?.isDraft,
        e?.eventVenue,
        e?.requestedPerformers,
        e?.hasTicket,
        e?.hasFree,
        e?.requestedVenue,
        e?.verifiedVenue,
        e?.hasVenue,
        e?.eventID,
        e?.buyerGender,
        e?.buyerAge,
        e?.revenue,
        e?.ticketsSold,
        e?.buyerGenders,
        e?.buyerAges,
        e?.dateCreated,
        e?.hasPaid,
        e?.usersBought,
        e?.tags,
        e?.soldTickets,
        e?.createdDate,
        e?.isPrivate,
        e?.ageLimit,
        e?.refundPolicy,
        e?.lowestTicketPrice,
        e?.dressCode,
        e?.ageRanges
      ]);

  @override
  bool isValidKey(Object? o) => o is EventsRecord;
}
