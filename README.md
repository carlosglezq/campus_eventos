# Campus Eventos

Aplicación en **Flutter** para que los estudiantes de la universidad consulten
las actividades del campus (académicas, deportivas, culturales, tecnológicas
y talleres) y las filtren por categoría.

Práctica de la materia de Programación de Dispositivos Móviles.

## Características

- Catálogo de 20 eventos universitarios con imagen, categoría, fecha, hora,
  lugar y cupo disponible.
- Filtro por categoría (`Todos`, `Académicos`, `Deportivos`, `Culturales`,
  `Tecnología`, `Talleres`) mediante `ChoiceChip`, con contador de
  "Eventos encontrados" que se actualiza en tiempo real.
- Botón **Me interesa** en cada tarjeta que muestra un `SnackBar` con el
  nombre del evento.
- Diseño responsivo: `ListView` de una columna en pantallas de celular y
  `GridView` de varias columnas en pantallas anchas (tablet, web, escritorio).
- Tema propio (claro/oscuro) basado en Material 3.

## Estructura del proyecto

```
lib/
├── main.dart              # Punto de entrada, configura el MaterialApp y el tema
├── models/
│   └── campus_event.dart  # Modelo CampusEvent y enum EventCategory
├── data/
│   └── event_data.dart    # Fuente de datos: lista de los 20 eventos
├── screens/
│   └── home_page.dart     # Pantalla principal (StatefulWidget, filtrado)
├── widgets/
│   ├── event_card.dart    # Tarjeta de evento
│   ├── category_chip.dart # Chip de categoría reutilizable
│   └── empty_state.dart   # Estado vacío cuando no hay eventos filtrados
├── theme/
│   └── app_theme.dart     # Paleta y ThemeData (claro/oscuro)
└── utils/
    └── date_utils.dart    # Formateo de fechas/horas en español
```

## Cómo ejecutar

```bash
flutter pub get
flutter run -d chrome     # Web
flutter run -d windows    # Windows Desktop
flutter run                # Dispositivo Android conectado
```

## Pruebas

```bash
flutter analyze
flutter test
```

## Autor

Carlos González — Programación de Dispositivos Móviles.
