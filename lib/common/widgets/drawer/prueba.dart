import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';

class LanguageSelectorPrueba extends StatelessWidget {
  const LanguageSelectorPrueba({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.language),
      title: Text(tr('select_language')),
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
          title: Text(tr('select_language')),
          content: SingleChildScrollView(
            child: Column(
              children: EasyLocalization.of(context)!
                  .supportedLocales
                  .map((locale) => InkWell(
                        onTap: () {
                          EasyLocalization.of(context)!.setLocale(locale);
                          Get.back(); // Close the dialog
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              Text(
                                '${locale.languageCode}-${locale.countryCode}',
                              ),
                              const Spacer(),
                              if (EasyLocalization.of(context)!.locale ==
                                  locale)
                                Icon(Icons.check, color: Colors.green),
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
              child: Text(tr('cancel')),
            ),
          ],
        );
      },
    );
  }
}
