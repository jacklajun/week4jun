import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:week4/calculate.dart';

void main() {
  runApp(MyApp(
    model: Game(),
  ));
}

class MyApp extends StatelessWidget {
  final Game model;
  const MyApp({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<Game>(
      model: model,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GameStore',
        home: Listscreen(),
      ),
    );
  }
}

class Listscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent[300],
        title: Text('Game Store'),
      ),
      body: ListView.builder(
          itemExtent: 80,
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            return ScopedModelDescendant<Game>(
                builder: (context, child, model) {
                  return ListTile(
                      leading: CircleAvatar(
                          backgroundImage: AssetImage(itemList[index].image)),
                      title: Text(itemList[index].title),
                      subtitle: Text('\฿' + itemList[index].price.toString()),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        model.addGame(itemList[index]);
                        print('Add: ' + itemList[index].title);
                        print(model.calculateTotal());
                      });
                });
          }),
    );
  }
}

class Games {
  int price;
  int id;
  String title;
  String image;
  Games(
      {@required this.price,
        @required this.id,
        @required this.title,
        @required this.image});
}

List<Games> itemList = [
  Games(
      id: 1,
      title: 'Devour',
      image: 'assets/images/devour.jpg',
      price: 90),
  Games(
      id: 2,
      title: 'Hades',
      image: 'assets/images/hades.jpg',
      price: 299),
  Games(
      id: 3,
      title: 'Kingdom heart 3',
      image: 'assets/images/kingdom.jpg',
      price: 300),
  Games(
      id: 4,
      title: 'Nightmare II',
      image: 'assets/images/nightmare.jpg',
      price: 90),
  Games(
      id: 5,
      title: 'Player unknown battleground',
      image: 'assets/images/pubg.jpg',
      price: 300),
  Games(
      id: 6,
      title: 'Rainbow six seige',
      image: 'assets/images/rb6.jpg',
      price: 300),
  Games(
      id: 7,
      title: 'Red Dead Redemption II',
      image: 'assets/images/red dead.jpg',
      price: 500),
  Games(
      id: 8,
      title: 'Stardew Valley',
      image: 'assets/images/stardew.jpg',
      price: 99),
  Games(
      id: 9,
      title: 'Valheim',
      image: 'assets/images/valheim.jpg',
      price: 299),
  Games(
      id: 10,
      title: 'Yakusa',
      image: 'assets/images/yakusa.jpg',
      price: 599),
];
