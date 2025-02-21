import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClassesRecord extends FirestoreRecord {
  ClassesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "className" field.
  String? _className;
  String get className => _className ?? '';
  bool hasClassName() => _className != null;

  // "classDescription" field.
  String? _classDescription;
  String get classDescription => _classDescription ?? '';
  bool hasClassDescription() => _classDescription != null;

  // "availability" field.
  List<AvailabilityStruct>? _availability;
  List<AvailabilityStruct> get availability => _availability ?? const [];
  bool hasAvailability() => _availability != null;

  // "ownerRef" field.
  DocumentReference? _ownerRef;
  DocumentReference? get ownerRef => _ownerRef;
  bool hasOwnerRef() => _ownerRef != null;

  // "classDept" field.
  List<String>? _classDept;
  List<String> get classDept => _classDept ?? const [];
  bool hasClassDept() => _classDept != null;

  void _initializeFields() {
    _className = snapshotData['className'] as String?;
    _classDescription = snapshotData['classDescription'] as String?;
    _availability = getStructList(
      snapshotData['availability'],
      AvailabilityStruct.fromMap,
    );
    _ownerRef = snapshotData['ownerRef'] as DocumentReference?;
    _classDept = getDataList(snapshotData['classDept']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('classes');

  static Stream<ClassesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClassesRecord.fromSnapshot(s));

  static Future<ClassesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClassesRecord.fromSnapshot(s));

  static ClassesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ClassesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClassesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClassesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClassesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClassesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClassesRecordData({
  String? className,
  String? classDescription,
  DocumentReference? ownerRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'className': className,
      'classDescription': classDescription,
      'ownerRef': ownerRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClassesRecordDocumentEquality implements Equality<ClassesRecord> {
  const ClassesRecordDocumentEquality();

  @override
  bool equals(ClassesRecord? e1, ClassesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.className == e2?.className &&
        e1?.classDescription == e2?.classDescription &&
        listEquality.equals(e1?.availability, e2?.availability) &&
        e1?.ownerRef == e2?.ownerRef &&
        listEquality.equals(e1?.classDept, e2?.classDept);
  }

  @override
  int hash(ClassesRecord? e) => const ListEquality().hash([
        e?.className,
        e?.classDescription,
        e?.availability,
        e?.ownerRef,
        e?.classDept
      ]);

  @override
  bool isValidKey(Object? o) => o is ClassesRecord;
}
