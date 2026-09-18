// Pruebas de humo (smoke tests) de Campus Eventos.
//
// Verifican lo mínimo indispensable para confiar en un `flutter run`:
// que la pantalla principal cargue con todos los eventos, que el filtrado
// por categoría funcione de verdad y que "Me interesa" muestre el SnackBar
// con el nombre del evento.

import 'package:flutter_test/flutter_test.dart';

import 'package:campus_eventos/data/event_data.dart';
import 'package:campus_eventos/main.dart';

void main() {
  testWidgets('Muestra el nombre de la app y todos los eventos al inicio',
      (WidgetTester tester) async {
    await tester.pumpWidget(const CampusEventosApp());
    await tester.pump();

    expect(find.text('Campus Eventos'), findsOneWidget);
    expect(
      find.text('Eventos encontrados: ${campusEvents.length}'),
      findsOneWidget,
    );
  });

  testWidgets('Filtrar por Tecnología muestra solo esos eventos, y Todos los restaura',
      (WidgetTester tester) async {
    await tester.pumpWidget(const CampusEventosApp());
    await tester.pump();

    final tecnologiaCount =
        campusEvents.where((e) => e.category.name == 'tecnologia').length;

    await tester.tap(find.text('Tecnología'));
    await tester.pump();

    expect(
      find.text('Eventos encontrados: $tecnologiaCount'),
      findsOneWidget,
    );

    await tester.tap(find.text('Todos'));
    await tester.pump();

    expect(
      find.text('Eventos encontrados: ${campusEvents.length}'),
      findsOneWidget,
    );
  });

  testWidgets('Al presionar "Me interesa" aparece el SnackBar con el nombre del evento',
      (WidgetTester tester) async {
    await tester.pumpWidget(const CampusEventosApp());
    await tester.pump();

    final firstEvent = campusEvents.first;

    final button = find.text('Me interesa').first;
    await tester.ensureVisible(button);
    await tester.pumpAndSettle();
    await tester.tap(button);
    await tester.pump();

    expect(
      find.text('Te registraste en "${firstEvent.title}"'),
      findsOneWidget,
    );
  });
}
