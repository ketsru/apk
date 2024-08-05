//Widget responsable des select dans l'ajout des cours, note et exercice
import 'package:flutter/material.dart';

class CustomSingleSelectDropDown extends StatefulWidget {
  final IconData icone; // Icône à utiliser pour la sélection
  final String titre; // Texte à afficher lorsqu'aucune sélection n'est faite
  final Function(String) selectedItem;
  final List<String> classes;

  CustomSingleSelectDropDown({
    required this.icone,
    required this.titre,
    required this.selectedItem,
    required this.classes,
  });

  @override
  _CustomSingleSelectDropDownState createState() =>
      _CustomSingleSelectDropDownState();
}

class _CustomSingleSelectDropDownState
    extends State<CustomSingleSelectDropDown> {
  final ExpansionTileController _controller = ExpansionTileController();
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ExpansionTile(
        controller: _controller,
        iconColor: Colors.grey,
        title: Row(
          children: [
            // Afficher l'icône passée en paramètre lorsqu'aucune sélection n'est faite
            Icon(
              selectedItem == null ? widget.icone : Icons.check,
              color: selectedItem == null ? Colors.blue : Colors.blue,
              size: 20.0,
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9.0),
                child: Text(
                  selectedItem ?? widget.titre,
                  style: TextStyle(
                    color: selectedItem != null ? Colors.black : Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        children: <Widget>[
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.classes.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 8.0),
                child: _ViewItem(
                  item: widget.classes[index],
                  itemSelected: selectedItem == widget.classes[index],
                  selected: (val) {
                    setState(() {
                      selectedItem = val;
                      widget.selectedItem(selectedItem!);
                      _controller
                          .collapse(); // Ferme l'ExpansionTile après sélection
                    });
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ViewItem extends StatelessWidget {
  final String item;
  final bool itemSelected;
  final Function(String) selected;

  _ViewItem({
    required this.item,
    required this.itemSelected,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => selected(
          item), // Sélectionne l'élément lorsqu'on clique sur le conteneur
      child: FractionallySizedBox(
        widthFactor: 0.95, // Définit la largeur à 95% du parent
        child: Container(
          height: 48.0,
          decoration: BoxDecoration(
            color: itemSelected
                ? Colors.blue.withOpacity(0.1)
                : Colors.blue.withOpacity(0.1),
            border: Border.all(
              color: itemSelected ? Colors.blue : Colors.grey[300]!,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12.0), // Bordures arrondies
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9.0),
                child: Container(
                  height: 24.0,
                  width: 24.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: itemSelected ? Colors.blue : Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  child: itemSelected
                      ? Center(
                          child: Container(
                            height: 12.0,
                            width: 12.0,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                          ),
                        )
                      : null,
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 9.0),
                  child: Text(
                    item,
                    style: TextStyle(
                      color: itemSelected ? Colors.black : Colors.grey[800],
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
