import 'package:applichiamoci/app.dart';
import 'package:applichiamoci/data/repositories/authentication/authentication_repository.dart';
import 'package:applichiamoci/translations/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // Widgets binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // initialize easy controller
  await EasyLocalization.ensureInitialized();

  // GetX Local Storage
  await GetStorage.init();

  // Await native splash screen until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  // Todo: initialize authentication

  runApp(
    SafeArea(
      left: false,
      child: EasyLocalization(
        supportedLocales: const [
          Locale('it'),
          Locale('en'),
          Locale('fr'),
          Locale('es')
        ],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: const Locale('it'),
        assetLoader: const CodegenLoader(),
        child: const App(),
      ),
    ),
  );
}
