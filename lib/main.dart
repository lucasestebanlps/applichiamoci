import 'package:applichiamoci/app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
Future<void> main() async {
  // Widgets binding
  WidgetsFlutterBinding.ensureInitialized();
  // Todo: init local storage
  // Todo: awatit native splash
  // Todo: initialize firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Todo: initialize authentication

  runApp(const App());
}
