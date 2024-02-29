import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:applichiamoci/features/authentication/screens/login/login.dart';
import 'package:applichiamoci/utils/constants/image_strings.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:applichiamoci/utils/helpers/helper_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LAppBar(actions: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(LSizes.defaultSpace),
          child: Column(
            children: [
              // IMAGE
              Image(
                image: const AssetImage(LImages.deliveredEmailIllustration),
                width: LHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: LSizes.spaceBtwSections),

              // Title & SubTitle
              Text(
                email,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: LSizes.spaceBtwItems),

              Text(
                tr(LTexts.changeYourPasswordSubTitle),
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: LSizes.spaceBtwSections),

              // Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAll(() => const LoginScreen()),
                  child: Text(tr(LTexts.done)),
                ),
              ),
              const SizedBox(height: LSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => ForgetPasswordController.insstance
                      .resendPasswordResetEmail(email),
                  child: Text(tr(LTexts.resendEmail)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
