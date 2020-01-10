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

  Future<dynamic> deleteList(String debtorName) async {
    final TransactionHandler deleteTransaction = (Transaction tx) async {
      final DocumentSnapshot ds =
          await tx.get(myCollection.document(debtorName));

      await tx.delete(ds.reference);
      return {'deleted': true};
    };

    return Firestore.instance
        .runTransaction(deleteTransaction)
        .then((result) => result['deleted'])
        .catchError((error) {
      print('error: $error');
      return false;
    });
  }

  Future<dynamic> updateList(PendingList list) async {
    final TransactionHandler updateTransaction = (Transaction tx) async {
      final DocumentSnapshot ds =
          await tx.get(myCollection.document('debtorName'));

      await tx.update(ds.reference, list.toMap());
      return {'updated': true};
    };

    return Firestore.instance
        .runTransaction(updateTransaction)
        .then((result) => result['updated'])
        .catchError((error) {
      print('error: $error');
      return false;
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
