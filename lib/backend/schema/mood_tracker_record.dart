import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MoodTrackerRecord extends FirestoreRecord {
  MoodTrackerRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "get_mood" field.
  DocumentReference? _getMood;
  DocumentReference? get getMood => _getMood;
  bool hasGetMood() => _getMood != null;

  // "get_date" field.
  DocumentReference? _getDate;
  DocumentReference? get getDate => _getDate;
  bool hasGetDate() => _getDate != null;

  // "get_emoji" field.
  DocumentReference? _getEmoji;
  DocumentReference? get getEmoji => _getEmoji;
  bool hasGetEmoji() => _getEmoji != null;

  void _initializeFields() {
    _getMood = snapshotData['get_mood'] as DocumentReference?;
    _getDate = snapshotData['get_date'] as DocumentReference?;
    _getEmoji = snapshotData['get_emoji'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('mood_tracker');

  static Stream<MoodTrackerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MoodTrackerRecord.fromSnapshot(s));

  static Future<MoodTrackerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MoodTrackerRecord.fromSnapshot(s));

  static MoodTrackerRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MoodTrackerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MoodTrackerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MoodTrackerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MoodTrackerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MoodTrackerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMoodTrackerRecordData({
  DocumentReference? getMood,
  DocumentReference? getDate,
  DocumentReference? getEmoji,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'get_mood': getMood,
      'get_date': getDate,
      'get_emoji': getEmoji,
    }.withoutNulls,
  );

  return firestoreData;
}

class MoodTrackerRecordDocumentEquality implements Equality<MoodTrackerRecord> {
  const MoodTrackerRecordDocumentEquality();

  @override
  bool equals(MoodTrackerRecord? e1, MoodTrackerRecord? e2) {
    return e1?.getMood == e2?.getMood &&
        e1?.getDate == e2?.getDate &&
        e1?.getEmoji == e2?.getEmoji;
  }

  @override
  int hash(MoodTrackerRecord? e) =>
      const ListEquality().hash([e?.getMood, e?.getDate, e?.getEmoji]);

  @override
  bool isValidKey(Object? o) => o is MoodTrackerRecord;
}
