import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/fragments/list.dart';

final CollectionReference myCollection = Firestore.instance.collection('add');

class FirestoreServ {
  Future<PendingList> createList(String debtorName, String amount,
      String dueDate, String debtorContactNumber, String debtorEmail) async {
    final TransactionHandler createTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(myCollection.document());

      final PendingList list = PendingList(
          debtorName, amount, dueDate, debtorContactNumber, debtorEmail);
      final Map<String, dynamic> data = list.toMap();
      await tx.set(ds.reference, data);
      return data;
    };

    return Firestore.instance.runTransaction(createTransaction).then((mapData) {
      return PendingList.fromMap(mapData);
    }).catchError((error) {
      print('error: $error');
      return null;
    });
  }

  Stream<QuerySnapshot> getPendingList({int offset, int limit}) {
    Stream<QuerySnapshot> snapshots = myCollection.snapshots();

    if (offset != null) {
      snapshots = snapshots.skip(offset);
    }
    if (limit != null) {
      snapshots = snapshots.take(limit);
    }
    return snapshots;
  }
}
