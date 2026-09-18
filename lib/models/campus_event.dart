import 'package:flutter/material.dart';

/// Categorías disponibles para los eventos del campus.
///
/// El filtro "Todos" no forma parte de este enum: se representa en la
/// pantalla principal como `selectedCategory == null`.
enum EventCategory {
  academico,
  deportivo,
  cultural,
  tecnologia,
  taller,
}

/// Información visual y textual asociada a cada [EventCategory].
///
/// Centralizar estos datos aquí evita repetir switches por toda la app y
/// permite que tanto los chips de filtro como las tarjetas de evento usen
/// siempre el mismo color/ícono/etiqueta para una categoría.
extension EventCategoryData on EventCategory {
  String get label {
    switch (this) {
      case EventCategory.academico:
        return 'Académicos';
      case EventCategory.deportivo:
        return 'Deportivos';
      case EventCategory.cultural:
        return 'Culturales';
      case EventCategory.tecnologia:
        return 'Tecnología';
      case EventCategory.taller:
        return 'Talleres';
    }
  }

  IconData get icon {
    switch (this) {
      case EventCategory.academico:
        return Icons.school_rounded;
      case EventCategory.deportivo:
        return Icons.sports_soccer_rounded;
      case EventCategory.cultural:
        return Icons.theater_comedy_rounded;
      case EventCategory.tecnologia:
        return Icons.memory_rounded;
      case EventCategory.taller:
        return Icons.handyman_rounded;
    }
  }

  Color get color {
    switch (this) {
      case EventCategory.academico:
        return const Color(0xFF3F51B5);
      case EventCategory.deportivo:
        return const Color(0xFF00897B);
      case EventCategory.cultural:
        return const Color(0xFFD81B60);
      case EventCategory.tecnologia:
        return const Color(0xFF5E35B1);
      case EventCategory.taller:
        return const Color(0xFFEF6C00);
    }
  }
}

/// Modelo de un evento universitario.
///
/// Los eventos "en vivo" de la app se definen en `lib/data/event_data.dart`;
/// esta clase solamente describe la forma de los datos.
@immutable
class CampusEvent {
  final String id;
  final String title;
  final EventCategory category;
  final DateTime dateTime;
  final String location;
  final int totalSpots;
  final int spotsTaken;
  final String imageSeed;
  final String description;

  const CampusEvent({
    required this.id,
    required this.title,
    required this.category,
    required this.dateTime,
    required this.location,
    required this.totalSpots,
    required this.spotsTaken,
    required this.imageSeed,
    required this.description,
  });

  /// Lugares disponibles restantes (nunca negativo, por seguridad).
  int get spotsAvailable => (totalSpots - spotsTaken).clamp(0, totalSpots);

  /// Proporción de cupo ocupado, usada por la barra de progreso (0.0 a 1.0).
  double get occupancyRatio =>
      totalSpots == 0 ? 0 : (spotsTaken / totalSpots).clamp(0.0, 1.0);

  bool get isFull => spotsAvailable <= 0;

  bool get isAlmostFull => !isFull && occupancyRatio >= 0.8;

  /// URL determinística (misma imagen siempre para el mismo evento) usada
  /// como placeholder visual mientras no existan fotografías propias.
  String get imageUrl =>
      'https://picsum.photos/seed/$imageSeed/600/400';
}
