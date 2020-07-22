import 'package:PlningVyage/views/widgets/ville_card.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List villes = [
    {
      'name': 'Toulouse',
      'image': 'assets/images/Toulouse.jpg',
      'checked': false
    },
    {'name': 'Paris', 'image': 'assets/images/paris.jpg', 'checked': false},
    {'name': 'Nantes', 'image': 'assets/images/nantes.jpg', 'checked': false},
  ];

  void switchChecked(ville) {
    var index = villes.indexOf(ville);
    setState(() {
      villes[index]['checked'] = !villes[index]['checked'];
    });
  }

  @override
  Widget build(BuildContext context) {
    villes.map((ville) => print(ville));

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
        backgroundColor: Colors.greenAccent,
        title: Text('Mes Plans de Voyage'),
        actions: <Widget>[Icon(Icons.more_vert)],
      ),
      body: Container(
        padding: EdgeInsets.all(7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: villes
              .map((ville) => VilleCard(
                    name: ville['name'],
                    image: ville['image'],
                    checked: ville['checked'],
                    updateChecked: () => switchChecked(ville),
                  ))
              .toList(),
        ),
      ),
    );
  }
}