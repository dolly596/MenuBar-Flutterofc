import 'package:flutter/material.dart';
import 'contador.dart';
import 'produto.dart';
import 'usuario.dart';
import 'IMC.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _HomePageState();
}

//Criando a parte de cima do app!
class _HomePageState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MENU"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),


      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //Definindo o icone que ficará no centro e também estilizando
            const Icon(

              Icons.add_business_sharp,
              size: 140.0,
              color: Colors.green,
            ),

            //Texto que aparecerá em baixo!
            Text(
              "Aplicação Principal",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.greenAccent, fontSize: 25.0),
            ),
            Text(
              "",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.greenAccent, fontSize: 25.0),
            ),

            //Definindo onde vai ficar os botões que irá para os outros app!
            Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[

                  //Definindo o botão que vai para o APP "IMC", lembrando essa rota não é a nomeada, pois ja estava feito a nomeada
                  ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const IMC())
                      );
                    },
                    //estilizando o botão!
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.white54),
                      ),
                    //colocando texto dentro do botão
                    child: const Text('IMC'),
                  ),
                  //Definindo o botão que vai para o APP "Contador", lembrando essa rota não é a nomeada, pois ja estava feito a nomeada
                  ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Contador())
                      );
                    },
                    //estilizando o botão!
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white54),
                    ),
                    //colocando texto dentro do botão
                    child: const Text('Contador'),
                  ),

                  //Definindo o botão que vai para o APP "Usuario", lembrando essa rota não é a nomeada, pois ja estava feito a nomeada
                  ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Usuario())
                      );
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.white54),
                      );
                    },
                    //Estilizando o botão!
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white54),
                    ),
                    //colocando texto dentro do botão
                    child: const Text('Usuário'),
                  ),
                  //Definindo o botão que vai para o APP "Produto", lembrando essa rota não é a nomeada, pois ja estava feito a nomeada
                  ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Produto())
                      );
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.white54),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white54),
                    ),
                    child: const Text('Produto'),
                  ),
                ]),
          ],
        ),
      ), // Botão para executar o calculo do IMC,
    );
  }
}