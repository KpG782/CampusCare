import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookingsRecord extends FirestoreRecord {
  BookingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "attendeeRef" field.
  DocumentReference? _attendeeRef;
  DocumentReference? get attendeeRef => _attendeeRef;
  bool hasAttendeeRef() => _attendeeRef != null;

  // "classRef" field.
  DocumentReference? _classRef;
  DocumentReference? get classRef => _classRef;
  bool hasClassRef() => _classRef != null;

  // "bookedTime" field.
  DateTime? _bookedTime;
  DateTime? get bookedTime => _bookedTime;
  bool hasBookedTime() => _bookedTime != null;

  // "ownerRef" field.
  DocumentReference? _ownerRef;
  DocumentReference? get ownerRef => _ownerRef;
  bool hasOwnerRef() => _ownerRef != null;

  // "sessionType" field.
  String? _sessionType;
  String get sessionType => _sessionType ?? '';
  bool hasSessionType() => _sessionType != null;

  // "sessionStatus" field.
  String? _sessionStatus;
  String get sessionStatus => _sessionStatus ?? '';
  bool hasSessionStatus() => _sessionStatus != null;

  // "userDept" field.
  String? _userDept;
  String get userDept => _userDept ?? '';
  bool hasUserDept() => _userDept != null;

  // "sessionNotes" field.
  String? _sessionNotes;
  String get sessionNotes => _sessionNotes ?? '';
  bool hasSessionNotes() => _sessionNotes != null;

  // "sessionCancel" field.
  String? _sessionCancel;
  String get sessionCancel => _sessionCancel ?? '';
  bool hasSessionCancel() => _sessionCancel != null;

  // "studentEmail" field.
  String? _studentEmail;
  String get studentEmail => _studentEmail ?? '';
  bool hasStudentEmail() => _studentEmail != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "sessionFeedbackRB" field.
  String? _sessionFeedbackRB;
  String get sessionFeedbackRB => _sessionFeedbackRB ?? '';
  bool hasSessionFeedbackRB() => _sessionFeedbackRB != null;

  // "sessionFeedbackTF" field.
  String? _sessionFeedbackTF;
  String get sessionFeedbackTF => _sessionFeedbackTF ?? '';
  bool hasSessionFeedbackTF() => _sessionFeedbackTF != null;

  // "isRead" field.
  bool? _isRead;
  bool get isRead => _isRead ?? false;
  bool hasIsRead() => _isRead != null;

  // "adminEmail" field.
  String? _adminEmail;
  String get adminEmail => _adminEmail ?? '';
  bool hasAdminEmail() => _adminEmail != null;

  // "endTime" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  bool hasEndTime() => _endTime != null;

  // "adminPhoto" field.
  String? _adminPhoto;
  String get adminPhoto => _adminPhoto ?? '';
  bool hasAdminPhoto() => _adminPhoto != null;

  // "councilorNotes" field.
  String? _councilorNotes;
  String get councilorNotes => _councilorNotes ?? '';
  bool hasCouncilorNotes() => _councilorNotes != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "transferredTo" field.
  String? _transferredTo;
  String get transferredTo => _transferredTo ?? '';
  bool hasTransferredTo() => _transferredTo != null;

  void _initializeFields() {
    _attendeeRef = snapshotData['attendeeRef'] as DocumentReference?;
    _classRef = snapshotData['classRef'] as DocumentReference?;
    _bookedTime = snapshotData['bookedTime'] as DateTime?;
    _ownerRef = snapshotData['ownerRef'] as DocumentReference?;
    _sessionType = snapshotData['sessionType'] as String?;
    _sessionStatus = snapshotData['sessionStatus'] as String?;
    _userDept = snapshotData['userDept'] as String?;
    _sessionNotes = snapshotData['sessionNotes'] as String?;
    _sessionCancel = snapshotData['sessionCancel'] as String?;
    _studentEmail = snapshotData['studentEmail'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _sessionFeedbackRB = snapshotData['sessionFeedbackRB'] as String?;
    _sessionFeedbackTF = snapshotData['sessionFeedbackTF'] as String?;
    _isRead = snapshotData['isRead'] as bool?;
    _adminEmail = snapshotData['adminEmail'] as String?;
    _endTime = snapshotData['endTime'] as DateTime?;
    _adminPhoto = snapshotData['adminPhoto'] as String?;
    _councilorNotes = snapshotData['councilorNotes'] as String?;
    _uid = snapshotData['uid'] as String?;
    _transferredTo = snapshotData['transferredTo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bookings');

  static Stream<BookingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookingsRecord.fromSnapshot(s));

  static Future<BookingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookingsRecord.fromSnapshot(s));

  static BookingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookingsRecordData({
  DocumentReference? attendeeRef,
  DocumentReference? classRef,
  DateTime? bookedTime,
  DocumentReference? ownerRef,
  String? sessionType,
  String? sessionStatus,
  String? userDept,
  String? sessionNotes,
  String? sessionCancel,
  String? studentEmail,
  DateTime? createdTime,
  String? sessionFeedbackRB,
  String? sessionFeedbackTF,
  bool? isRead,
  String? adminEmail,
  DateTime? endTime,
  String? adminPhoto,
  String? councilorNotes,
  String? uid,
  String? transferredTo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'attendeeRef': attendeeRef,
      'classRef': classRef,
      'bookedTime': bookedTime,
      'ownerRef': ownerRef,
      'sessionType': sessionType,
      'sessionStatus': sessionStatus,
      'userDept': userDept,
      'sessionNotes': sessionNotes,
      'sessionCancel': sessionCancel,
      'studentEmail': studentEmail,
      'created_time': createdTime,
      'sessionFeedbackRB': sessionFeedbackRB,
      'sessionFeedbackTF': sessionFeedbackTF,
      'isRead': isRead,
      'adminEmail': adminEmail,
      'endTime': endTime,
      'adminPhoto': adminPhoto,
      'councilorNotes': councilorNotes,
      'uid': uid,
      'transferredTo': transferredTo,
    }.withoutNulls,
  );

  return firestoreData;
}

