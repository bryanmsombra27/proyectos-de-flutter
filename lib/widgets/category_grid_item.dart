import 'package:flutter/material.dart';
import 'package:projects_2/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  final Category category;
  final void Function() onTap;

  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    //  LA DIFERENCIA ENTRE EL USO DE INKWELL Y GESTURE DETECTOR ES QUE EL INKWELL ES QUE CON INKWELL SE PUEDE AÑADIR UN EFECTO DE ONTAP, COMO UN COLOR DE SPLASH  O UN ANIMACIÓN DE ONTAP (MUY SUTIL). PERO AMBOS SON WIDGETS QUE SE USAN PARA DETECTAR GESTOS DE TOQUE EN LA PANTALLA.
    return InkWell(
      onTap: onTap,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withValues(alpha: .55),
              category.color.withValues(alpha: .9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
