import 'package:flutter/material.dart';

import '../models/campus_event.dart';
import '../utils/date_utils.dart';

/// Tarjeta de un evento del campus.
///
/// Se usa tanto dentro del [ListView] (pantallas angostas, tipo celular)
/// como dentro del [GridView] (pantallas anchas), por lo que su diseño evita
/// alturas fijas que puedan desbordar en cualquiera de los dos contextos.
class EventCard extends StatelessWidget {
  final CampusEvent event;
  final ValueChanged<CampusEvent> onInterested;

  const EventCard({super.key, required this.event, required this.onInterested});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          _CardImage(event: event),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  event.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.calendar_today_rounded,
                        size: 15, color: scheme.onSurfaceVariant),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        formatShortDateEs(event.dateTime),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Icon(Icons.schedule_rounded,
                        size: 15, color: scheme.onSurfaceVariant),
                    const SizedBox(width: 6),
                    Text(
                      formatTime12Es(event.dateTime),
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.place_rounded,
                        size: 15, color: scheme.onSurfaceVariant),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        event.location,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _CapacityBar(event: event),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      onPressed: event.isFull ? null : () => onInterested(event),
                      icon: Icon(
                        event.isFull ? Icons.block_rounded : Icons.favorite_rounded,
                        size: 18,
                      ),
                      label: Text(event.isFull ? 'Cupo lleno' : 'Me interesa'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CardImage extends StatelessWidget {
  final CampusEvent event;

  const _CardImage({required this.event});

  @override
  Widget build(BuildContext context) {
    final category = event.category;

    return AspectRatio(
      aspectRatio: 16 / 10,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            event.imageUrl,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, progress) {
              if (progress == null) return child;
              return _ImageFallback(category: category, showSpinner: true);
            },
            errorBuilder: (context, error, stackTrace) =>
                _ImageFallback(category: category, showSpinner: false),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: _Badge(
              color: category.color,
              icon: category.icon,
              label: category.label,
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: _Badge(
              color: event.isFull
                  ? Colors.red.shade700
                  : event.isAlmostFull
                      ? Colors.orange.shade800
                      : Colors.green.shade700,
              icon: Icons.event_seat_rounded,
              label: event.isFull ? 'Sin cupo' : '${event.spotsAvailable} lugares',
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageFallback extends StatelessWidget {
  final EventCategory category;
  final bool showSpinner;

  const _ImageFallback({required this.category, required this.showSpinner});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: category.color,
      alignment: Alignment.center,
      child: showSpinner
          ? const SizedBox(
              width: 28,
              height: 28,
              child: CircularProgressIndicator(strokeWidth: 2.5, color: Colors.white),
            )
          : Icon(category.icon, color: Colors.white, size: 42),
    );
  }
}

class _Badge extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String label;

  const _Badge({required this.color, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: Colors.white),
          const SizedBox(width: 5),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11.5,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _CapacityBar extends StatelessWidget {
  final CampusEvent event;

  const _CapacityBar({required this.event});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = event.isFull
        ? Colors.red.shade600
        : event.isAlmostFull
            ? Colors.orange.shade700
            : Theme.of(context).colorScheme.tertiary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: event.occupancyRatio,
            minHeight: 6,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '${event.spotsTaken} de ${event.totalSpots} lugares ocupados',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
