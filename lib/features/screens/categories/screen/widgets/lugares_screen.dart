import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/common/widgets/buttons/action_buttons.dart';
import 'package:applichiamoci/common/widgets/drawer/custom_drawer.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class Lugar {
  final String title;
  final String description;
  final String telefono;
  final String direccion;
  final String? imagen;

  Lugar({
    required this.title,
    required this.description,
    required this.telefono,
    required this.direccion,
    this.imagen,
  });
}

class LugaresScreen extends StatelessWidget {
  final String categoria;

  const LugaresScreen({super.key, required this.categoria});

  @override
  Widget build(BuildContext context) {
    List<Lugar> lugares = obtenerLugaresParaCategoria(categoria);

    return Scaffold(
      appBar: LAppBar(
        showBackArrow: true,
        title: Text(categoria, style: Theme.of(context).textTheme.headlineSmall!),
      ),
      endDrawer: const CustomDrawer(),

      body: Padding(
        padding: const EdgeInsets.all(LSizes.sm),
        child: ListView.builder(
          itemCount: lugares.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 3.0,
              child: Padding(
                padding: const EdgeInsets.all(LSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ------- IMAGE -------
                    if (lugares[index].imagen != null)
                      Image.network(
                        lugares[index].imagen!,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    const SizedBox(height: LSizes.spaceBtwItems),
                    // ------- TITLE -------
                    Text(lugares[index].title, style: Theme.of(context).textTheme.headlineSmall),
                    Text(lugares[index].description, textAlign: TextAlign.start, style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(height: LSizes.spaceBtwItems),
                    ActionButtons(callActionParameter: lugares[index].telefono, mapActionParameter: lugares[index].direccion,),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
  List<Lugar> obtenerLugaresParaCategoria(String categoria) {
    // Implementa la lógica para obtener lugares según la categoría
    // (Consulta Firebase u otra fuente de datos)
    // Este es solo un ejemplo
    return [
      Lugar(
        title: '$categoria - Lugar 1',
        description: 'Descripción del Lugar 1',
        telefono: '123-456-7890',
        direccion: 'Dirección del Lugar 1',
        imagen: null,
      ),
      Lugar(
        title: '$categoria - Lugar 2',
        description: 'Descripción del Lugar 2',
        telefono: '987-654-3210',
        direccion: 'Dirección del Lugar 2',
        imagen: null, // Sin imagen
      ),
      // Agrega más lugares según la categoría
    ];
  }
}