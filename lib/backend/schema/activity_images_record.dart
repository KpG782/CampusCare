import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActivityImagesRecord extends FirestoreRecord {
  ActivityImagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "act" field.
  String? _act;
  String get act => _act ?? '';
  bool hasAct() => _act != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "act_count" field.
  int? _actCount;
  int get actCount => _actCount ?? 0;
  bool hasActCount() => _actCount != null;

  // "image1" field.
  String? _image1;
  String get image1 => _image1 ?? '';
  bool hasImage1() => _image1 != null;

  void _initializeFields() {
    _act = snapshotData['act'] as String?;
    _image = snapshotData['image'] as String?;
    _id = snapshotData['id'] as String?;
    _actCount = castToType<int>(snapshotData['act_count']);
    _image1 = snapshotData['image1'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('activityImages');

  static Stream<ActivityImagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ActivityImagesRecord.fromSnapshot(s));

  static Future<ActivityImagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ActivityImagesRecord.fromSnapshot(s));

  static ActivityImagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ActivityImagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ActivityImagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ActivityImagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ActivityImagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ActivityImagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActivityImagesRecordData({
  String? act,
  String? image,
  String? id,
  int? actCount,
  String? image1,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'act': act,
      'image': image,
      'id': id,
      'act_count': actCount,
      'image1': image1,
    }.withoutNulls,
  );

  return firestoreData;
}

class ActivityImagesRecordDocumentEquality
    implements Equality<ActivityImagesRecord> {
  const ActivityImagesRecordDocumentEquality();

  @override
  bool equals(ActivityImagesRecord? e1, ActivityImagesRecord? e2) {
    return e1?.act == e2?.act &&
        e1?.image == e2?.image &&
        e1?.id == e2?.id &&
        e1?.actCount == e2?.actCount &&
        e1?.image1 == e2?.image1;
  }

  @override
  int hash(ActivityImagesRecord? e) => const ListEquality()
      .hash([e?.act, e?.image, e?.id, e?.actCount, e?.image1]);

  @override
  bool isValidKey(Object? o) => o is ActivityImagesRecord;
}
