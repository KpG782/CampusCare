import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EmojiRecord extends FirestoreRecord {
  EmojiRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "emoji" field.
  String? _emoji;
  String get emoji => _emoji ?? '';
  bool hasEmoji() => _emoji != null;

  // "emoji_ID" field.
  String? _emojiID;
  String get emojiID => _emojiID ?? '';
  bool hasEmojiID() => _emojiID != null;

  // "fileUrl" field.
  String? _fileUrl;
  String get fileUrl => _fileUrl ?? '';
  bool hasFileUrl() => _fileUrl != null;

  // "save_count" field.
  double? _saveCount;
  double get saveCount => _saveCount ?? 0.0;
  bool hasSaveCount() => _saveCount != null;

  void _initializeFields() {
    _emoji = snapshotData['emoji'] as String?;
    _emojiID = snapshotData['emoji_ID'] as String?;
    _fileUrl = snapshotData['fileUrl'] as String?;
    _saveCount = castToType<double>(snapshotData['save_count']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('emoji');

  static Stream<EmojiRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EmojiRecord.fromSnapshot(s));

  static Future<EmojiRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EmojiRecord.fromSnapshot(s));

  static EmojiRecord fromSnapshot(DocumentSnapshot snapshot) => EmojiRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EmojiRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EmojiRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EmojiRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EmojiRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEmojiRecordData({
  String? emoji,
  String? emojiID,
  String? fileUrl,
  double? saveCount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'emoji': emoji,
      'emoji_ID': emojiID,
      'fileUrl': fileUrl,
      'save_count': saveCount,
    }.withoutNulls,
  );

  return firestoreData;
}

class EmojiRecordDocumentEquality implements Equality<EmojiRecord> {
  const EmojiRecordDocumentEquality();

  @override
  bool equals(EmojiRecord? e1, EmojiRecord? e2) {
    return e1?.emoji == e2?.emoji &&
        e1?.emojiID == e2?.emojiID &&
        e1?.fileUrl == e2?.fileUrl &&
        e1?.saveCount == e2?.saveCount;
  }

  @override
  int hash(EmojiRecord? e) => const ListEquality()
      .hash([e?.emoji, e?.emojiID, e?.fileUrl, e?.saveCount]);

  @override
  bool isValidKey(Object? o) => o is EmojiRecord;
}
