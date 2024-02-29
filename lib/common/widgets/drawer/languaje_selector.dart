import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.language),
      title: Text('Change Language'),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Select Language'),
              content: DropdownButton<Locale>(
                value: context.locale,
                onChanged: (Locale? locale) {
                  if (locale != null) {
                    EasyLocalization.of(context)?.setLocale(locale);
                    Navigator.pop(context); // Close the dialog
                  }
                },
                items: context.supportedLocales
                    .map((locale) => DropdownMenuItem<Locale>(
                          value: locale,
                          child: Text(locale.toLanguageTag()),
                        ))
                    .toList(),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text('Cancel'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
