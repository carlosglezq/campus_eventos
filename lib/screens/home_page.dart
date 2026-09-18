import 'package:flutter/material.dart';

import '../data/event_data.dart';
import '../models/campus_event.dart';
import '../theme/app_theme.dart';
import '../widgets/category_chip.dart';
import '../widgets/empty_state.dart';
import '../widgets/event_card.dart';

/// Pantalla principal de Campus Eventos.
///
/// Es un [StatefulWidget] porque necesita recordar qué categoría está
/// seleccionada (`_selectedCategory`) y reconstruirse con [setState] cada
/// vez que el usuario elige un filtro distinto.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// `null` representa la categoría especial "Todos".
  EventCategory? _selectedCategory;

  List<CampusEvent> get _filteredEvents {
    if (_selectedCategory == null) return campusEvents;
    return campusEvents
        .where((event) => event.category == _selectedCategory)
        .toList(growable: false);
  }

  void _selectCategory(EventCategory? category) {
    setState(() => _selectedCategory = category);
  }

  void _showInterest(CampusEvent event) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle_rounded, color: Colors.greenAccent),
            const SizedBox(width: 12),
            Expanded(
              child: Text('Te registraste en "${event.title}"'),
            ),
          ],
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final events = _filteredEvents;
    final categoryLabel = _selectedCategory?.label ?? 'Todos';

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              child: const Icon(Icons.event_available_rounded),
            ),
            const SizedBox(width: 12),
            const Text('Campus Eventos'),
          ],
        ),
      ),
      body: Column(
        children: [
          const _HeaderBanner(),
          _CategoryFilterBar(
            selected: _selectedCategory,
            onSelect: _selectCategory,
          ),
          _ResultsCounter(
            count: events.length,
            categoryLabel: categoryLabel,
            showClear: _selectedCategory != null,
            onClear: () => _selectCategory(null),
          ),
          Expanded(
            child: events.isEmpty
                ? EmptyState(categoryLabel: categoryLabel)
                : LayoutBuilder(
                    builder: (context, constraints) {
                      final isPhone =
                          constraints.maxWidth < AppBreakpoints.phone;

                      if (isPhone) {
                        return ListView.builder(
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                          itemCount: events.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: EventCard(
                              event: events[index],
                              onInterested: _showInterest,
                            ),
                          ),
                        );
                      }

                      return GridView.builder(
                        padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 420,
                          childAspectRatio: 0.72,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: events.length,
                        itemBuilder: (context, index) => EventCard(
                          event: events[index],
                          onInterested: _showInterest,
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

/// Encabezado con el nombre de la app y una breve descripción, además de un
/// par de estadísticas rápidas que dan sensación de "app terminada".
class _HeaderBanner extends StatelessWidget {
  const _HeaderBanner();

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [scheme.primary, scheme.tertiary],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tu punto de encuentro con la vida universitaria',
            style: textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Encuentra eventos académicos, deportivos, culturales, '
            'tecnológicos y talleres, y regístrate en los que más te interesen.',
            style: textTheme.bodySmall?.copyWith(
              color: Colors.white.withValues(alpha: 0.92),
              height: 1.3,
            ),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _StatPill(
                icon: Icons.event_note_rounded,
                label: '${campusEvents.length} eventos',
              ),
              _StatPill(
                icon: Icons.category_rounded,
                label: '${EventCategory.values.length} categorías',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatPill extends StatelessWidget {
  final IconData icon;
  final String label;

  const _StatPill({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 15, color: Colors.white),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12.5,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

/// Barra de filtros por categoría. Usa [Wrap] en vez de una fila con scroll
/// horizontal para que, en pantallas muy angostas, los chips que no caben
/// bajen a una segunda línea en lugar de desbordarse.
class _CategoryFilterBar extends StatelessWidget {
  final EventCategory? selected;
  final ValueChanged<EventCategory?> onSelect;

  const _CategoryFilterBar({required this.selected, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 4),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          CategoryChip(
            label: 'Todos',
            icon: Icons.apps_rounded,
            color: scheme.primary,
            selected: selected == null,
            onSelected: () => onSelect(null),
          ),
          for (final category in EventCategory.values)
            CategoryChip(
              label: category.label,
              icon: category.icon,
              color: category.color,
              selected: selected == category,
              onSelected: () => onSelect(category),
            ),
        ],
      ),
    );
  }
}

/// Contador de resultados. Se recalcula en cada `build`, así que siempre
/// refleja la categoría actualmente seleccionada.
class _ResultsCounter extends StatelessWidget {
  final int count;
  final String categoryLabel;
  final bool showClear;
  final VoidCallback onClear;

  const _ResultsCounter({
    required this.count,
    required this.categoryLabel,
    required this.showClear,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 8, 6),
      child: Row(
        children: [
          Icon(Icons.search_rounded, size: 18, color: scheme.onSurfaceVariant),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              'Eventos encontrados: $count',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (showClear)
            TextButton.icon(
              onPressed: onClear,
              icon: const Icon(Icons.close_rounded, size: 16),
              label: const Text('Limpiar filtro'),
            ),
        ],
      ),
    );
  }
}
