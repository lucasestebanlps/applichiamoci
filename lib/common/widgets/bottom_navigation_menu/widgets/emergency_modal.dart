import 'package:applichiamoci/common/widgets/loaders/loaders.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyCallModal extends StatelessWidget {
  const EmergencyCallModal({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Numeri di emergenza:',
        textAlign: TextAlign.center,
      ),
      content: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          _EmergencyServiceButton(
            iconData: Icons.local_hospital,
            label: 'Emergenzia Sanitaria',
            phoneNumber: '118',
          ),
          SizedBox(
            height: LSizes.spaceBtwItems,
          ),
          _EmergencyServiceButton(
            iconData: Icons.security,
            label: 'Emergenzia sicurezza 1',
            phoneNumber: '112',
          ),
          SizedBox(
            height: LSizes.spaceBtwItems,
          ),
          _EmergencyServiceButton(
            iconData: Icons.security,
            label: 'Emergenzia sicurezza 2',
            phoneNumber: '113',
          ),
          SizedBox(
            height: LSizes.spaceBtwItems,
          ),
          _EmergencyServiceButton(
            iconData: Icons.fire_extinguisher,
            label: 'Emergenzia incendi',
            phoneNumber: '115',
          ),
          SizedBox(
            height: LSizes.spaceBtwItems,
          ),
          _EmergencyServiceButton(
            label: 'Emergencia antiviolenza',
            phoneNumber: '1522',
            iconData: Icons.heart_broken_outlined,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}

class _EmergencyServiceButton extends StatelessWidget {
  final String label;
  final String phoneNumber;
  final IconData iconData;

  const _EmergencyServiceButton({
    required this.label,
    required this.phoneNumber,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          _launchPhoneCall(phoneNumber);
        },
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 6), // Ajustar el espacio según sea necesario
            backgroundColor: Colors.green,
            side: const BorderSide(color: Colors.green)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(iconData), // Icono
            const SizedBox(width: 8.0), // Espacio entre el icono y el texto
            Text(label),
          ],
        ),
      ),
    );
  }

  void _launchPhoneCall(String phoneNumber) async {
    if (await canLaunchUrl(Uri(scheme: 'tel', path: phoneNumber))) {
      await launchUrl(Uri(scheme: 'tel', path: phoneNumber));
    } else {
      // Manejar el caso en que no se pueda realizar la llamada
      LLoaders.errorSnackBar(
          title: 'Error', message: 'Il numero non é disponibile');
    }
  }
}
