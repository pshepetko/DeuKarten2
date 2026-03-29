import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

/// Native (mobile / desktop) Drift connection.
/// This mirrors the current native DB opening logic used elsewhere:
/// - determines application documents directory
/// - constructs the DB file path
/// - creates and returns a [NativeDatabase] executor
Future<QueryExecutor> openConnection() async {
  final dbFolder = await getApplicationDocumentsDirectory();
  final file = File(p.join(dbFolder.path, 'deu_karten.db'));

  print('DB FILE PATH: ${file.path}');
  print('DB EXISTS BEFORE OPEN: ${await file.exists()}');

  final executor = NativeDatabase.createInBackground(file);

  // Note: callers (e.g. AppDatabase) can construct their database with this executor.
  return executor;
}