import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/authentication_bloc.dart';
import 'repositories/user_repository.dart';
import 'services/api_service.dart';
import 'screens/welcome/welcome_page.dart';
import 'screens/login/login_page.dart';
import 'screens/admin/admin_page.dart';
import 'screens/teacher/teacher_page.dart';
import 'screens/student/student_page.dart';
import 'screens/parent/parent_page.dart';
import 'screens/profile/profile_page.dart';

void main() {
  final ApiService apiService = ApiService(baseUrl: 'https://documenter.getpostman.com/view/32611385/2sA3dvjXoo');
  final UserRepository userRepository = UserRepository(apiService: apiService);

  runApp(MyApp(userRepository: userRepository));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  MyApp({required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(userRepository: userRepository),
        ),
      ],
      child: MaterialApp(
        title: 'School App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AdminPage(),
        routes: {
          '/login': (context) => LoginPage(),
          '/admin': (context) => AdminPage(),
          '/teacher': (context) => TeacherPage(),
          '/student': (context) => StudentPage(),
          '/parent': (context) => ParentPage(),
          '/profile': (context) => ProfilePage(),
        },
      ),
    );
  }
}
