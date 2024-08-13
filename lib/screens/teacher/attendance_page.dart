import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:apk/services/api_service.dart';
import 'package:apk/models/studente.dart';

void main() {
  runApp(AttendanceApp());
}

class AttendanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AttendanceScreen(),
    );
  }
}

class AttendanceScreen extends StatefulWidget {
  final int? id;

  AttendanceScreen({Key? key, this.id}) : super(key: key);
  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  late Future<String> _tokenFuture;
  late Future<List<Student>> _studentsFuture;

  @override
  void initState() {
    super.initState();
    _tokenFuture = ApiService.getToken();
    _tokenFuture.then((token) {
      setState(() {
        _studentsFuture =
            ApiService.fetchStudents(token, classId: widget.id ?? 0);
      });
    });
  }

  void _sendAttendance() {
    _tokenFuture.then((token) {
      _studentsFuture.then((students) {
        if (students != null && token.isNotEmpty) {
          ApiService.sendAttendance(token, students, classId: 3).then((_) {
            print('Presence data sent successfully.');
          }).catchError((error) {
            print('Error sending data: $error');
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xFFC89E86),
        ),
        title: const Text(''),
      ),
      backgroundColor: const Color(0xFFEEE0D5),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
              child: Text(
                'Marquer les présences',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF23324F),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: FutureBuilder<String>(
                future: _tokenFuture,
                builder: (context, tokenSnapshot) {
                  if (tokenSnapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (tokenSnapshot.hasError) {
                    return Center(child: Text('Error: ${tokenSnapshot.error}'));
                  } else if (!tokenSnapshot.hasData ||
                      tokenSnapshot.data!.isEmpty) {
                    return const Center(child: Text('Token not available.'));
                  } else {
                    final accessToken = tokenSnapshot.data!;
                    return Stack(
                      children: [
                        FutureBuilder<List<Student>>(
                          future: _studentsFuture,
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
                                padding: const EdgeInsets.only(bottom: 80.0),
                                itemCount: students.length,
                                itemBuilder: (context, index) {
                                  final student = students[index];
                                  final String name =
                                      '${student.firstName} ${student.lastName}';
                                  final bool isPresent = student.isPresent;

                                  return Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 5.0, horizontal: 15.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(11),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          blurRadius: 1,
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      child: ListTile(
                                        title: Text(
                                          name,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        trailing: Switch(
                                          activeColor: Colors.orange,
                                          value: isPresent,
                                          onChanged: (bool value) {
                                            setState(() {
                                              student.isPresent = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          },
                        ),
                        Positioned(
                          bottom: 16.0,
                          right: 16.0,
                          child: ElevatedButton.icon(
                            onPressed:
                                _sendAttendance, // Appel de la fonction lors du clic
                            icon: const Icon(
                              Icons.save,
                              color: Colors.white,
                            ),
                            label: const Text(
                              'Enregistrer',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 11.0, vertical: 8.0),
                              backgroundColor: Color(0xFF309397),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
