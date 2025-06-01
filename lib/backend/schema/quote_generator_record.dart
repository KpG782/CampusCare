import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuoteGeneratorRecord extends FirestoreRecord {
  QuoteGeneratorRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "author" field.
  String? _author;
  String get author => _author ?? '';
  bool hasAuthor() => _author != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "quote" field.
  String? _quote;
  String get quote => _quote ?? '';
  bool hasQuote() => _quote != null;

  void _initializeFields() {
    _author = snapshotData['author'] as String?;
    _category = snapshotData['category'] as String?;
    _quote = snapshotData['quote'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quoteGenerator');

  static Stream<QuoteGeneratorRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuoteGeneratorRecord.fromSnapshot(s));

  static Future<QuoteGeneratorRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuoteGeneratorRecord.fromSnapshot(s));

  static QuoteGeneratorRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuoteGeneratorRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuoteGeneratorRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuoteGeneratorRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuoteGeneratorRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuoteGeneratorRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuoteGeneratorRecordData({
  String? author,
  String? category,
  String? quote,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'author': author,
      'category': category,
      'quote': quote,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuoteGeneratorRecordDocumentEquality
    implements Equality<QuoteGeneratorRecord> {
  const QuoteGeneratorRecordDocumentEquality();

  @override
  bool equals(QuoteGeneratorRecord? e1, QuoteGeneratorRecord? e2) {
    return e1?.author == e2?.author &&
        e1?.category == e2?.category &&
        e1?.quote == e2?.quote;
  }

  @override
  int hash(QuoteGeneratorRecord? e) =>
      const ListEquality().hash([e?.author, e?.category, e?.quote]);

  @override
  bool isValidKey(Object? o) => o is QuoteGeneratorRecord;
}
