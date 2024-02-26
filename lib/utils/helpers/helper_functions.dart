import 'package:applichiamoci/common/widgets/loaders/loaders.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class LHelperFunctions {
  static Color? getColor(String value) {
    /// Define your product specific colors here and it will match the attribute colors and show specific 🟠🟡🟢🔵🟣🟤

    if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Red') {
      return Colors.red;
    } else if (value == 'Blue') {
      return Colors.blue;
    } else if (value == 'Pink') {
      return Colors.pink;
    } else if (value == 'Grey') {
      return Colors.grey;
    } else if (value == 'Purple') {
      return Colors.purple;
    } else if (value == 'Black') {
      return Colors.black;
    } else if (value == 'White') {
      return Colors.white;
    } else if (value == 'Yellow') {
      return Colors.yellow;
    } else if (value == 'Orange') {
      return Colors.deepOrange;
    } else if (value == 'Brown') {
      return Colors.brown;
    } else if (value == 'Teal') {
      return Colors.teal;
    } else if (value == 'Indigo') {
      return Colors.indigo;
    } else {
      return null;
    }
  }

  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static String getFormattedDate(DateTime date,
      {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
          i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }

  static void callAction(String callActionParameter) async {
    final status = await Permission.phone.request();
    if (status.isGranted) {
      final phoneNumber = Uri(scheme: 'tel', path: callActionParameter);
      if (await canLaunchUrl(phoneNumber)) {
        await launchUrl(phoneNumber);
      } else {
        LLoaders.errorSnackBar(
            title: LTexts.error,
            message: 'Il numero $callActionParameter non é disponibile',
            mainButton: true);
      }
    } else {
      LLoaders.errorSnackBar(
          title: LTexts.permissionDenied,
          message: LTexts.accessToPhoneRequiredMessage,
          mainButton: true);
    }
  }

  static void mapAction(String? mapActionParameter) async {
    final status = await Permission.locationWhenInUse.request();
    if (status.isGranted) {
      if (mapActionParameter != null) {
        MapsLauncher.launchQuery(mapActionParameter);
      } else {
        LLoaders.errorSnackBar(
          title: LTexts.error,
          message: 'Il mapa non é disponibile',
        );
      }
    } else {
      LLoaders.errorSnackBar(
        title: LTexts.permissionDenied,
        message: LTexts.accessToLocationRequiredMessage,
        mainButton: true,
      );
    }
  }

  Future<bool> showConfirmationDialog(
    BuildContext context,
    String title,
    String content,
  ) async {
    // Mostrar el diálogo de confirmación y esperar la respuesta del usuario
    bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              child: const Text(LTexts.accept),
              onPressed: () {
                Navigator.of(context)
                    .pop(true); // Indicar que se canceló la acción
              },
            ),
            TextButton(
              child: const Text(LTexts.cancel),
              onPressed: () {
                Navigator.of(context)
                    .pop(false); // Indicar que se confirmó la acción
              },
            ),
          ],
        );
      },
    );
    return confirmed ??
        false; // Si el usuario cierra el diálogo sin seleccionar ninguna opción, se considera como cancelado
  }
}
