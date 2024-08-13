import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'blocs/authentication_bloc.dart';
import 'services/api_service.dart';
import 'screens/welcome/welcome_page.dart';
import 'screens/login/login_page.dart';
import 'screens/teacher/home_page.dart';
import 'screens/profile/profile_page.dart';
import 'screens/student/student_page.dart';
import 'repositories/user_repository.dart';
import 'screens/teacher/course_page.dart';
import 'screens/teacher/exercice_page.dart';
import 'screens/teacher/student_page.dart';
import 'screens/teacher/note_page.dart';

import 'screens/student/cours.dart';
import 'screens/student/exercices.dart';
import 'screens/student/notes.dart';
import 'screens/student/presences.dart';
import 'screens/student/info.dart';

void main() async {
  // Initialiser Hive
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('class');

  // Récupérer le token depuis SharedPreferences
  final token = await _getToken();

  // Initialiser ApiService avec le token
  final ApiService apiService = ApiService(token: token);

  // Créer les instances de UserRepository et AuthenticationBloc
  final UserRepository userRepository = UserRepository(apiService: apiService);
  final AuthenticationBloc authBloc =
      AuthenticationBloc(userRepository: userRepository);

  // Lancer l'application
  runApp(MyApp(authBloc: authBloc));
}

// Récupérer le token depuis SharedPreferences
Future<String> _getToken() async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('access_token');
  return token ?? '';
}

class MyApp extends StatelessWidget {
  final AuthenticationBloc authBloc;

  MyApp({required this.authBloc});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      create: (context) => authBloc,
      child: MaterialApp(
        title: 'School',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: WelcomePage(),
        routes: {
          '/login': (context) => LoginPage(),
          '/teacher': (context) => TeacherPage(),
          '/student': (context) => StudentPage(),
          '/profile': (context) => ProfilePage(),
          '/student-info': (context) => InfoScreen(),
          '/cours': (context) => TeacherCoursePage(),
          '/exercice': (context) => TeacherExercicePage(),
          '/note': (context) => AddStudentNote(),
          '/attendance': (context) => StudentAttendance(),
          '/cours-for-student': (context) => CoursScreen(),
          '/exercice-for-student': (context) => ExercicesScreen(),
          '/note-for-student': (context) => NotesScreen(),
          '/attendance-for-student': (context) => PresencesScreen(),
        },
      ),
    );
  }
}
