// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AgeRangesStruct extends FFFirebaseStruct {
  AgeRangesStruct({
    int? lessThan20,
    int? a2025,
    int? a2529,
    int? a3034,
    int? a3539,
    int? a40Plus,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _lessThan20 = lessThan20,
        _a2025 = a2025,
        _a2529 = a2529,
        _a3034 = a3034,
        _a3539 = a3539,
        _a40Plus = a40Plus,
        super(firestoreUtilData);

  // "lessThan20" field.
  int? _lessThan20;
  int get lessThan20 => _lessThan20 ?? 0;
  set lessThan20(int? val) => _lessThan20 = val;
  void incrementLessThan20(int amount) => _lessThan20 = lessThan20 + amount;
  bool hasLessThan20() => _lessThan20 != null;

  // "a20-25" field.
  int? _a2025;
  int get a2025 => _a2025 ?? 0;
  set a2025(int? val) => _a2025 = val;
  void incrementA2025(int amount) => _a2025 = a2025 + amount;
  bool hasA2025() => _a2025 != null;

  // "a25-29" field.
  int? _a2529;
  int get a2529 => _a2529 ?? 0;
  set a2529(int? val) => _a2529 = val;
  void incrementA2529(int amount) => _a2529 = a2529 + amount;
  bool hasA2529() => _a2529 != null;

  // "a30-34" field.
  int? _a3034;
  int get a3034 => _a3034 ?? 0;
  set a3034(int? val) => _a3034 = val;
  void incrementA3034(int amount) => _a3034 = a3034 + amount;
  bool hasA3034() => _a3034 != null;

  // "a35-39" field.
  int? _a3539;
  int get a3539 => _a3539 ?? 0;
  set a3539(int? val) => _a3539 = val;
  void incrementA3539(int amount) => _a3539 = a3539 + amount;
  bool hasA3539() => _a3539 != null;

  // "a40Plus" field.
  int? _a40Plus;
  int get a40Plus => _a40Plus ?? 0;
  set a40Plus(int? val) => _a40Plus = val;
  void incrementA40Plus(int amount) => _a40Plus = a40Plus + amount;
  bool hasA40Plus() => _a40Plus != null;

  static AgeRangesStruct fromMap(Map<String, dynamic> data) => AgeRangesStruct(
        lessThan20: castToType<int>(data['lessThan20']),
        a2025: castToType<int>(data['a20-25']),
        a2529: castToType<int>(data['a25-29']),
        a3034: castToType<int>(data['a30-34']),
        a3539: castToType<int>(data['a35-39']),
        a40Plus: castToType<int>(data['a40Plus']),
      );

  static AgeRangesStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? AgeRangesStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'lessThan20': _lessThan20,
        'a20-25': _a2025,
        'a25-29': _a2529,
        'a30-34': _a3034,
        'a35-39': _a3539,
        'a40Plus': _a40Plus,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'lessThan20': serializeParam(
          _lessThan20,
          ParamType.int,
        ),
        'a20-25': serializeParam(
          _a2025,
          ParamType.int,
        ),
        'a25-29': serializeParam(
          _a2529,
          ParamType.int,
        ),
        'a30-34': serializeParam(
          _a3034,
          ParamType.int,
        ),
        'a35-39': serializeParam(
          _a3539,
          ParamType.int,
        ),
        'a40Plus': serializeParam(
          _a40Plus,
          ParamType.int,
        ),
      }.withoutNulls;

  static AgeRangesStruct fromSerializableMap(Map<String, dynamic> data) =>
      AgeRangesStruct(
        lessThan20: deserializeParam(
          data['lessThan20'],
          ParamType.int,
          false,
        ),
        a2025: deserializeParam(
          data['a20-25'],
          ParamType.int,
          false,
        ),
        a2529: deserializeParam(
          data['a25-29'],
          ParamType.int,
          false,
        ),
        a3034: deserializeParam(
          data['a30-34'],
          ParamType.int,
          false,
        ),
        a3539: deserializeParam(
          data['a35-39'],
          ParamType.int,
          false,
        ),
        a40Plus: deserializeParam(
          data['a40Plus'],
          ParamType.int,
          false,
        ),
      );

  static AgeRangesStruct fromAlgoliaData(Map<String, dynamic> data) =>
      AgeRangesStruct(
        lessThan20: convertAlgoliaParam(
          data['lessThan20'],
          ParamType.int,
          false,
        ),
        a2025: convertAlgoliaParam(
          data['a20-25'],
          ParamType.int,
          false,
        ),
        a2529: convertAlgoliaParam(
          data['a25-29'],
          ParamType.int,
          false,
        ),
        a3034: convertAlgoliaParam(
          data['a30-34'],
          ParamType.int,
          false,
        ),
        a3539: convertAlgoliaParam(
          data['a35-39'],
          ParamType.int,
          false,
        ),
        a40Plus: convertAlgoliaParam(
          data['a40Plus'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'AgeRangesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AgeRangesStruct &&
        lessThan20 == other.lessThan20 &&
        a2025 == other.a2025 &&
        a2529 == other.a2529 &&
        a3034 == other.a3034 &&
        a3539 == other.a3539 &&
        a40Plus == other.a40Plus;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([lessThan20, a2025, a2529, a3034, a3539, a40Plus]);
}

AgeRangesStruct createAgeRangesStruct({
  int? lessThan20,
  int? a2025,
  int? a2529,
  int? a3034,
  int? a3539,
  int? a40Plus,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AgeRangesStruct(
      lessThan20: lessThan20,
      a2025: a2025,
      a2529: a2529,
      a3034: a3034,
      a3539: a3539,
      a40Plus: a40Plus,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AgeRangesStruct? updateAgeRangesStruct(
  AgeRangesStruct? ageRanges, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    ageRanges
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAgeRangesStructData(
  Map<String, dynamic> firestoreData,
  AgeRangesStruct? ageRanges,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (ageRanges == null) {
    return;
  }
  if (ageRanges.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && ageRanges.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final ageRangesData = getAgeRangesFirestoreData(ageRanges, forFieldValue);
  final nestedData = ageRangesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = ageRanges.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAgeRangesFirestoreData(
  AgeRangesStruct? ageRanges, [
  bool forFieldValue = false,
]) {
  if (ageRanges == null) {
    return {};
  }
  final firestoreData = mapToFirestore(ageRanges.toMap());

  // Add any Firestore field values
  ageRanges.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAgeRangesListFirestoreData(
  List<AgeRangesStruct>? ageRangess,
) =>
    ageRangess?.map((e) => getAgeRangesFirestoreData(e, true)).toList() ?? [];