class BookingsRecordDocumentEquality implements Equality<BookingsRecord> {
  const BookingsRecordDocumentEquality();

  @override
  bool equals(BookingsRecord? e1, BookingsRecord? e2) {
    return e1?.attendeeRef == e2?.attendeeRef &&
        e1?.classRef == e2?.classRef &&
        e1?.bookedTime == e2?.bookedTime &&
        e1?.ownerRef == e2?.ownerRef &&
        e1?.sessionType == e2?.sessionType &&
        e1?.sessionStatus == e2?.sessionStatus &&
        e1?.userDept == e2?.userDept &&
        e1?.sessionNotes == e2?.sessionNotes &&
        e1?.sessionCancel == e2?.sessionCancel &&
        e1?.studentEmail == e2?.studentEmail &&
        e1?.createdTime == e2?.createdTime &&
        e1?.sessionFeedbackRB == e2?.sessionFeedbackRB &&
        e1?.sessionFeedbackTF == e2?.sessionFeedbackTF &&
        e1?.isRead == e2?.isRead &&
        e1?.adminEmail == e2?.adminEmail &&
        e1?.endTime == e2?.endTime &&
        e1?.adminPhoto == e2?.adminPhoto &&
        e1?.councilorNotes == e2?.councilorNotes &&
        e1?.uid == e2?.uid &&
        e1?.transferredTo == e2?.transferredTo;
  }

  @override
  int hash(BookingsRecord? e) => const ListEquality().hash([
        e?.attendeeRef,
        e?.classRef,
        e?.bookedTime,
        e?.ownerRef,
        e?.sessionType,
        e?.sessionStatus,
        e?.userDept,
        e?.sessionNotes,
        e?.sessionCancel,
        e?.studentEmail,
        e?.createdTime,
        e?.sessionFeedbackRB,
        e?.sessionFeedbackTF,
        e?.isRead,
        e?.adminEmail,
        e?.endTime,
        e?.adminPhoto,
        e?.councilorNotes,
        e?.uid,
        e?.transferredTo
      ]);

  @override
  bool isValidKey(Object? o) => o is BookingsRecord;
}
