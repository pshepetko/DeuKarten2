/// Conditional export that selects the platform-specific Drift connection
/// implementation. On web this exports `connection_web.dart`, on native
/// platforms it exports `connection_native.dart`.
export 'connection_native.dart' if (dart.library.html) 'connection_web.dart';

// The selected file provides: Future<QueryExecutor> openConnection()