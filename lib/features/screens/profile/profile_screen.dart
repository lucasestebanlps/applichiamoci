import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/common/widgets/drawer/custom_drawer.dart';
import 'package:applichiamoci/common/widgets/l_circular_image.dart';
import 'package:applichiamoci/common/widgets/l_section_heading.dart';
import 'package:applichiamoci/common/widgets/loaders/loaders.dart';
import 'package:applichiamoci/features/personalization/controllers/user_controller.dart';
import 'package:applichiamoci/features/screens/profile/widgets/change_name.dart';
import 'package:applichiamoci/features/screens/profile/widgets/profile_menu.dart';
import 'package:applichiamoci/utils/constants/image_strings.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:applichiamoci/common/widgets/shimmer/shimmer.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
      appBar: const LAppBar(
        showBackArrow: true,
        title: Text(LTexts.editProfile),
      ),
      endDrawer: const CustomDrawer(),

      // body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(LSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    // Profile picture
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty
                          ? networkImage
                          : LImages.userImage;
                      return controller.imageUploading.value
                          ? const LShimerEffect(
                              width: 80, height: 80, radius: 80)
                          : LCircularImage(
                              fit: BoxFit.cover,
                              image: image,
                              width: 100,
                              height: 100,
                              isNetworkImage: networkImage.isNotEmpty,
                            );
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: const Text(LTexts.changeProfilePicture)),
                  ],
                ),
              ),
              const SizedBox(height: LSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: LSizes.spaceBtwItems),
              // ------ PROFILE INFORMATION -------
              const LSSectionHeading(
                  title: LTexts.profileInformation, showActionButton: false),
              const SizedBox(height: LSizes.spaceBtwItems),
              // ------ CHANGE NAME -------
              LProfileMenu(
                  onPressed: () => Get.to(() => const ChangeName()),
                  title: LTexts.name,
                  value: controller.user.value.fullName),
              // ------ USERNAME -------
              LProfileMenu(
                  onPressed: () {
                    _copyToClipboard(
                        context, controller.user.value.username, 'Username');
                  },
                  title: LTexts.userName,
                  value: controller.user.value.username,
                  icon: Iconsax.copy),

              const SizedBox(height: LSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: LSizes.spaceBtwItems),
              // ------ PERSONAL INFORMATION -------
              const LSSectionHeading(
                  title: LTexts.personalInformation, showActionButton: false),
              const SizedBox(height: LSizes.spaceBtwItems),
              // ------ EMAIL -------
              LProfileMenu(
                onPressed: () {
                  _copyToClipboard(
                      context, controller.user.value.email, 'Email');
                },
                title: LTexts.email,
                value: controller.user.value.email,
                icon: Iconsax.copy,
              ),
              const Divider(),
              const SizedBox(height: LSizes.spaceBtwItems),
              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text(
                    LTexts.deleteAccount,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              )
            ],
          ),
          // Details
        ),
      ),
    );
  }
}

void _copyToClipboard(
    BuildContext context, String textToCopy, String fieldName) {
  FlutterClipboard.copy(textToCopy).then((_) {
    LLoaders.successSnackBar(
        title: LTexts.copied, message: '$fieldName $LTexts.copiedToClipboard');
  });
}
