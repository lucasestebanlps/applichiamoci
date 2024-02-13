import 'package:applichiamoci/common/widgets/bottom_navigation_menu/widgets/emergency_button.dart';
import 'package:applichiamoci/common/widgets/bottom_navigation_menu/widgets/modal_company.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class EmergencyCallBottomSheet extends StatelessWidget {
  const EmergencyCallBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500, // Altura del BottomSheet
      padding: const EdgeInsets.symmetric(
          vertical: LSizes.sm, horizontal: LSizes.md),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text and icon for company button
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('Nostro numero:',
                  style: Theme.of(context).textTheme.headlineSmall),
              const ModalCompany()
            ]),
            // Company number
            const EmergencyServiceButton(
              iconData: Icons.business,
              label: 'Emergencia de la Empresa',
              phoneNumber: '123456789', // Número de emergencia de la empresa
              highlightColor: Colors.green, // Color para resaltar el botón
            ),
            const SizedBox(height: LSizes.defaultSpace),

            // Text for other numbers
            Text('Altri numeri:',
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 12),
            const EmergencyServiceButton(
              iconData: Icons.local_hospital,
              label: 'Emergencia Sanitaria',
              phoneNumber: '118',
            ),
            const SizedBox(height: LSizes.spaceBtwItems),

            // -- OTHER NUMBERS ---
            const EmergencyServiceButton(
              iconData: Icons.security,
              label: 'Emergencia Seguridad 1',
              phoneNumber: '112',
            ),
            const SizedBox(height: LSizes.spaceBtwItems),
            const EmergencyServiceButton(
              iconData: Icons.security,
              label: 'Emergencia Seguridad 2',
              phoneNumber: '113',
            ),
            const SizedBox(height: LSizes.spaceBtwItems),
            const EmergencyServiceButton(
              iconData: Icons.fire_extinguisher,
              label: 'Emergencia Incendios',
              phoneNumber: '115',
            ),
            const SizedBox(height: LSizes.spaceBtwInputFields),
            const EmergencyServiceButton(
              label: 'Emergencia antiviolenza',
              phoneNumber: '1522',
              iconData: Icons.heart_broken_outlined,
            ),
            const SizedBox(height: LSizes.spaceBtwItems),
          ],
        ),
      ),
    );
  }
}
