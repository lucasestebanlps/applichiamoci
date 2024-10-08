import 'package:applichiamoci/common/widgets/login_signup/form_divider.dart';
import 'package:applichiamoci/common/widgets/login_signup/social_buttons.dart';
import 'package:applichiamoci/features/authentication/screens/login/widgets/login_form.dart';
import 'package:applichiamoci/features/authentication/screens/login/widgets/login_header.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:applichiamoci/utils/helpers/helper_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = LHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(LSizes.md),
        child: Column(
          children: [
            // Logo, Title & Subtitle
            LLoginHeader(dark: dark),

            // Form
            const LLoginForm(),

            // Divider
            LFormDivider(dividerText: tr(LocaleKeys.orSignInWith)),

            const SizedBox(height: LSizes.spaceBtwSections),
            // Footer
            const LSocialButtons()
          ],
        ),
      )),
    );
  }
}
