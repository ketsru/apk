import 'package:flutter/material.dart';
import 'package:apk/theme/colors/light_colors.dart';

class StudentPage extends StatelessWidget {
  // Widget personnalisé
  Widget customMenu({
    required BuildContext context,
    required String route,
    required Color backgroundColor,
    required Color iconColor,
    required IconData icon,
    required String text,
  }) {
    return Expanded(
      // Placement de Expanded ici
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Column(
              children: <Widget>[
                TopContainer(
                  height: 200,
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(Icons.menu,
                                color: LightColors.kDarkBlue, size: 30.0),
                            Icon(Icons.notifications_active,
                                color: LightColors.kDarkBlue, size: 25.0),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              height: 90,
                              width: 90,
                              child: const Stack(
                                fit: StackFit.expand,
                                children: [
                                  CircularProgressIndicator(
                                    value: 0.75,
                                    strokeWidth: 5.0,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        LightColors.kRed),
                                    backgroundColor: LightColors.kDarkYellow,
                                  ),
                                  Center(
                                    child: CircleAvatar(
                                      backgroundColor: LightColors.kBlue,
                                      radius: 35.0,
                                      backgroundImage: AssetImage(
                                        'assets/images/avatar.png',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: const Text(
                                    'Bin-Idris',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      color: LightColors.kDarkBlue,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: const Text(
                                    'App Developer',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 16),
                      Row(
                        children: <Widget>[
                          customMenu(
                            context: context,
                            route: '/cours-for-student',
                            backgroundColor: Color(0xffFBB97C),
                            iconColor: const Color(0xffFCCA9B),
                            icon: Icons.list,
                            text: "Cours",
                          ),
                          const SizedBox(width: 16),
                          customMenu(
                            context: context,
                            route: '/exercice-for-student',
                            backgroundColor: LightColors.kRed,
                            iconColor: const Color(0xffBBBBBB),
                            icon: Icons.calendar_today,
                            text: "Exercices",
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: <Widget>[
                          customMenu(
                            context: context,
                            route: '/note-for-student',
                            backgroundColor: LightColors.kGreen,
                            iconColor: const Color(0xffFCCA9B),
                            icon: Icons.trending_up,
                            text: "Note",
                          ),
                          const SizedBox(width: 16),
                          customMenu(
                            context: context,
                            route: '/attendance-for-student',
                            backgroundColor: LightColors.kBlue,
                            iconColor: const Color(0xffBBBBBB),
                            icon: Icons.check_circle,
                            text: "Présence",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: OtherProfil(),
          ),
        ],
      ),
    );
  }
}

class TopContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;

  TopContainer(
      {required this.height, required this.width, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        color: LightColors.kDarkYellow,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40.0),
          bottomRight: Radius.circular(40.0),
        ),
      ),
      child: child,
    );
  }
}

class OtherProfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Action à définir lors du tap
      },
      child: Container(
        decoration: BoxDecoration(
          color: LightColors.kDarkYellow,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 11),
        child: Row(
          children: <Widget>[
            const SizedBox(
              width: 17,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Autre compte",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
              decoration: BoxDecoration(
                color: const Color(0xffFBB97C),
                borderRadius: BorderRadius.circular(13),
              ),
              child: const Icon(Icons.chevron_right),
            )
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: StudentPage()));
}
