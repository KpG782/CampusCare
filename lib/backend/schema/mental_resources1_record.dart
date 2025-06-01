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

  // "post_author" field.
  String? _postAuthor;
  String get postAuthor => _postAuthor ?? '';
  bool hasPostAuthor() => _postAuthor != null;

  // "post_author_description" field.
  String? _postAuthorDescription;
  String get postAuthorDescription => _postAuthorDescription ?? '';
  bool hasPostAuthorDescription() => _postAuthorDescription != null;

  // "post_body" field.
  String? _postBody;
  String get postBody => _postBody ?? '';
  bool hasPostBody() => _postBody != null;

  // "post_category" field.
  String? _postCategory;
  String get postCategory => _postCategory ?? '';
  bool hasPostCategory() => _postCategory != null;

  // "post_id" field.
  int? _postId;
  int get postId => _postId ?? 0;
  bool hasPostId() => _postId != null;

  // "post_title" field.
  String? _postTitle;
  String get postTitle => _postTitle ?? '';
  bool hasPostTitle() => _postTitle != null;

  // "post_video" field.
  String? _postVideo;
  String get postVideo => _postVideo ?? '';
  bool hasPostVideo() => _postVideo != null;

  void _initializeFields() {
    _postAuthor = snapshotData['post_author'] as String?;
    _postAuthorDescription = snapshotData['post_author_description'] as String?;
    _postBody = snapshotData['post_body'] as String?;
    _postCategory = snapshotData['post_category'] as String?;
    _postId = castToType<int>(snapshotData['post_id']);
    _postTitle = snapshotData['post_title'] as String?;
    _postVideo = snapshotData['post_video'] as String?;
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
  String? postAuthor,
  String? postAuthorDescription,
  String? postBody,
  String? postCategory,
  int? postId,
  String? postTitle,
  String? postVideo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'post_author': postAuthor,
      'post_author_description': postAuthorDescription,
      'post_body': postBody,
      'post_category': postCategory,
      'post_id': postId,
      'post_title': postTitle,
      'post_video': postVideo,
    }.withoutNulls,
  );

  return firestoreData;
}

class MentalResources1RecordDocumentEquality
    implements Equality<MentalResources1Record> {
  const MentalResources1RecordDocumentEquality();

  @override
  bool equals(MentalResources1Record? e1, MentalResources1Record? e2) {
    return e1?.postAuthor == e2?.postAuthor &&
        e1?.postAuthorDescription == e2?.postAuthorDescription &&
        e1?.postBody == e2?.postBody &&
        e1?.postCategory == e2?.postCategory &&
        e1?.postId == e2?.postId &&
        e1?.postTitle == e2?.postTitle &&
        e1?.postVideo == e2?.postVideo;
  }

  @override
  int hash(MentalResources1Record? e) => const ListEquality().hash([
        e?.postAuthor,
        e?.postAuthorDescription,
        e?.postBody,
        e?.postCategory,
        e?.postId,
        e?.postTitle,
        e?.postVideo
      ]);

  @override
  bool isValidKey(Object? o) => o is MentalResources1Record;
}
