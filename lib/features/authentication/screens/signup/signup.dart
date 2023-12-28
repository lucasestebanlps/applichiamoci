import 'package:applichiamoci/common/widgets/login_signup/form_divider.dart';
import 'package:applichiamoci/common/widgets/login_signup/social_buttons.dart';
import 'package:applichiamoci/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(LSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(LTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: LSizes.spaceBtwSections),

            // Form
            const LSignupForm(),
            const SizedBox(height: LSizes.spaceBtwSections),

            // Divider
            const LFormDivider(dividerText: LTexts.orSignInWith),
            const SizedBox(height: LSizes.spaceBtwSections),

            // Social Buttoms
            const LSocialButtons(),
          ],
        ),
      )),
    );
  }
}
