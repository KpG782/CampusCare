import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MentalResources1Record extends FirestoreRecord {
  MentalResources1Record._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "posts" field.
  String? _posts;
  String get posts => _posts ?? '';
  bool hasPosts() => _posts != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _posts = snapshotData['posts'] as String?;
    _description = snapshotData['description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('MentalResources1');

  static Stream<MentalResources1Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MentalResources1Record.fromSnapshot(s));

  static Future<MentalResources1Record> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => MentalResources1Record.fromSnapshot(s));

  static MentalResources1Record fromSnapshot(DocumentSnapshot snapshot) =>
      MentalResources1Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MentalResources1Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MentalResources1Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MentalResources1Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MentalResources1Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMentalResources1RecordData({
  String? posts,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'posts': posts,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class MentalResources1RecordDocumentEquality
    implements Equality<MentalResources1Record> {
  const MentalResources1RecordDocumentEquality();

  @override
  bool equals(MentalResources1Record? e1, MentalResources1Record? e2) {
    return e1?.posts == e2?.posts && e1?.description == e2?.description;
  }

  @override
  int hash(MentalResources1Record? e) =>
      const ListEquality().hash([e?.posts, e?.description]);

  @override
  bool isValidKey(Object? o) => o is MentalResources1Record;
}
