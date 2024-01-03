import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

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
        OutlinedButton(
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
    return ElevatedButton(
        onPressed: () {
          LHelperFunctions.callAction(phoneNumber);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          side: const BorderSide(color: Colors.green)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                iconData,
                color: Colors.white,
              ),
              const SizedBox(width: 16.0),
              Flexible(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                  overflow: TextOverflow.ellipsis, // Trunca el texto y agrega puntos suspensivos
                  maxLines: 1, // Limita a una sola línea
                ),
              ),
            ],
          ),
        ),
    );
  }
}
