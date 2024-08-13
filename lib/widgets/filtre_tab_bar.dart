import 'package:flutter/material.dart';

class TabBarWithFilter extends StatelessWidget {
  final TabController tabController;
  final VoidCallback onFilterPressed;

  TabBarWithFilter({
    required this.tabController,
    required this.onFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 8, // Cette partie prend 80% de l'espace disponible
            child: TabBar(
              controller: tabController,
              isScrollable: false,
              //dividerColor: Colors.transparent,
              tabs: <Widget>[
                Tab(
                  child: Center(
                    child: Text(
                      "Tous",
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Center(
                    child: Text(
                      "Classe",
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: IconButton(
              icon: const Icon(Icons.filter_alt_outlined, color: Colors.white),
              onPressed: onFilterPressed,
            ),
          ),
        ],
      ),
    );
  }
}
