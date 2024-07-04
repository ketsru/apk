import 'package:flutter/material.dart';

class CustomDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.5, // 50% de la hauteur de l'écran
          decoration: BoxDecoration(
            color: const Color(0xFF042A02), // Couleur de fond du dashboard
            //borderRadius: BorderRadius.only(
              /*bottomLeft: Radius.circular(50.0), // Border radius bottom-left
              bottomRight: Radius.circular(50.0), // Border radius bottom-right
            ),*/
          ),
        ),
        CustomAppBar(), // Intégration de l'appBar ici
        Positioned.fill(
          top: MediaQuery.of(context).padding.top + kToolbarHeight / 2,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Taux de présence
                    DashboardStat(
                      label: 'Présence',
                      value: '85%',
                      icon: Icons.check_circle_outline,
                      color: Colors.green,
                    ),
                    // Cercle central
                    DashboardCircle(
                      successRate: '80%', // Taux de réussite des élèves
                    ),
                    // Taux d'absence
                    DashboardStat(
                      label: 'Absence',
                      value: '15%',
                      icon: Icons.cancel_outlined,
                      color: Colors.red,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 16.0), // Padding en bas de l'AppBar
      child: AppBar(
        backgroundColor: Colors.transparent, // Couleur de fond transparente
        shadowColor: Colors.transparent, // Pas d'ombre
        titleSpacing: 0,
        elevation: 0,
        toolbarHeight: 90,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                ),
                SizedBox(width: 2),
                Text(
                  'ECOLE.',
                  style: TextStyle(
                    color: const Color(0xFFF7F7FC),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.search, color: Colors.white),
                  onPressed: () {
                    // Action à effectuer lors du clic sur l'icône de recherche
                  },
                ),
                IconButton(
                  icon: Icon(Icons.notifications, color: Colors.white),
                  onPressed: () {
                    // Action à effectuer lors du clic sur l'icône de notification
                  },
                ),
                IconButton(
                  icon: Icon(Icons.settings, color: Colors.white),
                  onPressed: () {
                    // Action à effectuer lors du clic sur l'icône de paramètres
                  },
                ),
              ],
            ),
            SizedBox(height: 0), // Espacement en dessous de la ligne du titre
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(150); // Ajuste la hauteur de l'AppBar ici
}

class DashboardCircle extends StatelessWidget {
  final String successRate; // Taux de réussite des élèves

  const DashboardCircle({
    Key? key,
    required this.successRate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      height: 120.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Réussite',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              successRate,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardStat extends StatelessWidget {
  final String label; // Nom du taux (Présence, Absence)
  final String value; // Valeur du taux (ex: 85%)
  final IconData icon; // Icône associée au taux
  final Color color; // Couleur de l'icône et du texte

  const DashboardStat({
    Key? key,
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: color,
          size: 32,
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
