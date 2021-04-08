import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora de IMC"),
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {},
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            //Cria meio que um container na vertical para colocar os campos
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(Icons.account_circle_rounded,
                    size: 120, color: Colors.deepOrangeAccent),
                //Adiciona um campo de texto que somente aceita números
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Peso em (Kg)",
                      labelStyle: TextStyle(color: Colors.deepOrangeAccent)),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 25.0),
                ),
                //Adiciona um campo de texto que somente aceita números
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Digite a sua altura (cm)",
                      labelStyle: TextStyle(color: Colors.deepOrangeAccent)),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 25.0),
                ),
              //Cria um padding para arrumar o espaçamento do botão e o TextField
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                //Cria um container para o botão Calcular
                child: Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("Calcular",
                      style: TextStyle(color: Colors.white, fontSize: 25.0)),
                  color: Colors.deepOrangeAccent,
                ),
              ),),
                Text("Info",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black87, fontSize: 25.0),)
              ],
            ),
        )
    );
  }
}
