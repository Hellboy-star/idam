import 'package:flutter/material.dart';
import 'package:idam/model/item.dart';
import 'package:idam/ajout_item.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'idam',
      theme: ThemeData(

        primarySwatch: Colors.lightBlue,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String nouvelleListe;
  var individu01 = new Item("John", "Le Rouge","02/04/1950", "51 Bequerville", 00899782, "john.@yahoo.com", "Homme", "image/Red-John-Smiley-Face.png", "Tigre, Tigre, brûlant brillant, dans les forêts de la nuit; Quelle main, quel œil si puissant purent façonner ton effroyable symétrie?" );
  late List<Item> items;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          ElevatedButton(onPressed: versPageAjout,
              child: Text('Ajouter', style: TextStyle(color: Colors.white),))
        ],
      ),
      body:
      (items != null || items.length == 1)
        ? new Center(
        child: new Text(individu01.firstname),
      )

        :ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, i) {
            Item item = items[i];
            return ListTile(
              title: Text(item.firstname),
            );
          }
      )

    );
  }
void versPageAjout() {
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) {
      return new Ajout();
    } ));
}

}
