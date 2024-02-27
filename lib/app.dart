import 'package:applichiamoci/bindings/general_bindings.dart';
import 'package:applichiamoci/utils/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    print("Initializing EasyLocalization"); // Agregar este print statement
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      initialBinding: GeneralBindings(),
      // por defecto el tema es light, por eso dentro de theme van todos los estilos para light mode
      theme: LAppTheme.lightTheme,
      darkTheme: LAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const Scaffold(
          body: Center(child: CircularProgressIndicator(color: Colors.white))),
    );
  }
}
