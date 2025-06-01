import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NewsRecord extends FirestoreRecord {
  NewsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "newsTitle" field.
  String? _newsTitle;
  String get newsTitle => _newsTitle ?? '';
  bool hasNewsTitle() => _newsTitle != null;

  // "newsDescription" field.
  String? _newsDescription;
  String get newsDescription => _newsDescription ?? '';
  bool hasNewsDescription() => _newsDescription != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "publishedTime" field.
  DateTime? _publishedTime;
  DateTime? get publishedTime => _publishedTime;
  bool hasPublishedTime() => _publishedTime != null;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
    _newsTitle = snapshotData['newsTitle'] as String?;
    _newsDescription = snapshotData['newsDescription'] as String?;
    _id = castToType<int>(snapshotData['id']);
    _date = snapshotData['date'] as DateTime?;
    _publishedTime = snapshotData['publishedTime'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('news');

  static Stream<NewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NewsRecord.fromSnapshot(s));

  static Future<NewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NewsRecord.fromSnapshot(s));

  static NewsRecord fromSnapshot(DocumentSnapshot snapshot) => NewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNewsRecordData({
  String? image,
  String? newsTitle,
  String? newsDescription,
  int? id,
  DateTime? date,
  DateTime? publishedTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'newsTitle': newsTitle,
      'newsDescription': newsDescription,
      'id': id,
      'date': date,
      'publishedTime': publishedTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class NewsRecordDocumentEquality implements Equality<NewsRecord> {
  const NewsRecordDocumentEquality();

  @override
  bool equals(NewsRecord? e1, NewsRecord? e2) {
    return e1?.image == e2?.image &&
        e1?.newsTitle == e2?.newsTitle &&
        e1?.newsDescription == e2?.newsDescription &&
        e1?.id == e2?.id &&
        e1?.date == e2?.date &&
        e1?.publishedTime == e2?.publishedTime;
  }

  @override
  int hash(NewsRecord? e) => const ListEquality().hash([
        e?.image,
        e?.newsTitle,
        e?.newsDescription,
        e?.id,
        e?.date,
        e?.publishedTime
      ]);

  @override
  bool isValidKey(Object? o) => o is NewsRecord;
}
