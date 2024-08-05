//Navbar présentant "Tout", "Class" et "Filtre"
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
      color: Colors.orange,
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TabBar(
              controller: tabController,
              isScrollable: false,
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
              ),
              tabs: <Widget>[
                Tab(
                  child: Center(
                    child: Text(
                      "Tous",
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
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
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Row(
              children: <Widget>[
                Icon(Icons.filter_list, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  "Filtre",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
            onPressed: onFilterPressed,
          ),
        ],
      ),
    );
  }
}
