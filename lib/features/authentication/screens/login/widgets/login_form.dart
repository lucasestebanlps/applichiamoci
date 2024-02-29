import 'package:applichiamoci/features/authentication/controllers/login/login_controller.dart';
import 'package:applichiamoci/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:applichiamoci/features/authentication/screens/signup/signup.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:applichiamoci/utils/validators/validation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LLoginForm extends StatelessWidget {
  const LLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: LSizes.spaceBtwSections),
        child: Column(
          children: [
            // Email
            TextFormField(
              controller: controller.email,
              validator: (value) => LValidator.validateEmail(value),
              decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.direct_right),
                  labelText: tr(LTexts.email)),
            ),

            const SizedBox(height: LSizes.spaceBtwInputFields),

            // Passsword
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) =>
                    LValidator.validateEmptyText(value, tr(LTexts.password)),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                    labelText: tr(LTexts.password),
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value,
                        icon: Icon(controller.hidePassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye))),
              ),
            ),

            const SizedBox(height: LSizes.spaceBtwInputFields / 2),

            // Remember me & forget password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remember me
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value =
                            !controller.rememberMe.value,
                        visualDensity: VisualDensity(
                            horizontal: -4,
                            vertical: -4), // Ajusta el margen izquierdo aquí
                      ),
                    ),
                    Text(
                      tr(LTexts.rememberMe),
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),

                // Forget password
                TextButton(
                    onPressed: () => Get.to(() => const ForgetPassword()),
                    child: Text(tr(LTexts.forgetPassword)))
              ],
            ),

            const SizedBox(height: LSizes.spaceBtwSections),

            // Sign In Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.emailAndPasswordSignIn(),
                    child: Text(tr(LTexts.signIn)))),

            const SizedBox(height: LSizes.spaceBtwItems),

            // Create Account button
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => Get.to(() => const SignupScreen()),
                    child: Text(tr(LTexts.createAccount))))
          ],
        ),
      ),
    );
  }
}
