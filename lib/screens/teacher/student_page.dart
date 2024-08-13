import 'package:flutter/material.dart';
import 'package:apk/widgets/custom_app_bar.dart';
import 'package:apk/services/api_service.dart';
import 'package:apk/models/studente.dart';
import 'package:apk/models/attendance.dart';
import 'package:apk/widgets/teacher_class.dart';
import 'package:apk/screens/teacher/attendance_page.dart';

void main() {
  runApp(AttendanceApp());
}

class AttendanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StudentAttendance(),
    );
  }
}

class StudentAttendance extends StatefulWidget {
  const StudentAttendance({Key? key}) : super(key: key);

  @override
  _StudentAttendanceState createState() => _StudentAttendanceState();
}

class _StudentAttendanceState extends State<StudentAttendance>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    // rcuperation du parram  'id'
    final int? id = arguments?['id'] as int?;
    final String? ClassName = arguments?['ClassName'] as String?;

    return Scaffold(
      appBar: CustomAppBar(
        title: ClassName ?? 'Présences',
      ),
      backgroundColor: Color(0xFFEEE0D5),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(text: 'Élèves'),
                Tab(text: 'Présences'),
              ],
            ),
          ),
          const SizedBox(height: 11),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                // Onglet "Élèves"
                FutureBuilder<String>(
                  future: ApiService.getToken(), // Récupération du token
                  builder: (context, tokenSnapshot) {
                    if (tokenSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (tokenSnapshot.hasError) {
                      return Center(
                          child: Text('Error: ${tokenSnapshot.error}'));
                    } else if (!tokenSnapshot.hasData ||
                        tokenSnapshot.data!.isEmpty) {
                      return const Center(child: Text('Token not available.'));
                    } else {
                      final accessToken = tokenSnapshot.data!;
                      return FutureBuilder<List<Student>>(
                        future: ApiService.fetchStudents(accessToken,
                            classId: id ?? 0),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return const Center(
                                child:
                                    Text('Aucun étudiant dans cette classe'));
                          } else {
                            final students = snapshot.data!;
                            return ListView.builder(
                              itemCount: students.length,
                              itemBuilder: (context, index) {
                                final student = students[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: TeacherClass(
                                    className:
                                        '${student.firstName} ${student.lastName}',
                                    icon: Icons.school,
                                    iconColor: Colors.orange,
                                    iconPadding: const EdgeInsets.all(8),
                                    subtitle: ClassName,
                                    route: '/student-info',
                                    trailingIcon: Icons.info,
                                    arguments: {
                                      'id': student.id,
                                      'firstName': student.firstName,
                                      'lastName': student.lastName,
                                      'ClassName': ClassName
                                    },
                                    containerColor: Colors.white,
                                  ),
                                );
                              },
                            );
                          }
                        },
                      );
                    }
                  },
                ),
                // Onglet "Présences"
                FutureBuilder<String>(
                  future: ApiService.getToken(), // Récupération du token
                  builder: (context, tokenSnapshot) {
                    if (tokenSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (tokenSnapshot.hasError) {
                      return Center(
                          child: Text('Error: ${tokenSnapshot.error}'));
                    } else if (!tokenSnapshot.hasData ||
                        tokenSnapshot.data!.isEmpty) {
                      return const Center(child: Text('Token not available.'));
                    } else {
                      final accessToken = tokenSnapshot.data!;
                      return Stack(
                        children: [
                          FutureBuilder<List<Attendance>>(
                            future: ApiService.fetchAttendance(
                                accessToken, id.toString()),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Center(
                                    child: Text('Error: ${snapshot.error}'));
                              } else if (!snapshot.hasData ||
                                  snapshot.data!.isEmpty) {
                                return const Center(
                                    child: Text(
                                        'Aucune présence pour cette classe'));
                              } else {
                                final attendances = snapshot.data!;
                                return ListView.builder(
                                  padding: const EdgeInsets.only(bottom: 80.0),
                                  itemCount: attendances.length,
                                  itemBuilder: (context, index) {
                                    final attendance = attendances[index];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: TeacherClass(
                                        className:
                                            '${attendance.firstName} ${attendance.lastName}',
                                        subtitle: attendance.isPresent
                                            ? 'Present'
                                            : 'Absent',
                                        route: '/attendance',
                                        arguments: {
                                          'id': attendance.idStudent,
                                          'firstName': attendance.firstName,
                                          'lastName': attendance.lastName,
                                        },
                                        iconColor: Colors.orange,
                                        containerColor: Colors.white,
                                        subtitleColor: attendance.isPresent
                                            ? Colors.green
                                            : Colors.red,
                                      ),
                                    );
                                  },
                                );
                              }
                            },
                          ),
                          Positioned(
                            bottom: 0.0,
                            left: 0,
                            right: 0,
                            child: Container(
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              decoration: BoxDecoration(
                                color: Colors.white, // Couleur branche
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                                border: Border(
                                  top: BorderSide(
                                    color: Color(0xFF666666),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            AttendanceScreen(id: id),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.pan_tool,
                                    color: Colors.white,
                                  ),
                                  label: Text(
                                    'FAIRE APPEL',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 11.0, vertical: 8.0),
                                    backgroundColor: Color(0xFF23324F),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
