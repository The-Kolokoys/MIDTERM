import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';
import 'models/task.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  
  // ✅ REGISTER ADAPTER (Dito magagamit yung Task class)
  // Note: TaskAdapter ay mag-e-error muna hanggang hindi mo napa-run yung build command.
  Hive.registerAdapter(TaskAdapter());

  // Open boxes
  await Hive.openBox('database');
  await Hive.openBox<Task>('tasks'); // Speficy <Task> type para sa model

  runApp(const App());
}
