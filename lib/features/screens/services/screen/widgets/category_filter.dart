import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../translations/locale_keys.g.dart';

class CategoryFilter extends StatelessWidget {
  final String? selectedCategory;
  final List<String> categories;
  final ValueChanged<String?> onChanged;

  const CategoryFilter({
    super.key,
    required this.selectedCategory,
    required this.categories,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DropdownButton<String>(
          value: selectedCategory,
          hint: Text(tr(LocaleKeys.chooseCategory)),
          onChanged: onChanged,
          items: categories.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
