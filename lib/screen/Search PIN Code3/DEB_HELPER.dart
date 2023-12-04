// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables

import 'dart:io';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

var data = [].obs;
var data2 = [].obs;


class Dbhelp {
  var db;
  var db2;

  Future initdb() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "pincodes.db");
    var exists = await databaseExists(path);
    if (!exists) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}
      ByteData data = await rootBundle.load(join("DB", "pincodes.db"));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
    }
    db = await openDatabase(path, readOnly: true);
    db2 = await openDatabase(path, readOnly: true);
    data.value = await db.rawQuery('SELECT * FROM States');
    data2.value = await db2.rawQuery('SELECT * FROM Pincodes');
  }
}
