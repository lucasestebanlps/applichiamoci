import 'package:applichiamoci/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(LSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Headings
            Text(LTexts.forgetPasswordtitle,
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: LSizes.spaceBtwItems),
            Text(LTexts.forgetPasswordsubTitle,
                style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: LSizes.spaceBtwItems * 2),

            // Text Field

            TextFormField(
              decoration: const InputDecoration(
                labelText: LTexts.email, prefixIcon: Icon(Iconsax.direct_right)
              ),
            ),
            const SizedBox(height: LSizes.spaceBtwSections),

            // Submit Button

            SizedBox(width: double.infinity ,child: ElevatedButton(onPressed: () => Get.off(const ResetPassword()), child: const Text('Submit')))
          ],
        ),
      ),
    );
  }
}
