import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppFeedbacksRecord extends FirestoreRecord {
  AppFeedbacksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userID" field.
  DocumentReference? _userID;
  DocumentReference? get userID => _userID;
  bool hasUserID() => _userID != null;

  // "starRating" field.
  int? _starRating;
  int get starRating => _starRating ?? 0;
  bool hasStarRating() => _starRating != null;

  // "radioButton" field.
  String? _radioButton;
  String get radioButton => _radioButton ?? '';
  bool hasRadioButton() => _radioButton != null;

  // "textBox" field.
  String? _textBox;
  String get textBox => _textBox ?? '';
  bool hasTextBox() => _textBox != null;

  // "timeStamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  // "userDept" field.
  String? _userDept;
  String get userDept => _userDept ?? '';
  bool hasUserDept() => _userDept != null;

  // "userEmail" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  bool hasUserEmail() => _userEmail != null;

  // "uID" field.
  String? _uID;
  String get uID => _uID ?? '';
  bool hasUID() => _uID != null;

  void _initializeFields() {
    _userID = snapshotData['userID'] as DocumentReference?;
    _starRating = castToType<int>(snapshotData['starRating']);
    _radioButton = snapshotData['radioButton'] as String?;
    _textBox = snapshotData['textBox'] as String?;
    _timeStamp = snapshotData['timeStamp'] as DateTime?;
    _userDept = snapshotData['userDept'] as String?;
    _userEmail = snapshotData['userEmail'] as String?;
    _uID = snapshotData['uID'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appFeedbacks');

  static Stream<AppFeedbacksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppFeedbacksRecord.fromSnapshot(s));

  static Future<AppFeedbacksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppFeedbacksRecord.fromSnapshot(s));

  static AppFeedbacksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppFeedbacksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppFeedbacksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppFeedbacksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppFeedbacksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppFeedbacksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppFeedbacksRecordData({
  DocumentReference? userID,
  int? starRating,
  String? radioButton,
  String? textBox,
  DateTime? timeStamp,
  String? userDept,
  String? userEmail,
  String? uID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userID': userID,
      'starRating': starRating,
      'radioButton': radioButton,
      'textBox': textBox,
      'timeStamp': timeStamp,
      'userDept': userDept,
      'userEmail': userEmail,
      'uID': uID,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppFeedbacksRecordDocumentEquality
    implements Equality<AppFeedbacksRecord> {
  const AppFeedbacksRecordDocumentEquality();

  @override
  bool equals(AppFeedbacksRecord? e1, AppFeedbacksRecord? e2) {
    return e1?.userID == e2?.userID &&
        e1?.starRating == e2?.starRating &&
        e1?.radioButton == e2?.radioButton &&
        e1?.textBox == e2?.textBox &&
        e1?.timeStamp == e2?.timeStamp &&
        e1?.userDept == e2?.userDept &&
        e1?.userEmail == e2?.userEmail &&
        e1?.uID == e2?.uID;
  }

  @override
  int hash(AppFeedbacksRecord? e) => const ListEquality().hash([
        e?.userID,
        e?.starRating,
        e?.radioButton,
        e?.textBox,
        e?.timeStamp,
        e?.userDept,
        e?.userEmail,
        e?.uID
      ]);

  @override
  bool isValidKey(Object? o) => o is AppFeedbacksRecord;
}
