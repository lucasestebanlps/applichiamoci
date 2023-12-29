import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/common/widgets/drawer/custom_drawer.dart';
import 'package:applichiamoci/common/widgets/l_circular_image.dart';
import 'package:applichiamoci/common/widgets/l_section_heading.dart';
import 'package:applichiamoci/features/screens/profile/widgets/profile_menu.dart';
import 'package:applichiamoci/utils/constants/image_strings.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const LAppBar(
        showBackArrow: true,
        title: Text('Edit profile'),
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
                  const LCircularImage(image: LImages.userImage, width: 100, height: 100),
                  TextButton(onPressed: () {}, child:  const Text('Change profile picture')),
                  ],
                ),
              ),
              const SizedBox(height: LSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: LSizes.spaceBtwItems),
              const LSSectionHeading(title: 'Profile Information', showActionButton: false),
              const SizedBox(height: LSizes.spaceBtwItems),
              
              LProfileMenu(onPressed: () {}, title: 'Name', value: 'Lucas Esteban'),
              LProfileMenu(onPressed: () {}, title: 'Username', value: 'lucasestebanlps'),

              const SizedBox(height: LSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: LSizes.spaceBtwItems),

              const LSSectionHeading(title: 'Personal Information', showActionButton: false),
              const SizedBox(height: LSizes.spaceBtwItems),

              LProfileMenu(onPressed: () {}, title: 'Email', value: 'example@gmail.com', icon: Iconsax.copy,),
              LProfileMenu(onPressed: () {}, title: 'Tel', value: '+393481999999'),
              LProfileMenu(onPressed: () {}, title: 'Gender', value: 'M'),
              LProfileMenu(onPressed: () {}, title: 'Date of birth', value: '21 Feb, 1994'),

              const SizedBox(height: LSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: LSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Delete Account', style: TextStyle(color: Colors.red),),
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

