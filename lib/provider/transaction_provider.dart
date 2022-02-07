// ignore_for_file: avoid_print, await_only_futures

import 'package:flutter/foundation.dart';
import 'package:work2/database/transaction_db.dart';
import 'package:work2/models/transactions.dart';

class TransactionProvider with ChangeNotifier {
  List<Transactions> transactions = [];
  // ดึงข้อมูล
  List<Transactions> getTransaction() {
    return transactions;
  }

// การเพิ่มข้อมุล
  void addTransaction(Transactions statement) async {
    var db = await TransactionDB(dbName: 'transactions.db').openDatabase();
    print(db);
    transactions.insert(0, statement);
    notifyListeners();
  }
}
