import 'package:applichiamoci/common/widgets/loaders/loaders.dart';
import 'package:applichiamoci/features/screens/categories/controllers/categories_controller.dart';
import 'package:applichiamoci/features/screens/categories/controllers/places_controller.dart';
import 'package:applichiamoci/features/screens/home/controllers/news_controller.dart';
import 'package:applichiamoci/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' hide Trans;

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.language),
      title: Text(LocaleKeys.selectLanguage.tr()),
      onTap: () {
        showLanguageDialog(context);
      },
    );
  }

  void showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(LocaleKeys.selectLanguage.tr()),
          content: SingleChildScrollView(
            child: Column(
              children: EasyLocalization.of(context)!
                  .supportedLocales
                  .map((locale) => InkWell(
                        onTap: () async {
                          // Actualizar el idioma
                          EasyLocalization.of(context)!.setLocale(locale);
                          await Get.updateLocale(locale);

                          // Actualizar las noticias después de cambiar el idioma
                          await NewsController.instance.fetchNews();

                          // Actualizar las categorías después de cambiar el idioma
                          await CategoryController.instance.fetchCategories();

                          // Actualizar los lugares después de cambiar el idioma
                          await PlacesController.instance
                              .fetchPlacesForCategory(
                                  PlacesController.instance.currentCategory);

                          // Mostrar mensaje con información sobre el cambio de idioma
                          LLoaders.successSnackBar(
                              title: LocaleKeys.updateLanguajeTitle.tr(),
                              message: LocaleKeys.updateLanguajeMsj.tr());

                          // Cerrar el diálogo después de completar todas las operaciones
                          Get.back();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              Text(
                                getLocaleName(locale),
                              ),
                              const Spacer(),
                              if (EasyLocalization.of(context)!.locale ==
                                  locale)
                                const Icon(Icons.check, color: Colors.green),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(tr('done')),
            ),
          ],
        );
      },
    );
  }

  // Función para obtener el nombre completo del idioma
  String getLocaleName(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return 'English';
      case 'es':
        return 'Español';
      case 'fr':
        return 'Français';
      case 'it':
        return 'Italiano';
      default:
        return 'Unknown';
    }
  }
}
