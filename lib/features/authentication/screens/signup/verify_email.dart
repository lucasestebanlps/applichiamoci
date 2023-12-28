import 'package:applichiamoci/common/widgets/success_screen/success_screen.dart';
import 'package:applichiamoci/features/authentication/screens/login/login.dart';
import 'package:applichiamoci/utils/constants/image_strings.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:applichiamoci/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(LSizes.defaultSpace),
          child: Column(
            children: [
              // IMAGE
              Image(
                  image: const AssetImage(LImages.verifyEmailImage),
                  width: LHelperFunctions.screenWidth() * 0.6),
              const SizedBox(height: LSizes.spaceBtwSections),

              // Title & SubTitle
              Text(
                LTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center
              ),
              const SizedBox(height: LSizes.spaceBtwItems),
              Text(
                'support@foundazione.com',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center
              ),
              const SizedBox(height: LSizes.spaceBtwItems),
              Text(
                LTexts.confirmEmailsubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center
              ),
              const SizedBox(height: LSizes.spaceBtwSections),

              // Buttons
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => SuccessScreen(image: LImages.successScreenImage, title: LTexts.yourAccountCreatedTitle, subTitle: LTexts.yourAccountCreatedSubTitle, onPressed: () => Get.to(() => const LoginScreen()),),), child: const Text('Continue'))),
              const SizedBox(height: LSizes.spaceBtwItems),
              SizedBox(width: double.infinity, child: TextButton(onPressed: (){}, child: const Text(LTexts.resendEmail)))
            ],
          ),
        ),
      ),
    );
  }
}
