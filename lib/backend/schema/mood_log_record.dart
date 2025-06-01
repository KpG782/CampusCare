import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MoodLogRecord extends FirestoreRecord {
  MoodLogRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "logs" field.
  String? _logs;
  String get logs => _logs ?? '';
  bool hasLogs() => _logs != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "emojis" field.
  String? _emojis;
  String get emojis => _emojis ?? '';
  bool hasEmojis() => _emojis != null;

  // "emoji_name" field.
  String? _emojiName;
  String get emojiName => _emojiName ?? '';
  bool hasEmojiName() => _emojiName != null;

  // "UserId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "mood_ID" field.
  int? _moodID;
  int get moodID => _moodID ?? 0;
  bool hasMoodID() => _moodID != null;

  // "activities" field.
  List<String>? _activities;
  List<String> get activities => _activities ?? const [];
  bool hasActivities() => _activities != null;

  // "mood_score" field.
  double? _moodScore;
  double get moodScore => _moodScore ?? 0.0;
  bool hasMoodScore() => _moodScore != null;

  // "mood_label" field.
  String? _moodLabel;
  String get moodLabel => _moodLabel ?? '';
  bool hasMoodLabel() => _moodLabel != null;

  // "userEmail" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  bool hasUserEmail() => _userEmail != null;

  void _initializeFields() {
    _logs = snapshotData['logs'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _emojis = snapshotData['emojis'] as String?;
    _emojiName = snapshotData['emoji_name'] as String?;
    _userId = snapshotData['UserId'] as String?;
    _moodID = castToType<int>(snapshotData['mood_ID']);
    _activities = getDataList(snapshotData['activities']);
    _moodScore = castToType<double>(snapshotData['mood_score']);
    _moodLabel = snapshotData['mood_label'] as String?;
    _userEmail = snapshotData['userEmail'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('mood_log');

  static Stream<MoodLogRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MoodLogRecord.fromSnapshot(s));

  static Future<MoodLogRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MoodLogRecord.fromSnapshot(s));

  static MoodLogRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MoodLogRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MoodLogRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MoodLogRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MoodLogRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MoodLogRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMoodLogRecordData({
  String? logs,
  DateTime? date,
  String? emojis,
  String? emojiName,
  String? userId,
  int? moodID,
  double? moodScore,
  String? moodLabel,
  String? userEmail,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'logs': logs,
      'date': date,
      'emojis': emojis,
      'emoji_name': emojiName,
      'UserId': userId,
      'mood_ID': moodID,
      'mood_score': moodScore,
      'mood_label': moodLabel,
      'userEmail': userEmail,
    }.withoutNulls,
  );

  return firestoreData;
}

class MoodLogRecordDocumentEquality implements Equality<MoodLogRecord> {
  const MoodLogRecordDocumentEquality();

  @override
  bool equals(MoodLogRecord? e1, MoodLogRecord? e2) {
    const listEquality = ListEquality();
    return e1?.logs == e2?.logs &&
        e1?.date == e2?.date &&
        e1?.emojis == e2?.emojis &&
        e1?.emojiName == e2?.emojiName &&
        e1?.userId == e2?.userId &&
        e1?.moodID == e2?.moodID &&
        listEquality.equals(e1?.activities, e2?.activities) &&
        e1?.moodScore == e2?.moodScore &&
        e1?.moodLabel == e2?.moodLabel &&
        e1?.userEmail == e2?.userEmail;
  }

  @override
  int hash(MoodLogRecord? e) => const ListEquality().hash([
        e?.logs,
        e?.date,
        e?.emojis,
        e?.emojiName,
        e?.userId,
        e?.moodID,
        e?.activities,
        e?.moodScore,
        e?.moodLabel,
        e?.userEmail
      ]);

  @override
  bool isValidKey(Object? o) => o is MoodLogRecord;
}
