import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class DBEngine {
  Database _database;
  String path;

  DBEngine({@required this.path});

  Future<Database> open() async {
    _database = await openDatabase(path, version: 1);
  }
}
