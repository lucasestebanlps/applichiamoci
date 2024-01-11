import 'package:applichiamoci/features/authentication/controllers/signup/signup_controller.dart';
import 'package:applichiamoci/utils/constants/colors.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:applichiamoci/utils/helpers/helper_functions.dart';
import 'package:applichiamoci/utils/validators/validation.dart';
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
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => LValidator.validateEmptyText(value, 'First Name'),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: LTexts.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(
                width: LSizes.spaceBtwInputFields,
              ),

              // ----- LAST NAME -----
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) => LValidator.validateEmptyText(value, 'Last Name'),

                  expands: false,
                  decoration: const InputDecoration(
                      labelText: LTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),


          const SizedBox(
            height: LSizes.spaceBtwInputFields,
          ),

          // ----- USERNAME -----
          TextFormField(
            controller: controller.userName,
            validator: (value) => LValidator.validateEmptyText(value, 'Username'),

            expands: false,
            decoration: const InputDecoration(
                labelText: LTexts.username, prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(
            height: LSizes.spaceBtwInputFields,
          ),


          // ----- EMAIL -----
          TextFormField(
            controller: controller.email,
            validator: (value) => LValidator.validateEmail(value),
            expands: false,
            decoration: const InputDecoration(
                labelText: LTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(
            height: LSizes.spaceBtwInputFields,
          ),


          // ----- PHONENUMBER -----
          TextFormField(
            controller: controller.phoneNumber,
            expands: false,
            decoration: const InputDecoration(
                labelText: LTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),
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
                  labelText: LTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye))),
            ),
          ),
          const SizedBox(
            height: LSizes.spaceBtwSections,
          ),



          // ----- TERMS AND CONDITIONS -----
          Row(
            children: [
              SizedBox(
                  width: 24,
                  height: 24,
                  child: Obx(
                    () => Checkbox(
                      value: !controller.privacyPolicy.value,
                      onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value))),
              const SizedBox(width: LSizes.spaceBtwItems),
              Flexible(
                // or Expanded
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                      text: '${LTexts.iAgreeTo} ',
                      style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(
                      text: LTexts.privacyPolicy,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: dark ? LColors.white : LColors.primary,
                            decoration: TextDecoration.underline,
                            decorationColor:
                                dark ? LColors.white : LColors.primary,
                          )),
                  TextSpan(
                      text: ' and ',
                      style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(
                      text: LTexts.termsOfUse,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: dark ? LColors.white : LColors.primary,
                            decoration: TextDecoration.underline,
                            decorationColor:
                                dark ? LColors.white : LColors.primary,
                          )),
                ])),
              ),
            ],
          ),
          const SizedBox(height: LSizes.spaceBtwSections),




          // ----- CREATE ACCOUNT BUTTON -----
          SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () => controller.signup(),
                  child: const Text(LTexts.createAccount)))
        ],
      ));
    }
  }
