import 'package:applichiamoci/features/authentication/controllers/signup/signup_controller.dart';
import 'package:applichiamoci/utils/constants/colors.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

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
                value: !controller.privacyPolicy.value,
                onChanged: (value) => controller.privacyPolicy.value =
                    !controller.privacyPolicy.value))),
        const SizedBox(width: LSizes.spaceBtwItems),
        Flexible(
          // or Expanded
          child: Text.rich(TextSpan(children: [
            TextSpan(
                text: '${tr(LTexts.iAgreeTo)} ',
                style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
                text: tr(LTexts.privacyPolicy),
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? LColors.white : LColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: dark ? LColors.white : LColors.primary,
                    )),
            TextSpan(
                text: ' and ', style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
                text: tr(LTexts.termsOfUse),
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? LColors.white : LColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: dark ? LColors.white : LColors.primary,
                    )),
          ])),
        ),
      ],
    );
  }
}
