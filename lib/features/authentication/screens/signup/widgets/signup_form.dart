import 'package:applichiamoci/features/authentication/screens/signup/verify_email.dart';
import 'package:applichiamoci/utils/constants/colors.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:applichiamoci/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LSignupForm extends StatelessWidget {
  const LSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = LHelperFunctions.isDarkMode(context);

    return Form(
        child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                expands: false,
                decoration: const InputDecoration(
                    labelText: LTexts.firstName,
                    prefixIcon: Icon(Iconsax.user)),
              ),
            ),
            const SizedBox(
              width: LSizes.spaceBtwInputFields,
            ),
            Expanded(
              child: TextFormField(
                expands: false,
                decoration: const InputDecoration(
                    labelText: LTexts.lastName, prefixIcon: Icon(Iconsax.user)),
              ),
            ),
          ],
        ),

        const SizedBox(
          height: LSizes.spaceBtwInputFields,
        ),

        // Username
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
              labelText: LTexts.username, prefixIcon: Icon(Iconsax.user_edit)),
        ),

        // Email
        const SizedBox(
          height: LSizes.spaceBtwInputFields,
        ),

        // Username
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
              labelText: LTexts.email, prefixIcon: Icon(Iconsax.direct)),
        ),

        // Phone Number
        const SizedBox(
          height: LSizes.spaceBtwInputFields,
        ),

        // Username
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
              labelText: LTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
        ),

        // Phone number
        const SizedBox(
          height: LSizes.spaceBtwInputFields,
        ),

        // Password
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
              labelText: LTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash)),
        ),
        const SizedBox(
          height: LSizes.spaceBtwSections,
        ),

        // Terms & conditions checkbox
        Row(
          children: [
            SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(value: true, onChanged: (value) {})),
            const SizedBox(width: LSizes.spaceBtwItems),
            Flexible(
              // or Expanded
              child: Text.rich(TextSpan(children: [
                TextSpan(
                    text: '${LTexts.iAgreeTo} ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: LTexts.privacyPolicy,
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: dark ? LColors.white : LColors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              dark ? LColors.white : LColors.primary,
                        )),
                TextSpan(
                    text: ' and ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: LTexts.termsOfUse,
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: dark ? LColors.white : LColors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              dark ? LColors.white : LColors.primary,
                        )),
              ])),
            ),
          ],
        ),
        const SizedBox(height: LSizes.spaceBtwSections),

        // Sign up button

        SizedBox(
            width: double.infinity,
            child: OutlinedButton(
                onPressed: () => Get.to(() => const VerifyEmailScreen()),
                child: const Text(LTexts.createAccount)))
      ],
    ));
  }
}
