import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/common/widgets/login_signup/form_divider.dart';
import 'package:applichiamoci/common/widgets/login_signup/social_buttons.dart';
import 'package:applichiamoci/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LAppBar(actions: false),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(LSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(tr(LTexts.signupTitle),
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: LSizes.spaceBtwSections),

            // Form
            const LSignupForm(),
            const SizedBox(height: LSizes.spaceBtwSections),

            // Divider
            LFormDivider(dividerText: tr(LTexts.orSignInWith)),
            const SizedBox(height: LSizes.spaceBtwSections),

            // Social Buttoms
            const LSocialButtons(),
          ],
        ),
      )),
    );
  }
}
