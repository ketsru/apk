import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/authentication_bloc.dart';
import 'services/api_service.dart';
import 'screens/welcome/welcome_page.dart';
import 'screens/login/login_page.dart';
import 'package:apk/screens/teacher/teacher_page.dart';
import 'package:apk/screens/profile/profile_page.dart';
import 'screens/student/student_page.dart';
import 'screens/parent/parent_page.dart';
import 'repositories/user_repository.dart';
import 'package:apk/screens/teacher/course_page.dart';
import 'package:apk/screens/teacher/teacher_exercice_page.dart';
import 'package:apk/screens/teacher/overview_student_attendance.dart';
import 'package:apk/screens/teacher/note_page.dart';

void main() {
  final ApiService apiService = ApiService(baseUrl: 'https://schoolapp-pink-xi.vercel.app/api/api');
  final UserRepository userRepository = UserRepository(apiService: apiService);
  final AuthenticationBloc authBloc = AuthenticationBloc(userRepository: userRepository);

  runApp(MyApp(authBloc: authBloc));}

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
          '/parent': (context) => ParentPage(),
          '/profile': (context) => ProfilePage(),
          '/cours': (context) => TeacherCoursePage(),
          '/exercice': (context) => TeacherExercicePage(), 
          '/note': (context) => AddStudentNote(),
          '/attendance': (context) => StudentAttendance(
              classData: [
                {'level': 'Terminal G3', 'studentCount': 30},
                {'level': 'Terminal A4', 'studentCount': 25},
                {'level': 'Terminal G2', 'studentCount': 28},
                {'level': 'Terminal D', 'studentCount': 32},
              ],
            ),
          // Ajoute d'autres routes ici si nécessaire
        },
      ),
    );
  }
}
