import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "userBio" field.
  String? _userBio;
  String get userBio => _userBio ?? '';
  bool hasUserBio() => _userBio != null;

  // "userDept" field.
  String? _userDept;
  String get userDept => _userDept ?? '';
  bool hasUserDept() => _userDept != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  bool hasNotes() => _notes != null;

  // "adminDept" field.
  List<String>? _adminDept;
  List<String> get adminDept => _adminDept ?? const [];
  bool hasAdminDept() => _adminDept != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "classRef" field.
  DocumentReference? _classRef;
  DocumentReference? get classRef => _classRef;
  bool hasClassRef() => _classRef != null;

  // "userTimezone" field.
  String? _userTimezone;
  String get userTimezone => _userTimezone ?? '';
  bool hasUserTimezone() => _userTimezone != null;

  // "adminRole" field.
  String? _adminRole;
  String get adminRole => _adminRole ?? '';
  bool hasAdminRole() => _adminRole != null;

  // "adminAchievements" field.
  String? _adminAchievements;
  String get adminAchievements => _adminAchievements ?? '';
  bool hasAdminAchievements() => _adminAchievements != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _userName = snapshotData['userName'] as String?;
    _userBio = snapshotData['userBio'] as String?;
    _userDept = snapshotData['userDept'] as String?;
    _notes = snapshotData['notes'] as String?;
    _adminDept = getDataList(snapshotData['adminDept']);
    _role = snapshotData['role'] as String?;
    _classRef = snapshotData['classRef'] as DocumentReference?;
    _userTimezone = snapshotData['userTimezone'] as String?;
    _adminRole = snapshotData['adminRole'] as String?;
    _adminAchievements = snapshotData['adminAchievements'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? userName,
  String? userBio,
  String? userDept,
  String? notes,
  String? role,
  DocumentReference? classRef,
  String? userTimezone,
  String? adminRole,
  String? adminAchievements,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'userName': userName,
      'userBio': userBio,
      'userDept': userDept,
      'notes': notes,
      'role': role,
      'classRef': classRef,
      'userTimezone': userTimezone,
      'adminRole': adminRole,
      'adminAchievements': adminAchievements,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.userName == e2?.userName &&
        e1?.userBio == e2?.userBio &&
        e1?.userDept == e2?.userDept &&
        e1?.notes == e2?.notes &&
        listEquality.equals(e1?.adminDept, e2?.adminDept) &&
        e1?.role == e2?.role &&
        e1?.classRef == e2?.classRef &&
        e1?.userTimezone == e2?.userTimezone &&
        e1?.adminRole == e2?.adminRole &&
        e1?.adminAchievements == e2?.adminAchievements;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.userName,
        e?.userBio,
        e?.userDept,
        e?.notes,
        e?.adminDept,
        e?.role,
        e?.classRef,
        e?.userTimezone,
        e?.adminRole,
        e?.adminAchievements
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
