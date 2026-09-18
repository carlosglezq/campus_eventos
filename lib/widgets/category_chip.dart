import 'package:flutter/material.dart';

/// Chip de filtro reutilizado tanto para "Todos" como para cada
/// [EventCategory]. Envuelve [ChoiceChip] con el ícono y color propios de
/// la categoría en vez de usar el estilo por defecto de Material.
class CategoryChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final bool selected;
  final VoidCallback onSelected;

  const CategoryChip({
    super.key,
    required this.label,
    required this.icon,
    required this.color,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return ChoiceChip(
      avatar: Icon(
        icon,
        size: 18,
        color: selected ? scheme.onPrimary : color,
      ),
      label: Text(label),
      selected: selected,
      onSelected: (_) => onSelected(),
      showCheckmark: false,
      selectedColor: color,
      backgroundColor: color.withValues(alpha: 0.10),
      side: BorderSide(color: selected ? color : color.withValues(alpha: 0.35)),
      labelStyle: TextStyle(
        color: selected ? scheme.onPrimary : scheme.onSurface,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
