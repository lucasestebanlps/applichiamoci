import 'package:applichiamoci/bindings/general_bindings.dart';
import 'package:applichiamoci/utils/constants/colors.dart';
import 'package:applichiamoci/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      initialBinding: GeneralBindings(),
      // por defecto el tema es light, por eso dentro de theme van todos los estilos para light mode
      theme: LAppTheme.lightTheme,
      darkTheme: LAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const Scaffold(backgroundColor: LColors.primary, body: Center(child: CircularProgressIndicator(color: Colors.white),),),
    );
  }
}