import 'package:flutter/material.dart';

/// Estado vacío mostrado cuando una categoría no tiene eventos registrados.
///
/// No debería ocurrir con los datos actuales (todas las categorías tienen
/// eventos), pero se incluye para que la app se sienta terminada y no se
/// rompa visualmente si en el futuro se agregan o quitan eventos.
class EmptyState extends StatelessWidget {
  final String categoryLabel;

  const EmptyState({super.key, required this.categoryLabel});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.event_busy_rounded, size: 56, color: scheme.outline),
            const SizedBox(height: 16),
            Text(
              'No hay eventos en "$categoryLabel"',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 6),
            Text(
              'Prueba con otra categoría o revisa "Todos" para ver la lista completa.',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: scheme.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }
}
