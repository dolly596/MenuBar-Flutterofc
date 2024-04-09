import 'dart:math';

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Produto(),
    );
  }
}

//Definindo o nome da class para definir na rota
class Produto extends StatefulWidget {
  const Produto({
    super.key,
  });

  @override
  State<Produto> createState() => _MyHomePageState();
}

//Definindo as variáveis, no caso todas Strings aqui
class _MyHomePageState extends State<Produto> {
  TextEditingController prodController = new TextEditingController();
  TextEditingController descController = new TextEditingController();
  TextEditingController precoController = new TextEditingController();
  String _textoInfo = "Informe seus dados";

  //Criando o botão de limpar tudo do APP!
  void _limpar_Tela() {
    prodController.text = "";
    descController.text = "";
    precoController.text="";
    setState(() {
      _textoInfo = "Informe os dados do produto!";
    });
  }

//Criando o botão para Cadastrar o produto e também realizando tratamento de dados!
  void _cadastrar() {
    String produto = prodController.text;
    String desc = descController.text;
    String preco = precoController.text;

    if (produto.isEmpty || desc.isEmpty  || preco.isEmpty) {
      setState(() {
        _textoInfo = "Campo de usuário incompleto!";
      });
    }
    else {
      setState(() {
        _textoInfo = "Dados cadastrados com sucesso!";
      });
    }
    prodController.text = "";
    descController.text = "";
    precoController.text="";
  }

  //Estilizando o app!
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Definindo a parte de cima do app, configurando e estilizando!
          title: Text("Cadastro do Produto"),
          centerTitle: true,
          backgroundColor: Colors.lightBlueAccent,
          actions: <Widget>[
            IconButton(onPressed: _limpar_Tela, icon: Icon(Icons.refresh))
          ]),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Icon(
              Icons.business_sharp,
              size: 120.0,
              color: Colors.lightBlueAccent,
            ),
            //Colocando um TextField, ou seja uma caixa de texto para escrever, no caso recebendo
            // a varíavel produto!
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Produto",
                  labelStyle: TextStyle(color: Colors.lightBlueAccent)),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              controller: prodController,
            ),

            //Colocando um TextField, ou seja uma caixa de texto para escrever, no caso recebendo
            // a varíavel descrição!
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Descrição",
                  labelStyle: TextStyle(color: Colors.lightBlueAccent)),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              obscureText: true,
              controller: descController,
            ),

          //Colocando um TextField, ou seja uma caixa de texto para escrever, no caso recebendo
      // a varíavel preço!
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Preço",
                  labelStyle: TextStyle(color: Colors.lightBlueAccent)),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              obscureText: true,
              controller: precoController,
            ),

            //Estilizando o botão e também configurando ele!
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: SizedBox(
                height: 50.0,
                child: ElevatedButton(
                    onPressed: _cadastrar,child: const Text("Cadastrar")),
              ),
            ),

            //Texto que fica ali até apertar cadastrar e aparecer se obteve sucesso ou falhou em algo!
            Text(_textoInfo,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.lightBlueAccent, fontSize: 25.0)),
          ],
        ),
      ),
    );
  }
}
