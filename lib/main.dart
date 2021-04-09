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
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  //Instancia da classe TextEditingController
  TextEditingController weightController = new TextEditingController();
  TextEditingController heightController = new TextEditingController();
  //Variavel
  String _textInfo ="Informe seus dados";

  //Função para resetar os campos quando clicar no icone de recarregar
  void _resetField(){
    setState(() {
      weightController.text = "";
      heightController.text = "";
      _textInfo = "Informe seus dados";
      _formKey = GlobalKey<FormState>();
    });
  }
  //Calcula o IMC
  void _calculateBMI(){
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text );

      double bmi = weight / (height * height);

      if(bmi <=18.5){
        _textInfo = "Abaixo do peso IMC:(${bmi.toStringAsPrecision(4)})";
      }else if(bmi >= 18.5 && (bmi) <=24.9){
        _textInfo = "Peso normal IMC:(${bmi.toStringAsPrecision(4)})";
      }else if(bmi >=25 && bmi <=29.9){
        _textInfo = "Sobrepeso IMC:(${bmi.toStringAsPrecision(4)})";
      }else if(bmi >=30 && bmi <=34.9){
        _textInfo = "Obesidade Grau I IMC:(${bmi.toStringAsPrecision(4)})";
      }else if(bmi >=35 && bmi <=39.9){
        _textInfo = "Obesidade Grau II IMC:(${bmi.toStringAsPrecision(4)})";
      }else{
        _textInfo = "Obesidade Grau III IMC(${bmi.toStringAsPrecision(4)})";
      }
    });


  }

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
              onPressed: _resetField,
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          //Cria meio que um container na vertical para colocar os campos
          child: Form(
            key: _formKey,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.account_circle_rounded,
                  size: 120, color: Colors.deepOrangeAccent),
              //Adiciona um campo de texto que somente aceita números
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Peso em (Kg)",
                    labelStyle: TextStyle(color: Colors.deepOrangeAccent)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),
                controller: weightController,
                //Verifica se o campo Peso está vazio e retorna um erro
                validator: (value) {
                  if(value.isEmpty){
                    return "Insira o seu peso";
                  }
                },
              ),
              //Adiciona um campo de texto que somente aceita números
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Digite a sua altura (cm)",
                    labelStyle: TextStyle(color: Colors.deepOrangeAccent)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),
                controller: heightController,
                  validator: (value) {
                    if(value.isEmpty){
                      return "Insira a sua altura!";
                    }
                  }
              ),
              //Cria um padding para arrumar o espaçamento do botão e o TextField
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                //Cria um container para o botão Calcular
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: (){
                      if(_formKey.currentState.validate()){
                        _calculateBMI();
                      }
                    },
                    child: Text("Calcular",
                        style: TextStyle(color: Colors.white, fontSize: 25.0)),
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              ),
              Text(
                _textInfo,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 25.0),
              )
            ],
          ),),
        ));
  }
}
