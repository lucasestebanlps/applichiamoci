import 'package:applichiamoci/utils/helpers/helper_functions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Make sure to import Get for state management
import 'package:easy_localization/easy_localization.dart';
import 'package:applichiamoci/utils/constants/colors.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:applichiamoci/features/authentication/controllers/signup/signup_controller.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
    super.key,
    required this.controller,
    required this.dark,
  });

  final SignUpController controller;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Obx(() => Checkbox(
                  value: controller.privacyPolicy.value,
                  onChanged: (value) {
                    controller.privacyPolicy.value = value ?? false;
                  },
                ))),
        const SizedBox(width: LSizes.spaceBtwItems),
        Flexible(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: '${tr(LocaleKeys.iAgreeTo)} ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: tr(LocaleKeys.privacyPolicy),
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: dark ? LColors.white : LColors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              dark ? LColors.white : LColors.primary,
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => LHelperFunctions.urlAction(
                          'https://www.iubenda.com/privacy-policy/27488853')),
                TextSpan(
                    text: ' ${tr('and')} ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: tr(LocaleKeys.termsOfUse),
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: dark ? LColors.white : LColors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              dark ? LColors.white : LColors.primary,
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => LHelperFunctions.urlAction(
                          'https://www.iubenda.com/privacy-policy/27488853')),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
