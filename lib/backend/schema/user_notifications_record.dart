import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserNotificationsRecord extends FirestoreRecord {
  UserNotificationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "event_ref" field.
  DocumentReference? _eventRef;
  DocumentReference? get eventRef => _eventRef;
  bool hasEventRef() => _eventRef != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "sender_ref" field.
  DocumentReference? _senderRef;
  DocumentReference? get senderRef => _senderRef;
  bool hasSenderRef() => _senderRef != null;

  // "venue_ref" field.
  DocumentReference? _venueRef;
  DocumentReference? get venueRef => _venueRef;
  bool hasVenueRef() => _venueRef != null;

  // "notification_type" field.
  String? _notificationType;
  String get notificationType => _notificationType ?? '';
  bool hasNotificationType() => _notificationType != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _eventRef = snapshotData['event_ref'] as DocumentReference?;
    _time = snapshotData['time'] as DateTime?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _senderRef = snapshotData['sender_ref'] as DocumentReference?;
    _venueRef = snapshotData['venue_ref'] as DocumentReference?;
    _notificationType = snapshotData['notification_type'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_notifications')
          : FirebaseFirestore.instance.collectionGroup('user_notifications');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('user_notifications').doc();

  static Stream<UserNotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserNotificationsRecord.fromSnapshot(s));

  static Future<UserNotificationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => UserNotificationsRecord.fromSnapshot(s));

  static UserNotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserNotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserNotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserNotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserNotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserNotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserNotificationsRecordData({
  DocumentReference? eventRef,
  DateTime? time,
  DocumentReference? userRef,
  DocumentReference? senderRef,
  DocumentReference? venueRef,
  String? notificationType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'event_ref': eventRef,
      'time': time,
      'user_ref': userRef,
      'sender_ref': senderRef,
      'venue_ref': venueRef,
      'notification_type': notificationType,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserNotificationsRecordDocumentEquality
    implements Equality<UserNotificationsRecord> {
  const UserNotificationsRecordDocumentEquality();

  @override
  bool equals(UserNotificationsRecord? e1, UserNotificationsRecord? e2) {
    return e1?.eventRef == e2?.eventRef &&
        e1?.time == e2?.time &&
        e1?.userRef == e2?.userRef &&
        e1?.senderRef == e2?.senderRef &&
        e1?.venueRef == e2?.venueRef &&
        e1?.notificationType == e2?.notificationType;
  }

  @override
  int hash(UserNotificationsRecord? e) => const ListEquality().hash([
        e?.eventRef,
        e?.time,
        e?.userRef,
        e?.senderRef,
        e?.venueRef,
        e?.notificationType
      ]);

  @override
  bool isValidKey(Object? o) => o is UserNotificationsRecord;
}
