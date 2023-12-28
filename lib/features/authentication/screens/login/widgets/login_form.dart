import 'package:applichiamoci/common/widgets/bottom_navigation_menu/navigation_menu.dart';
import 'package:applichiamoci/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:applichiamoci/features/authentication/screens/signup/signup.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LLoginForm extends StatelessWidget {
  const LLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: LSizes.spaceBtwSections),
        child: Column(
          children: [
            // Email
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: LTexts.email),
            ),
    
            const SizedBox(height: LSizes.spaceBtwInputFields),
    
            // Passsword
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check),
                  labelText: LTexts.password,
                  suffixIcon: Icon(Iconsax.eye_slash)),
            ),
    
            const SizedBox(height: LSizes.spaceBtwInputFields / 2),
    
            // Remember me & forget password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remember me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(LTexts.rememberMe)
                  ],
                ),
    
                // Forget password
                TextButton(
                    onPressed: () => Get.to(() => const ForgetPassword()),
                    child: const Text(LTexts.forgetPassword))
              ],
            ),
    
            const SizedBox(height: LSizes.spaceBtwSections),
    
            // Sign In Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(() => const NavigationMenu()),
                    child: const Text(LTexts.signIn))),
    
            const SizedBox(height: LSizes.spaceBtwItems),
    
            // Create Account button
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => Get.to(() => const SignupScreen()),
                    child: const Text(LTexts.createAccount)))
          ],
        ),
      ),
    );
  }
}