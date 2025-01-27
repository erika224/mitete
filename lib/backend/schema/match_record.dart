import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MatchRecord extends FirestoreRecord {
  MatchRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "status" field.
  MatchStatus? _status;
  MatchStatus? get status => _status;
  bool hasStatus() => _status != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "bookable" field.
  DocumentReference? _bookable;
  DocumentReference? get bookable => _bookable;
  bool hasBookable() => _bookable != null;

  // "request_start_time" field.
  DateTime? _requestStartTime;
  DateTime? get requestStartTime => _requestStartTime;
  bool hasRequestStartTime() => _requestStartTime != null;

  // "request_end_time" field.
  DateTime? _requestEndTime;
  DateTime? get requestEndTime => _requestEndTime;
  bool hasRequestEndTime() => _requestEndTime != null;

  // "request_comment" field.
  String? _requestComment;
  String get requestComment => _requestComment ?? '';
  bool hasRequestComment() => _requestComment != null;

  // "sitter" field.
  String? _sitter;
  String get sitter => _sitter ?? '';
  bool hasSitter() => _sitter != null;

  // "request_dogs" field.
  List<String>? _requestDogs;
  List<String> get requestDogs => _requestDogs ?? const [];
  bool hasRequestDogs() => _requestDogs != null;

  // "sitterRef" field.
  DocumentReference? _sitterRef;
  DocumentReference? get sitterRef => _sitterRef;
  bool hasSitterRef() => _sitterRef != null;

  // "real_start_time" field.
  DateTime? _realStartTime;
  DateTime? get realStartTime => _realStartTime;
  bool hasRealStartTime() => _realStartTime != null;

  // "real_end_time" field.
  DateTime? _realEndTime;
  DateTime? get realEndTime => _realEndTime;
  bool hasRealEndTime() => _realEndTime != null;

  // "paymentID" field.
  String? _paymentID;
  String get paymentID => _paymentID ?? '';
  bool hasPaymentID() => _paymentID != null;

  // "paymentForSitter" field.
  String? _paymentForSitter;
  String get paymentForSitter => _paymentForSitter ?? '';
  bool hasPaymentForSitter() => _paymentForSitter != null;

  // "deposit_time" field.
  String? _depositTime;
  String get depositTime => _depositTime ?? '';
  bool hasDepositTime() => _depositTime != null;

  // "totalPayment" field.
  int? _totalPayment;
  int get totalPayment => _totalPayment ?? 0;
  bool hasTotalPayment() => _totalPayment != null;

  void _initializeFields() {
    _status = snapshotData['status'] is MatchStatus
        ? snapshotData['status']
        : deserializeEnum<MatchStatus>(snapshotData['status']);
    _user = snapshotData['user'] as DocumentReference?;
    _bookable = snapshotData['bookable'] as DocumentReference?;
    _requestStartTime = snapshotData['request_start_time'] as DateTime?;
    _requestEndTime = snapshotData['request_end_time'] as DateTime?;
    _requestComment = snapshotData['request_comment'] as String?;
    _sitter = snapshotData['sitter'] as String?;
    _requestDogs = getDataList(snapshotData['request_dogs']);
    _sitterRef = snapshotData['sitterRef'] as DocumentReference?;
    _realStartTime = snapshotData['real_start_time'] as DateTime?;
    _realEndTime = snapshotData['real_end_time'] as DateTime?;
    _paymentID = snapshotData['paymentID'] as String?;
    _paymentForSitter = snapshotData['paymentForSitter'] as String?;
    _depositTime = snapshotData['deposit_time'] as String?;
    _totalPayment = castToType<int>(snapshotData['totalPayment']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('match');

  static Stream<MatchRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MatchRecord.fromSnapshot(s));

  static Future<MatchRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MatchRecord.fromSnapshot(s));

  static MatchRecord fromSnapshot(DocumentSnapshot snapshot) => MatchRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MatchRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MatchRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MatchRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MatchRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMatchRecordData({
  MatchStatus? status,
  DocumentReference? user,
  DocumentReference? bookable,
  DateTime? requestStartTime,
  DateTime? requestEndTime,
  String? requestComment,
  String? sitter,
  DocumentReference? sitterRef,
  DateTime? realStartTime,
  DateTime? realEndTime,
  String? paymentID,
  String? paymentForSitter,
  String? depositTime,
  int? totalPayment,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'status': status,
      'user': user,
      'bookable': bookable,
      'request_start_time': requestStartTime,
      'request_end_time': requestEndTime,
      'request_comment': requestComment,
      'sitter': sitter,
      'sitterRef': sitterRef,
      'real_start_time': realStartTime,
      'real_end_time': realEndTime,
      'paymentID': paymentID,
      'paymentForSitter': paymentForSitter,
      'deposit_time': depositTime,
      'totalPayment': totalPayment,
    }.withoutNulls,
  );

  return firestoreData;
}

class MatchRecordDocumentEquality implements Equality<MatchRecord> {
  const MatchRecordDocumentEquality();

  @override
  bool equals(MatchRecord? e1, MatchRecord? e2) {
    const listEquality = ListEquality();
    return e1?.status == e2?.status &&
        e1?.user == e2?.user &&
        e1?.bookable == e2?.bookable &&
        e1?.requestStartTime == e2?.requestStartTime &&
        e1?.requestEndTime == e2?.requestEndTime &&
        e1?.requestComment == e2?.requestComment &&
        e1?.sitter == e2?.sitter &&
        listEquality.equals(e1?.requestDogs, e2?.requestDogs) &&
        e1?.sitterRef == e2?.sitterRef &&
        e1?.realStartTime == e2?.realStartTime &&
        e1?.realEndTime == e2?.realEndTime &&
        e1?.paymentID == e2?.paymentID &&
        e1?.paymentForSitter == e2?.paymentForSitter &&
        e1?.depositTime == e2?.depositTime &&
        e1?.totalPayment == e2?.totalPayment;
  }

  @override
  int hash(MatchRecord? e) => const ListEquality().hash([
        e?.status,
        e?.user,
        e?.bookable,
        e?.requestStartTime,
        e?.requestEndTime,
        e?.requestComment,
        e?.sitter,
        e?.requestDogs,
        e?.sitterRef,
        e?.realStartTime,
        e?.realEndTime,
        e?.paymentID,
        e?.paymentForSitter,
        e?.depositTime,
        e?.totalPayment
      ]);

  @override
  bool isValidKey(Object? o) => o is MatchRecord;
}
