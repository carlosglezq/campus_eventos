/// Utilidades para formatear fechas y horas en español sin depender del
/// paquete `intl`, manteniendo el proyecto ligero.
library;

const List<String> _diasSemana = [
  'lunes',
  'martes',
  'miércoles',
  'jueves',
  'viernes',
  'sábado',
  'domingo',
];

const List<String> _meses = [
  'enero',
  'febrero',
  'marzo',
  'abril',
  'mayo',
  'junio',
  'julio',
  'agosto',
  'septiembre',
  'octubre',
  'noviembre',
  'diciembre',
];

/// Ej: "vie. 3 oct."
String formatShortDateEs(DateTime date) {
  final dia = _diasSemana[date.weekday - 1].substring(0, 3);
  final mes = _meses[date.month - 1].substring(0, 3);
  return '$dia. ${date.day} $mes.';
}

/// Ej: "viernes 3 de octubre"
String formatLongDateEs(DateTime date) {
  final dia = _diasSemana[date.weekday - 1];
  final mes = _meses[date.month - 1];
  return '$dia ${date.day} de $mes';
}

/// Ej: "5:30 p. m."
String formatTime12Es(DateTime date) {
  final hour24 = date.hour;
  final period = hour24 >= 12 ? 'p. m.' : 'a. m.';
  int hour12 = hour24 % 12;
  if (hour12 == 0) hour12 = 12;
  final minute = date.minute.toString().padLeft(2, '0');
  return '$hour12:$minute $period';
}
