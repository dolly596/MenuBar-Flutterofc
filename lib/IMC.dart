import 'dart:math';
import 'Home.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyApp(),
    );
  }
}

//Definindo nome da class para colocar na rota!
class IMC extends StatefulWidget {
  const IMC({
    super.key,
  });

  @override
  State<IMC> createState() => _MyHomePageState();
}

//Criando as duas variáveis peso e altura, para realizar o cálculo
class _MyHomePageState extends State<IMC> {
  TextEditingController pesoController = new TextEditingController();
  TextEditingController alturaController = new TextEditingController();
  String _textoInfo = "Informe seus dados";

  //Criando a função do botão de limpar tudo que há no app!
  void _limpar_Tela() {
    pesoController.text = "";
    alturaController.text = "";
    setState(() {
      _textoInfo = "Informe seus dados";
    });
  }

  //Criando a função do botão, IMC, onde irá fazer o tratamento de dados e analisará o IMC e vai dar a resposta pro usuário
  void _calcular_imc() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text);

      //Realizando o cálculo e armazenando na variável "imc"
      double imc = peso / pow((altura / 100), 2);


      if (imc < 16.5) {
        _textoInfo = "Desnutrido (${imc})";
      } else if (imc <= 18.5) {
        _textoInfo = "Abaixo do peso (${imc})";
      } else if (imc <= 24.9) {
        _textoInfo = "Peso ideal (${imc})";
      } else if (imc <= 29.9) {
        _textoInfo = "Sobre peso (${imc})";
      } else if (imc <= 34.9) {
        _textoInfo = "Obesidade Grau 1 (${imc})";
      } else if (imc <= 34.9) {
        _textoInfo = "Obesidade Grau 1 (${imc})";
      } else if (imc <= 39.9) {
        _textoInfo = "Obesidade Grau 2 (${imc})";
      } else {
        _textoInfo = "Obesidade Grau 3 (${imc})";
      }
    });
  }

  //Configurando a parte de cima do APP!
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Calculadora IMC"),
          centerTitle: true,
          backgroundColor: Colors.amber,
          actions: <Widget>[
            IconButton(onPressed: _limpar_Tela, icon: Icon(Icons.refresh)),
          ]),
      body: SingleChildScrollView(

        //Ajustando para o centro o ícone e as caixas de texto por meio do padding!
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Icon(
              Icons.person_outline,
              size: 120.0,
              color: Colors.amber,
            ),

            //Criando a caixa de texto que no caso receberá a variável peso!
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "PESO (KG)",

                  //Estilizando a caixa de texto!
                  labelStyle: TextStyle(color: Colors.amber)),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              controller: pesoController,
            ),

            //Criando a caixa de texto que no caso receberá a variável altura!
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "ALTURA(CM)",
                  //Estilizando a caixa de texto!
                  labelStyle: TextStyle(color: Colors.amber)),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              controller: alturaController,
            ),

            //Definindo localização e tamanho dele
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: SizedBox(
                height: 50.0,

                //Definindo sua função!
                child: ElevatedButton(
                    onPressed: _calcular_imc, child: const Text("Calcular")),
              ),
            ),

            //Texto que permanecerá estável até o momento que realizar a função calcular, que no caso irá dar a resposta do "imc"
            Text(_textoInfo,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.amber, fontSize: 25.0)),
          ],
        ),
      ),
    );
  }
}
