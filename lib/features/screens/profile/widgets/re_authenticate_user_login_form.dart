import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/features/personalization/controllers/user_controller.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:applichiamoci/utils/validators/validation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
        appBar: LAppBar(
            title: Text(tr(LTexts.reAuthUser)),
            showBackArrow: true,
            actions: false),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(LSizes.defaultSpace),
                child: Form(
                    key: controller.reAuthFormKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Email
                          TextFormField(
                            controller: controller.verifyEmail,
                            validator: LValidator.validateEmail,
                            decoration: InputDecoration(
                                labelText: tr(LTexts.email),
                                prefixIcon: const Icon(Iconsax.direct_right)),
                          ),
                          const SizedBox(height: LSizes.spaceBtwInputFields),

                          // Edit Last Name
                          Obx(
                            () => TextFormField(
                              obscureText: controller.hidePassword.value,
                              controller: controller.verifyPassword,
                              validator: (value) =>
                                  LValidator.validateEmptyText(
                                      value, 'Password'),
                              decoration: InputDecoration(
                                  labelText: tr(LTexts.password),
                                  prefixIcon:
                                      const Icon(Iconsax.password_check),
                                  suffixIcon: IconButton(
                                    onPressed: () => controller.hidePassword
                                        .value = !controller.hidePassword.value,
                                    icon: const Icon(Iconsax.eye_slash),
                                  )),
                            ),
                          ),
                          const SizedBox(height: LSizes.spaceBtwSections),
                          // Delete account
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () => controller
                                  .reAuthenticateEmailAndPasswordUser(),
                              child: Text(tr(LTexts.verify)),
                            ),
                          )
                        ])))));
  }
}
