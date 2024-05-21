import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:applichiamoci/utils/validators/validation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: const LAppBar(actions: false),
      body: Padding(
        padding: const EdgeInsets.all(LSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Headings
            Text(tr(LocaleKeys.forgetPasswordtitle),
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: LSizes.spaceBtwItems),
            Text(tr(LocaleKeys.forgetPasswordsubTitle),
                style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: LSizes.spaceBtwItems * 2),

            // Text Field
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: LValidator.validateEmail,
                decoration: InputDecoration(
                    labelText: tr(LocaleKeys.email),
                    prefixIcon: const Icon(Iconsax.direct_right)),
              ),
            ),
            const SizedBox(height: LSizes.spaceBtwSections),

            // Submit Button

            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.sendPasswordResetEmail(),
                    child: Text(tr(LocaleKeys.submit))))
          ],
        ),
      ),
    );
  }
}
