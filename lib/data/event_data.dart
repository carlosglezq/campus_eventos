import '../models/campus_event.dart';

/// Fuente de datos de los eventos del campus.
///
/// Requisito de la práctica: los eventos NO deben escribirse dentro de la
/// pantalla principal. Este archivo es la única fuente de verdad; si en el
/// futuro los eventos vinieran de una API o una base de datos, solo este
/// archivo (o un repositorio que lo reemplace) tendría que cambiar.
final List<CampusEvent> campusEvents = [
  // ---------------------------------------------------------------------
  // Académicos
  // ---------------------------------------------------------------------
  CampusEvent(
    id: 'acad-01',
    title: 'Coloquio de Investigación Multidisciplinaria',
    category: EventCategory.academico,
    dateTime: DateTime(2026, 9, 24, 10, 0),
    location: 'Auditorio Central',
    totalSpots: 200,
    spotsTaken: 138,
    imageSeed: 'coloquio-investigacion',
    description:
        'Estudiantes y docentes presentan avances de proyectos de investigación de todas las facultades.',
  ),
  CampusEvent(
    id: 'acad-02',
    title: 'Conferencia: IA Aplicada a la Industria',
    category: EventCategory.academico,
    dateTime: DateTime(2026, 9, 29, 12, 0),
    location: 'Sala Audiovisual 2',
    totalSpots: 120,
    spotsTaken: 120,
    imageSeed: 'conferencia-ia',
    description:
        'Especialistas de la industria comparten casos reales de inteligencia artificial aplicada.',
  ),
  CampusEvent(
    id: 'acad-03',
    title: 'Semana de la Ingeniería 2026',
    category: EventCategory.academico,
    dateTime: DateTime(2026, 10, 6, 9, 0),
    location: 'Explanada Principal',
    totalSpots: 500,
    spotsTaken: 210,
    imageSeed: 'semana-ingenieria',
    description:
        'Conferencias, stands y demostraciones de todos los programas de ingeniería.',
  ),
  CampusEvent(
    id: 'acad-04',
    title: 'Concurso de Casos de Estudio Empresariales',
    category: EventCategory.academico,
    dateTime: DateTime(2026, 10, 15, 16, 30),
    location: 'Sala de Usos Múltiples',
    totalSpots: 80,
    spotsTaken: 47,
    imageSeed: 'casos-estudio',
    description:
        'Equipos multidisciplinarios resuelven un caso de negocio real ante un panel de jueces.',
  ),

  // ---------------------------------------------------------------------
  // Deportivos
  // ---------------------------------------------------------------------
  CampusEvent(
    id: 'dep-01',
    title: 'Torneo Interfacultades de Fútbol Rápido',
    category: EventCategory.deportivo,
    dateTime: DateTime(2026, 9, 26, 17, 0),
    location: 'Cancha de Fútbol Rápido',
    totalSpots: 160,
    spotsTaken: 96,
    imageSeed: 'futbol-rapido',
    description:
        'Fase de grupos del torneo interfacultades. Entrada libre para porras.',
  ),
  CampusEvent(
    id: 'dep-02',
    title: 'Copa Universitaria de Baloncesto',
    category: EventCategory.deportivo,
    dateTime: DateTime(2026, 10, 3, 18, 0),
    location: 'Domo Deportivo',
    totalSpots: 300,
    spotsTaken: 275,
    imageSeed: 'copa-basquetbol',
    description: 'Semifinales de la copa universitaria de baloncesto varonil y femenil.',
  ),
  CampusEvent(
    id: 'dep-03',
    title: 'Carrera Atlética 5K "Corre por tu Campus"',
    category: EventCategory.deportivo,
    dateTime: DateTime(2026, 10, 10, 7, 0),
    location: 'Circuito perimetral del campus',
    totalSpots: 400,
    spotsTaken: 180,
    imageSeed: 'carrera-5k',
    description: 'Carrera recreativa abierta a toda la comunidad universitaria.',
  ),
  CampusEvent(
    id: 'dep-04',
    title: 'Torneo Relámpago de Voleibol Mixto',
    category: EventCategory.deportivo,
    dateTime: DateTime(2026, 10, 18, 16, 0),
    location: 'Gimnasio Universitario',
    totalSpots: 96,
    spotsTaken: 40,
    imageSeed: 'voleibol-mixto',
    description: 'Equipos mixtos de 6 integrantes compiten en formato de eliminación directa.',
  ),

  // ---------------------------------------------------------------------
  // Culturales
  // ---------------------------------------------------------------------
  CampusEvent(
    id: 'cul-01',
    title: 'Festival de Día de Muertos Universitario',
    category: EventCategory.cultural,
    dateTime: DateTime(2026, 10, 30, 11, 0),
    location: 'Plaza Central',
    totalSpots: 600,
    spotsTaken: 310,
    imageSeed: 'dia-de-muertos',
    description: 'Concurso de altares, comparsa y venta de artesanías estudiantiles.',
  ),
  CampusEvent(
    id: 'cul-02',
    title: 'Muestra de Danza Folklórica',
    category: EventCategory.cultural,
    dateTime: DateTime(2026, 10, 9, 19, 0),
    location: 'Teatro Universitario',
    totalSpots: 250,
    spotsTaken: 158,
    imageSeed: 'danza-folklorica',
    description: 'El ballet folklórico universitario presenta su repertorio de la temporada.',
  ),
  CampusEvent(
    id: 'cul-03',
    title: 'Concierto de la Estudiantina',
    category: EventCategory.cultural,
    dateTime: DateTime(2026, 9, 27, 20, 0),
    location: 'Explanada Principal',
    totalSpots: 350,
    spotsTaken: 350,
    imageSeed: 'estudiantina',
    description: 'Concierto tradicional de la estudiantina universitaria, entrada libre.',
  ),
  CampusEvent(
    id: 'cul-04',
    title: 'Exposición de Arte Digital Estudiantil',
    category: EventCategory.cultural,
    dateTime: DateTime(2026, 10, 22, 12, 0),
    location: 'Galería de Artes',
    totalSpots: 150,
    spotsTaken: 62,
    imageSeed: 'arte-digital',
    description: 'Muestra de ilustración, animación y arte generativo de alumnos de todas las carreras.',
  ),

  // ---------------------------------------------------------------------
  // Tecnología
  // ---------------------------------------------------------------------
  CampusEvent(
    id: 'tec-01',
    title: 'Hackathon Campus Innovación 2026',
    category: EventCategory.tecnologia,
    dateTime: DateTime(2026, 11, 7, 9, 0),
    location: 'Centro de Innovación Tecnológica',
    totalSpots: 180,
    spotsTaken: 165,
    imageSeed: 'hackathon',
    description: '24 horas continuas de desarrollo. Equipos de hasta 4 integrantes.',
  ),
  CampusEvent(
    id: 'tec-02',
    title: 'Taller de Introducción a Flutter y Dart',
    category: EventCategory.tecnologia,
    dateTime: DateTime(2026, 9, 25, 16, 0),
    location: 'Laboratorio de Cómputo 3',
    totalSpots: 40,
    spotsTaken: 40,
    imageSeed: 'taller-flutter',
    description: 'Introducción práctica al desarrollo multiplataforma con Flutter.',
  ),
  CampusEvent(
    id: 'tec-03',
    title: 'Demo Day de Proyectos de Software',
    category: EventCategory.tecnologia,
    dateTime: DateTime(2026, 10, 13, 17, 30),
    location: 'Sala de Innovación',
    totalSpots: 100,
    spotsTaken: 54,
    imageSeed: 'demo-day',
    description: 'Los equipos del último semestre presentan sus proyectos finales a la industria.',
  ),
  CampusEvent(
    id: 'tec-04',
    title: 'Charla: Ciberseguridad para Estudiantes',
    category: EventCategory.tecnologia,
    dateTime: DateTime(2026, 10, 1, 11, 0),
    location: 'Auditorio Central',
    totalSpots: 150,
    spotsTaken: 71,
    imageSeed: 'ciberseguridad',
    description: 'Buenas prácticas de seguridad digital y protección de identidad en línea.',
  ),

  // ---------------------------------------------------------------------
  // Talleres
  // ---------------------------------------------------------------------
  CampusEvent(
    id: 'tal-01',
    title: 'Taller de Oratoria y Debate',
    category: EventCategory.taller,
    dateTime: DateTime(2026, 9, 23, 15, 0),
    location: 'Sala de Usos Múltiples',
    totalSpots: 35,
    spotsTaken: 22,
    imageSeed: 'oratoria',
    description: 'Técnicas de expresión oral y argumentación aplicadas a debates universitarios.',
  ),
  CampusEvent(
    id: 'tal-02',
    title: 'Taller de Fotografía con Smartphone',
    category: EventCategory.taller,
    dateTime: DateTime(2026, 10, 4, 10, 0),
    location: 'Plaza de Ingenierías',
    totalSpots: 30,
    spotsTaken: 12,
    imageSeed: 'fotografia',
    description: 'Composición, luz e iluminación básica usando únicamente el teléfono celular.',
  ),
  CampusEvent(
    id: 'tal-03',
    title: 'Taller de Primeros Auxilios',
    category: EventCategory.taller,
    dateTime: DateTime(2026, 10, 11, 9, 30),
    location: 'Centro de Salud Universitario',
    totalSpots: 45,
    spotsTaken: 45,
    imageSeed: 'primeros-auxilios',
    description: 'Certificación básica en RCP y atención de emergencias en el campus.',
  ),
  CampusEvent(
    id: 'tal-04',
    title: 'Taller de Finanzas Personales para Universitarios',
    category: EventCategory.taller,
    dateTime: DateTime(2026, 10, 20, 13, 0),
    location: 'Centro de Idiomas, Aula 4',
    totalSpots: 50,
    spotsTaken: 18,
    imageSeed: 'finanzas-personales',
    description: 'Cómo presupuestar, ahorrar y evitar el sobreendeudamiento desde la universidad.',
  ),
];
