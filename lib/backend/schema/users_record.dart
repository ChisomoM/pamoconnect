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

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "account_type" field.
  String? _accountType;
  String get accountType => _accountType ?? '';
  bool hasAccountType() => _accountType != null;

  // "performer_type" field.
  String? _performerType;
  String get performerType => _performerType ?? '';
  bool hasPerformerType() => _performerType != null;

  // "following" field.
  List<DocumentReference>? _following;
  List<DocumentReference> get following => _following ?? const [];
  bool hasFollowing() => _following != null;

  // "followers" field.
  List<DocumentReference>? _followers;
  List<DocumentReference> get followers => _followers ?? const [];
  bool hasFollowers() => _followers != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "birthday" field.
  DateTime? _birthday;
  DateTime? get birthday => _birthday;
  bool hasBirthday() => _birthday != null;

  // "userRevenue" field.
  double? _userRevenue;
  double get userRevenue => _userRevenue ?? 0.0;
  bool hasUserRevenue() => _userRevenue != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "venue_ref" field.
  DocumentReference? _venueRef;
  DocumentReference? get venueRef => _venueRef;
  bool hasVenueRef() => _venueRef != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "linktree" field.
  String? _linktree;
  String get linktree => _linktree ?? '';
  bool hasLinktree() => _linktree != null;

  // "highlight_video" field.
  String? _highlightVideo;
  String get highlightVideo => _highlightVideo ?? '';
  bool hasHighlightVideo() => _highlightVideo != null;

  // "highlight_video_string" field.
  String? _highlightVideoString;
  String get highlightVideoString => _highlightVideoString ?? '';
  bool hasHighlightVideoString() => _highlightVideoString != null;

  // "is_verified" field.
  bool? _isVerified;
  bool get isVerified => _isVerified ?? false;
  bool hasIsVerified() => _isVerified != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "last_active_time" field.
  DateTime? _lastActiveTime;
  DateTime? get lastActiveTime => _lastActiveTime;
  bool hasLastActiveTime() => _lastActiveTime != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _name = snapshotData['name'] as String?;
    _accountType = snapshotData['account_type'] as String?;
    _performerType = snapshotData['performer_type'] as String?;
    _following = getDataList(snapshotData['following']);
    _followers = getDataList(snapshotData['followers']);
    _bio = snapshotData['bio'] as String?;
    _gender = snapshotData['gender'] as String?;
    _birthday = snapshotData['birthday'] as DateTime?;
    _userRevenue = castToType<double>(snapshotData['userRevenue']);
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _venueRef = snapshotData['venue_ref'] as DocumentReference?;
    _city = snapshotData['city'] as String?;
    _linktree = snapshotData['linktree'] as String?;
    _highlightVideo = snapshotData['highlight_video'] as String?;
    _highlightVideoString = snapshotData['highlight_video_string'] as String?;
    _isVerified = snapshotData['is_verified'] as bool?;
    _shortDescription = snapshotData['shortDescription'] as String?;
    _lastActiveTime = snapshotData['last_active_time'] as DateTime?;
    _role = snapshotData['role'] as String?;
    _title = snapshotData['title'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  static UsersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      UsersRecord.getDocumentFromData(
        {
          'email': snapshot.data['email'],
          'display_name': snapshot.data['display_name'],
          'photo_url': snapshot.data['photo_url'],
          'uid': snapshot.data['uid'],
          'created_time': convertAlgoliaParam(
            snapshot.data['created_time'],
            ParamType.DateTime,
            false,
          ),
          'phone_number': snapshot.data['phone_number'],
          'name': snapshot.data['name'],
          'account_type': snapshot.data['account_type'],
          'performer_type': snapshot.data['performer_type'],
          'following': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['following'],
              ParamType.DocumentReference,
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
          'bio': snapshot.data['bio'],
          'gender': snapshot.data['gender'],
          'birthday': convertAlgoliaParam(
            snapshot.data['birthday'],
            ParamType.DateTime,
            false,
          ),
          'userRevenue': convertAlgoliaParam(
            snapshot.data['userRevenue'],
            ParamType.double,
            false,
          ),
          'user_ref': convertAlgoliaParam(
            snapshot.data['user_ref'],
            ParamType.DocumentReference,
            false,
          ),
          'venue_ref': convertAlgoliaParam(
            snapshot.data['venue_ref'],
            ParamType.DocumentReference,
            false,
          ),
          'city': snapshot.data['city'],
          'linktree': snapshot.data['linktree'],
          'highlight_video': snapshot.data['highlight_video'],
          'highlight_video_string': snapshot.data['highlight_video_string'],
          'is_verified': snapshot.data['is_verified'],
          'shortDescription': snapshot.data['shortDescription'],
          'last_active_time': convertAlgoliaParam(
            snapshot.data['last_active_time'],
            ParamType.DateTime,
            false,
          ),
          'role': snapshot.data['role'],
          'title': snapshot.data['title'],
        },
        UsersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UsersRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'users',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? name,
  String? accountType,
  String? performerType,
  String? bio,
  String? gender,
  DateTime? birthday,
  double? userRevenue,
  DocumentReference? userRef,
  DocumentReference? venueRef,
  String? city,
  String? linktree,
  String? highlightVideo,
  String? highlightVideoString,
  bool? isVerified,
  String? shortDescription,
  DateTime? lastActiveTime,
  String? role,
  String? title,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'name': name,
      'account_type': accountType,
      'performer_type': performerType,
      'bio': bio,
      'gender': gender,
      'birthday': birthday,
      'userRevenue': userRevenue,
      'user_ref': userRef,
      'venue_ref': venueRef,
      'city': city,
      'linktree': linktree,
      'highlight_video': highlightVideo,
      'highlight_video_string': highlightVideoString,
      'is_verified': isVerified,
      'shortDescription': shortDescription,
      'last_active_time': lastActiveTime,
      'role': role,
      'title': title,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.name == e2?.name &&
        e1?.accountType == e2?.accountType &&
        e1?.performerType == e2?.performerType &&
        listEquality.equals(e1?.following, e2?.following) &&
        listEquality.equals(e1?.followers, e2?.followers) &&
        e1?.bio == e2?.bio &&
        e1?.gender == e2?.gender &&
        e1?.birthday == e2?.birthday &&
        e1?.userRevenue == e2?.userRevenue &&
        e1?.userRef == e2?.userRef &&
        e1?.venueRef == e2?.venueRef &&
        e1?.city == e2?.city &&
        e1?.linktree == e2?.linktree &&
        e1?.highlightVideo == e2?.highlightVideo &&
        e1?.highlightVideoString == e2?.highlightVideoString &&
        e1?.isVerified == e2?.isVerified &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.lastActiveTime == e2?.lastActiveTime &&
        e1?.role == e2?.role &&
        e1?.title == e2?.title;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.name,
        e?.accountType,
        e?.performerType,
        e?.following,
        e?.followers,
        e?.bio,
        e?.gender,
        e?.birthday,
        e?.userRevenue,
        e?.userRef,
        e?.venueRef,
        e?.city,
        e?.linktree,
        e?.highlightVideo,
        e?.highlightVideoString,
        e?.isVerified,
        e?.shortDescription,
        e?.lastActiveTime,
        e?.role,
        e?.title
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
