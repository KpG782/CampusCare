import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MentalResourcesRecord extends FirestoreRecord {
  MentalResourcesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "mental_image" field.
  String? _mentalImage;
  String get mentalImage => _mentalImage ?? '';
  bool hasMentalImage() => _mentalImage != null;

  // "mental_title" field.
  String? _mentalTitle;
  String get mentalTitle => _mentalTitle ?? '';
  bool hasMentalTitle() => _mentalTitle != null;

  // "mental_description" field.
  String? _mentalDescription;
  String get mentalDescription => _mentalDescription ?? '';
  bool hasMentalDescription() => _mentalDescription != null;

  // "mental_ID" field.
  int? _mentalID;
  int get mentalID => _mentalID ?? 0;
  bool hasMentalID() => _mentalID != null;

  // "mental_favorite" field.
  bool? _mentalFavorite;
  bool get mentalFavorite => _mentalFavorite ?? false;
  bool hasMentalFavorite() => _mentalFavorite != null;

  // "mental_page_description" field.
  String? _mentalPageDescription;
  String get mentalPageDescription => _mentalPageDescription ?? '';
  bool hasMentalPageDescription() => _mentalPageDescription != null;

  void _initializeFields() {
    _mentalImage = snapshotData['mental_image'] as String?;
    _mentalTitle = snapshotData['mental_title'] as String?;
    _mentalDescription = snapshotData['mental_description'] as String?;
    _mentalID = castToType<int>(snapshotData['mental_ID']);
    _mentalFavorite = snapshotData['mental_favorite'] as bool?;
    _mentalPageDescription = snapshotData['mental_page_description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('MentalResources');

  static Stream<MentalResourcesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MentalResourcesRecord.fromSnapshot(s));

  static Future<MentalResourcesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MentalResourcesRecord.fromSnapshot(s));

  static MentalResourcesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MentalResourcesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MentalResourcesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MentalResourcesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MentalResourcesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MentalResourcesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMentalResourcesRecordData({
  String? mentalImage,
  String? mentalTitle,
  String? mentalDescription,
  int? mentalID,
  bool? mentalFavorite,
  String? mentalPageDescription,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'mental_image': mentalImage,
      'mental_title': mentalTitle,
      'mental_description': mentalDescription,
      'mental_ID': mentalID,
      'mental_favorite': mentalFavorite,
      'mental_page_description': mentalPageDescription,
    }.withoutNulls,
  );

  return firestoreData;
}

class MentalResourcesRecordDocumentEquality
    implements Equality<MentalResourcesRecord> {
  const MentalResourcesRecordDocumentEquality();

  @override
  bool equals(MentalResourcesRecord? e1, MentalResourcesRecord? e2) {
    return e1?.mentalImage == e2?.mentalImage &&
        e1?.mentalTitle == e2?.mentalTitle &&
        e1?.mentalDescription == e2?.mentalDescription &&
        e1?.mentalID == e2?.mentalID &&
        e1?.mentalFavorite == e2?.mentalFavorite &&
        e1?.mentalPageDescription == e2?.mentalPageDescription;
  }

  @override
  int hash(MentalResourcesRecord? e) => const ListEquality().hash([
        e?.mentalImage,
        e?.mentalTitle,
        e?.mentalDescription,
        e?.mentalID,
        e?.mentalFavorite,
        e?.mentalPageDescription
      ]);

  @override
  bool isValidKey(Object? o) => o is MentalResourcesRecord;
}
