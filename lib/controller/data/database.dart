import 'dart:convert';

import 'package:contact_app/models/contact_model.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'contacts.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE contacts(id TEXT PRIMARY KEY, firstName TEXT, lastName TEXT, email TEXT, dob TEXT)',
        );
        await _loadInitialData(db);
      },
    );
  }

  Future<void> _loadInitialData(Database db) async {
    final data = await rootBundle.loadString('assets/data.json');
    final List<dynamic> jsonData = json.decode(data);
    for (var item in jsonData) {
      await db.insert('contacts', {
        'id': item['id'],
        'firstName': item['firstName'],
        'lastName': item['lastName'],
        'email': item['email'],
        'dob': item['dob'],
      });
    }
  }

  Future<void> refreshInitialData() async {
    final db = await database;
    await db.delete('contacts');
    print("All data deleted");

    await _loadInitialData(db);
    print("Initial data loaded");
  }

  Future<List<ContactResponse>> getContacts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('contacts');
    return List.generate(maps.length, (i) {
      return ContactResponse.fromJson(maps[i]);
    });
  }

  Future<void> insertContact(ContactResponse contact) async {
    final db = await database;
    await db.insert('contacts', contact.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> updateContact(ContactResponse contact) async {
    final db = await database;
    await db.update(
      'contacts',
      contact.toJson(),
      where: 'id = ?',
      whereArgs: [contact.id],
    );
  }

  Future<void> deleteContact(String id) async {
    final db = await database;
    await db.delete('contacts', where: 'id = ?', whereArgs: [id]);
  }

  Future<ContactResponse?> getContactById(String id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'contacts',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return ContactResponse.fromJson(maps.first);
    } else {
      return null;
    }
  }
}
