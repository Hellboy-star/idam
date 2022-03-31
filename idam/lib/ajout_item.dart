import 'dart:html';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:idam/model/databaseClient.dart';
import 'package:idam/model/item.dart';

class Ajout extends StatefulWidget {


  @override
  _AjoutState createState() => new _AjoutState();

}

class _AjoutState extends State<Ajout> {

  late String image;
  late String firstname;
  late String lastname;
  late String birthday;
  late String adress;
  late int phone;
  late String mail;
  late String gender;
  late String picture;
  late String citation;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Ajouter individus'),

      ),
      body: new SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: new Column(
          children: [
            new Text('Individu à ajouter', textScaleFactor: 1.4, style: new TextStyle(color: Colors.red),),
            new Card(
              elevation: 10.0,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  (image == null)
                  ? new Image.asset("image/720236.png")
                  :new Image.file(new File(image)),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      new IconButton(onPressed: (() => getImage(ImageSource.camera)), icon: new Icon(Icons.camera_enhance)),
                      new IconButton(onPressed: (() => getImage(ImageSource.gallery)), icon: new Icon(Icons.photo_library)),
                    ],
                  ),
                  textField(TypeTextField.firstname, "Prénom de l'individu"),
                  textField(TypeTextField.lastname, "Nom de l'individu"),
                  textField(TypeTextField.birthday, "Date d'aniversaire"),
                  textField(TypeTextField.adress, "Adresse de l'individu"),
                  textField(TypeTextField.phone, "Numéro de téléphone"),
                  textField(TypeTextField.mail, "Mail de l'individu"),
                  textField(TypeTextField.gender, "Le genre"),
                  textField(TypeTextField.citation, "Citation favorite"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  TextField textField(TypeTextField type, String label) {
    return new TextField(
      decoration: new InputDecoration(labelText: label),
      onChanged: (String string) {
        switch (type) {
          case TypeTextField.firstname:
            firstname as String;
            break;
          case TypeTextField.lastname:
            lastname as String;
            break;
          case TypeTextField.birthday:
            birthday as String;
            break;
          case TypeTextField.adress:
            adress as String;
            break;
          case TypeTextField.phone:
            phone as int;
            break;
          case TypeTextField.mail:
            mail as String;
            break;
          case TypeTextField.gender:
            gender as String;
            break;
          case TypeTextField.citation:
            citation as String;
            break;
        }
      },
    );
  }

  void ajouter() {

    if (firstname != null) {
      Map<String, dynamic> map = {'firstname': firstname, 'item': widget
      };


      if (lastname != null) {
        map['lastname'] = lastname;
      }

      if (birthday != null) {
        map['birthday'] = birthday;
      }

      if (adress != null) {
        map['adress'] = adress;
      }

      if (phone != null) {
        map['phone'] = phone;
      }

      if (mail != null) {
        map['mail'] = mail;
      }

      if (gender != null) {
        map['gender'] = gender;
      }

      if (image != null) {
        map['image'] = image;
      }

      if (citation != null) {
        map['citation'] = citation;
      }
      Item item = new Item(firstname, lastname, birthday, adress, phone, mail, gender, picture, citation);
      item.toJson(map);
      DatabaseClient().ajoutItem(item).then((value) => null);
    }

  }

  Future getImage(ImageSource source) async {
    var nouvelleIMage = await ImagePicker.pickImage(source: source);
    setState(() {
      image = nouvelleIMage.path;
    });
  }

}

enum TypeTextField { firstname, lastname, birthday, adress, phone, mail,gender, citation }
