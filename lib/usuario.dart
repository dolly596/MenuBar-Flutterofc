import 'dart:math';

import 'package:flutter/material.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Usuario(),
    );
  }
}

//Definindo o nome da class para definir na rota
class Usuario extends StatefulWidget {
  const Usuario({
    super.key,
  });

  @override
  State<Usuario> createState() => _MyHomePageState();
}
//Definindo as variáveis, no caso todas Strings aqui!
class _MyHomePageState extends State<Usuario> {
  TextEditingController usuarioController = new TextEditingController();
  TextEditingController senhaController = new TextEditingController();
  String _textoInfo = "Informe seus dados";

  //Criando o botão de limpar a tela
  void _limpar_Tela() {
    usuarioController.text = "";
    senhaController.text = "";
    setState(() {
      _textoInfo = "Informe seus dados";
    });
  }

  //Colocando a função do botão Cadastrar, também fazendo o tratamento de dados!
  void _cadastrar() {
    String usuer = usuarioController.text;
    String password = senhaController.text;

    if (usuer.isEmpty || password.isEmpty ) {
      setState(() {
        _textoInfo = "Campo de usuário incompleto!";
      });
    }
    else {
      setState(() {
        _textoInfo = "Dados cadastrados com sucesso!";
      });
    }
    usuarioController.text = "";
    senhaController.text = "";
  }


  @override
  Widget build(BuildContext context) {

    //Configurando a parte de cima do app e estilizando!
    return Scaffold(
      appBar: AppBar(
          title: Text("Cadastro de Usuário"),
          centerTitle: true,
          backgroundColor: Colors.lightBlueAccent,
          actions: <Widget>[
            IconButton(onPressed: _limpar_Tela, icon: Icon(Icons.refresh))
          ]),
      body: SingleChildScrollView(

        //Configurando por meio de margens, não utilizando a função "body: center"
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Icon(
              Icons.person_outline,
              size: 120.0,
              color: Colors.lightBlueAccent,
            ),

            //Colocando caixa de texto para o usuário cadastrar o usuário
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Usuário",
                  labelStyle: TextStyle(color: Colors.lightBlueAccent)),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              controller: usuarioController,
            ),

            //Colocando caixa de texto para o usuário cadastrar a senha
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(color: Colors.lightBlueAccent)),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              obscureText: true,
              controller: senhaController,
            ),

            //Estilizando o botão e também configurando ele!
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: SizedBox(
                height: 50.0,
                child: ElevatedButton(
                    onPressed: _cadastrar,child: const Text("Calcular")),
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
