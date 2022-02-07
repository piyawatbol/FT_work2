// ignore_for_file: unused_local_variable, unused_import, await_only_futures

import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class TransactionDB {
  String dbName;
  TransactionDB({required this.dbName});

  Future<Database> openDatabase() async {
    //หาตำแหน่งที่จะเก็บข้อมูลล
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String dbLocation = join(appDirectory.path, dbName);
    //สร้างดาต้าเบส
    DatabaseFactory dbFactory = await databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocation);
    return db;
  }
}
