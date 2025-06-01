import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MoodChoicesRecord extends FirestoreRecord {
  MoodChoicesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "mood" field.
  String? _mood;
  String get mood => _mood ?? '';
  bool hasMood() => _mood != null;

  // "mood_id" field.
  String? _moodId;
  String get moodId => _moodId ?? '';
  bool hasMoodId() => _moodId != null;

  // "fileUrl" field.
  String? _fileUrl;
  String get fileUrl => _fileUrl ?? '';
  bool hasFileUrl() => _fileUrl != null;

  void _initializeFields() {
    _mood = snapshotData['mood'] as String?;
    _moodId = snapshotData['mood_id'] as String?;
    _fileUrl = snapshotData['fileUrl'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('mood_choices');

  static Stream<MoodChoicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MoodChoicesRecord.fromSnapshot(s));

  static Future<MoodChoicesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MoodChoicesRecord.fromSnapshot(s));

  static MoodChoicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MoodChoicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MoodChoicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MoodChoicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MoodChoicesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MoodChoicesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMoodChoicesRecordData({
  String? mood,
  String? moodId,
  String? fileUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'mood': mood,
      'mood_id': moodId,
      'fileUrl': fileUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class MoodChoicesRecordDocumentEquality implements Equality<MoodChoicesRecord> {
  const MoodChoicesRecordDocumentEquality();

  @override
  bool equals(MoodChoicesRecord? e1, MoodChoicesRecord? e2) {
    return e1?.mood == e2?.mood &&
        e1?.moodId == e2?.moodId &&
        e1?.fileUrl == e2?.fileUrl;
  }

  @override
  int hash(MoodChoicesRecord? e) =>
      const ListEquality().hash([e?.mood, e?.moodId, e?.fileUrl]);

  @override
  bool isValidKey(Object? o) => o is MoodChoicesRecord;
}
