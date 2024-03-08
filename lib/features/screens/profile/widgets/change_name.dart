import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/features/personalization/controllers/update_name_controller.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:applichiamoci/utils/validators/validation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: LAppBar(
          title: Text(tr(LocaleKeys.changeName)),
          showBackArrow: true,
          actions: false),
      body: Padding(
        padding: const EdgeInsets.all(LSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Headings
            Text(
              tr(LocaleKeys.insertNewName),
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: LSizes.spaceBtwSections),

            // Text field and button

            Form(
              key: controller.updateUserNameFormKey,
              child: Column(children: [
                // Edit name
                TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      LValidator.validateEmptyText(value, 'First Name'),
                  expands: false,
                  decoration: InputDecoration(
                      labelText: tr(LocaleKeys.firstName),
                      prefixIcon: const Icon(Iconsax.user)),
                ),
                const SizedBox(height: LSizes.spaceBtwInputFields),

                // Edit Last Name
                TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      LValidator.validateEmptyText(value, 'Last Name'),
                  expands: false,
                  decoration: InputDecoration(
                      labelText: tr(LocaleKeys.firstName),
                      prefixIcon: const Icon(Iconsax.user)),
                ),
              ]),
            ),
            const SizedBox(height: LSizes.spaceBtwSections),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateUserName(),
                child: Text(tr(LocaleKeys.changeName)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
