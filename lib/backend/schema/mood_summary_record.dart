import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MoodSummaryRecord extends FirestoreRecord {
  MoodSummaryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  // "emoji_Name" field.
  String? _emojiName;
  String get emojiName => _emojiName ?? '';
  bool hasEmojiName() => _emojiName != null;

  // "emoji_Count" field.
  double? _emojiCount;
  double get emojiCount => _emojiCount ?? 0.0;
  bool hasEmojiCount() => _emojiCount != null;

  void _initializeFields() {
    _userID = snapshotData['userID'] as String?;
    _emojiName = snapshotData['emoji_Name'] as String?;
    _emojiCount = castToType<double>(snapshotData['emoji_Count']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('mood_summary');

  static Stream<MoodSummaryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MoodSummaryRecord.fromSnapshot(s));

  static Future<MoodSummaryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MoodSummaryRecord.fromSnapshot(s));

  static MoodSummaryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MoodSummaryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MoodSummaryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MoodSummaryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MoodSummaryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MoodSummaryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMoodSummaryRecordData({
  String? userID,
  String? emojiName,
  double? emojiCount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userID': userID,
      'emoji_Name': emojiName,
      'emoji_Count': emojiCount,
    }.withoutNulls,
  );

  return firestoreData;
}

class MoodSummaryRecordDocumentEquality implements Equality<MoodSummaryRecord> {
  const MoodSummaryRecordDocumentEquality();

  @override
  bool equals(MoodSummaryRecord? e1, MoodSummaryRecord? e2) {
    return e1?.userID == e2?.userID &&
        e1?.emojiName == e2?.emojiName &&
        e1?.emojiCount == e2?.emojiCount;
  }

  @override
  int hash(MoodSummaryRecord? e) =>
      const ListEquality().hash([e?.userID, e?.emojiName, e?.emojiCount]);

  @override
  bool isValidKey(Object? o) => o is MoodSummaryRecord;
}
