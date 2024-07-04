import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String logoImagePath = 'assets/images/logo.png';

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(150); // Ajuste la hauteur de l'AppBar ici
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool _isSearchVisible = false; // Variable pour suivre la visibilité de la barre de recherche

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 16.0), // Padding en bas de l'AppBar
      child: AppBar(
        backgroundColor: const Color(0xFFEFF3EE),
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
                  'YFMT.',
                  style: TextStyle(
                    color: const Color(0xFF0C0C13),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      _isSearchVisible = !_isSearchVisible; // Toggle la visibilité
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {
                    // Action à effectuer lors du clic sur l'icône de notification
                  },
                ),
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    // Action à effectuer lors du clic sur l'icône de paramètres
                  },
                ),
              ],
            ),
            SizedBox(height: 0), // Espacement en dessous de la ligne du titre
          ],
        ),
        bottom: _isSearchVisible
            ? PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 16.0), // Padding avec espacement en haut
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Rechercher...',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              )
            : null, // Masque la barre de recherche si _isSearchVisible est faux
      ),
    );
  }
}
