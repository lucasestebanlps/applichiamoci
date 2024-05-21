import 'package:applichiamoci/features/authentication/controllers/signup/signup_controller.dart';
import 'package:applichiamoci/features/authentication/screens/signup/widgets/labeled_textfied.dart';
import 'package:applichiamoci/features/authentication/screens/signup/widgets/terms_and_conditions.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:applichiamoci/utils/helpers/helper_functions.dart';
import 'package:applichiamoci/utils/validators/validation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LSignupForm extends StatelessWidget {
  const LSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final dark = LHelperFunctions.isDarkMode(context);

    return Form(
        key: controller.signupFromKey,
        child: Column(
          children: [
            Row(
              children: [
                // ----- FIRST NAME -----
                Expanded(
                  child: LabeledTextField(
                      controller: controller.firstName,
                      validator: (value) =>
                          LValidator.validateEmptyText(value, 'First Name'),
                      isRequired: true,
                      labelText: tr(LocaleKeys.firstName),
                      prefixIcon: const Icon(Iconsax.user)),
                ),
                const SizedBox(
                  width: LSizes.spaceBtwInputFields,
                ),

                // ----- LAST NAME -----
                Expanded(
                  child: LabeledTextField(
                      controller: controller.lastName,
                      validator: (value) =>
                          LValidator.validateEmptyText(value, 'Last Name'),
                      isRequired: true,
                      labelText: tr(LocaleKeys.lastName),
                      prefixIcon: const Icon(Iconsax.user)),
                ),
              ],
            ),

            const SizedBox(
              height: LSizes.spaceBtwInputFields,
            ),

            // ----- USERNAME -----
            LabeledTextField(
              isRequired: true,
              controller: controller.userName,
              validator: (value) =>
                  LValidator.validateEmptyText(value, 'Username'),
              labelText: tr(LocaleKeys.username),
              prefixIcon: const Icon(Iconsax.user_edit),
            ),
            const SizedBox(
              height: LSizes.spaceBtwInputFields,
            ),

            // ----- EMAIL -----
            LabeledTextField(
                controller: controller.email,
                labelText: tr(LocaleKeys.email),
                prefixIcon: const Icon(Iconsax.direct),
                isRequired: true,
                validator: (value) => LValidator.validateEmail(value)),
            const SizedBox(
              height: LSizes.spaceBtwInputFields,
            ),

            // ----- PHONENUMBER -----
            LabeledTextField(
                controller: controller.phoneNumber,
                labelText: tr(LocaleKeys.phoneNo),
                prefixIcon: const Icon(Iconsax.call)),

            const SizedBox(
              height: LSizes.spaceBtwInputFields,
            ),

            // ----- PASSWORD -----
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => LValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                    labelText: tr(LocaleKeys.password),
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value,
                        icon: Icon(controller.hidePassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye))),
              ),
            ),
            const SizedBox(
              height: LSizes.spaceBtwSections,
            ),

            // ----- TERMS AND CONDITIONS -----
            TermsAndConditions(controller: controller, dark: dark),
            const SizedBox(height: LSizes.spaceBtwSections),

            // ----- CREATE ACCOUNT BUTTON -----
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => controller.signup(),
                    child: Text(tr(LocaleKeys.createAccount))))
          ],
        ));
  }
}
