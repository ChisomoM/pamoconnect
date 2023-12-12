// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartItemTypeStruct extends FFFirebaseStruct {
  CartItemTypeStruct({
    DocumentReference? userRef,
    DocumentReference? eventRef,
    DocumentReference? ticketRef,
    double? price,
    String? ticketId,
    bool? hasCheckedIn,
    DateTime? dateBought,
    DateTime? dateCheckedIn,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userRef = userRef,
        _eventRef = eventRef,
        _ticketRef = ticketRef,
        _price = price,
        _ticketId = ticketId,
        _hasCheckedIn = hasCheckedIn,
        _dateBought = dateBought,
        _dateCheckedIn = dateCheckedIn,
        super(firestoreUtilData);

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  set userRef(DocumentReference? val) => _userRef = val;
  bool hasUserRef() => _userRef != null;

  // "event_ref" field.
  DocumentReference? _eventRef;
  DocumentReference? get eventRef => _eventRef;
  set eventRef(DocumentReference? val) => _eventRef = val;
  bool hasEventRef() => _eventRef != null;

  // "ticket_ref" field.
  DocumentReference? _ticketRef;
  DocumentReference? get ticketRef => _ticketRef;
  set ticketRef(DocumentReference? val) => _ticketRef = val;
  bool hasTicketRef() => _ticketRef != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;
  void incrementPrice(double amount) => _price = price + amount;
  bool hasPrice() => _price != null;

  // "ticket_id" field.
  String? _ticketId;
  String get ticketId => _ticketId ?? '';
  set ticketId(String? val) => _ticketId = val;
  bool hasTicketId() => _ticketId != null;

  // "has_checked_in" field.
  bool? _hasCheckedIn;
  bool get hasCheckedIn => _hasCheckedIn ?? false;
  set hasCheckedIn(bool? val) => _hasCheckedIn = val;
  bool hasHasCheckedIn() => _hasCheckedIn != null;

  // "date_bought" field.
  DateTime? _dateBought;
  DateTime? get dateBought => _dateBought;
  set dateBought(DateTime? val) => _dateBought = val;
  bool hasDateBought() => _dateBought != null;

  // "date_checked_in" field.
  DateTime? _dateCheckedIn;
  DateTime? get dateCheckedIn => _dateCheckedIn;
  set dateCheckedIn(DateTime? val) => _dateCheckedIn = val;
  bool hasDateCheckedIn() => _dateCheckedIn != null;

  static CartItemTypeStruct fromMap(Map<String, dynamic> data) =>
      CartItemTypeStruct(
        userRef: data['user_ref'] as DocumentReference?,
        eventRef: data['event_ref'] as DocumentReference?,
        ticketRef: data['ticket_ref'] as DocumentReference?,
        price: castToType<double>(data['price']),
        ticketId: data['ticket_id'] as String?,
        hasCheckedIn: data['has_checked_in'] as bool?,
        dateBought: data['date_bought'] as DateTime?,
        dateCheckedIn: data['date_checked_in'] as DateTime?,
      );

  static CartItemTypeStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CartItemTypeStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'user_ref': _userRef,
        'event_ref': _eventRef,
        'ticket_ref': _ticketRef,
        'price': _price,
        'ticket_id': _ticketId,
        'has_checked_in': _hasCheckedIn,
        'date_bought': _dateBought,
        'date_checked_in': _dateCheckedIn,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user_ref': serializeParam(
          _userRef,
          ParamType.DocumentReference,
        ),
        'event_ref': serializeParam(
          _eventRef,
          ParamType.DocumentReference,
        ),
        'ticket_ref': serializeParam(
          _ticketRef,
          ParamType.DocumentReference,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'ticket_id': serializeParam(
          _ticketId,
          ParamType.String,
        ),
        'has_checked_in': serializeParam(
          _hasCheckedIn,
          ParamType.bool,
        ),
        'date_bought': serializeParam(
          _dateBought,
          ParamType.DateTime,
        ),
        'date_checked_in': serializeParam(
          _dateCheckedIn,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static CartItemTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      CartItemTypeStruct(
        userRef: deserializeParam(
          data['user_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        eventRef: deserializeParam(
          data['event_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['events'],
        ),
        ticketRef: deserializeParam(
          data['ticket_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['events', 'tickets'],
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        ticketId: deserializeParam(
          data['ticket_id'],
          ParamType.String,
          false,
        ),
        hasCheckedIn: deserializeParam(
          data['has_checked_in'],
          ParamType.bool,
          false,
        ),
        dateBought: deserializeParam(
          data['date_bought'],
          ParamType.DateTime,
          false,
        ),
        dateCheckedIn: deserializeParam(
          data['date_checked_in'],
          ParamType.DateTime,
          false,
        ),
      );

  static CartItemTypeStruct fromAlgoliaData(Map<String, dynamic> data) =>
      CartItemTypeStruct(
        userRef: convertAlgoliaParam(
          data['user_ref'],
          ParamType.DocumentReference,
          false,
        ),
        eventRef: convertAlgoliaParam(
          data['event_ref'],
          ParamType.DocumentReference,
          false,
        ),
        ticketRef: convertAlgoliaParam(
          data['ticket_ref'],
          ParamType.DocumentReference,
          false,
        ),
        price: convertAlgoliaParam(
          data['price'],
          ParamType.double,
          false,
        ),
        ticketId: convertAlgoliaParam(
          data['ticket_id'],
          ParamType.String,
          false,
        ),
        hasCheckedIn: convertAlgoliaParam(
          data['has_checked_in'],
          ParamType.bool,
          false,
        ),
        dateBought: convertAlgoliaParam(
          data['date_bought'],
          ParamType.DateTime,
          false,
        ),
        dateCheckedIn: convertAlgoliaParam(
          data['date_checked_in'],
          ParamType.DateTime,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'CartItemTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CartItemTypeStruct &&
        userRef == other.userRef &&
        eventRef == other.eventRef &&
        ticketRef == other.ticketRef &&
        price == other.price &&
        ticketId == other.ticketId &&
        hasCheckedIn == other.hasCheckedIn &&
        dateBought == other.dateBought &&
        dateCheckedIn == other.dateCheckedIn;
  }

  @override
  int get hashCode => const ListEquality().hash([
        userRef,
        eventRef,
        ticketRef,
        price,
        ticketId,
        hasCheckedIn,
        dateBought,
        dateCheckedIn
      ]);
}

CartItemTypeStruct createCartItemTypeStruct({
  DocumentReference? userRef,
  DocumentReference? eventRef,
  DocumentReference? ticketRef,
  double? price,
  String? ticketId,
  bool? hasCheckedIn,
  DateTime? dateBought,
  DateTime? dateCheckedIn,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CartItemTypeStruct(
      userRef: userRef,
      eventRef: eventRef,
      ticketRef: ticketRef,
      price: price,
      ticketId: ticketId,
      hasCheckedIn: hasCheckedIn,
      dateBought: dateBought,
      dateCheckedIn: dateCheckedIn,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CartItemTypeStruct? updateCartItemTypeStruct(
  CartItemTypeStruct? cartItemType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cartItemType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCartItemTypeStructData(
  Map<String, dynamic> firestoreData,
  CartItemTypeStruct? cartItemType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cartItemType == null) {
    return;
  }
  if (cartItemType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cartItemType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cartItemTypeData =
      getCartItemTypeFirestoreData(cartItemType, forFieldValue);
  final nestedData =
      cartItemTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cartItemType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCartItemTypeFirestoreData(
  CartItemTypeStruct? cartItemType, [
  bool forFieldValue = false,
]) {
  if (cartItemType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cartItemType.toMap());

  // Add any Firestore field values
  cartItemType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCartItemTypeListFirestoreData(
  List<CartItemTypeStruct>? cartItemTypes,
) =>
    cartItemTypes?.map((e) => getCartItemTypeFirestoreData(e, true)).toList() ??
    [];
