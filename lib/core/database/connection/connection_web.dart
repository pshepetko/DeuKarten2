import 'package:drift/drift.dart';
import 'package:drift/web.dart';

/// Web (browser) Drift connection.
/// Uses a [WebDatabase] stored in IndexedDB under the given name.
Future<QueryExecutor> openConnection() async {
  // Use a fixed name so the database persists across sessions in the browser.
  const dbName = 'deu_karten.db';
  final executor = WebDatabase(dbName);

  print('Using WebDatabase with name: $dbName');

  return executor;
}