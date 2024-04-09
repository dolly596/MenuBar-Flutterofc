import 'package:flutter/material.dart';

//Definindo nome da class para colocar na rota!
class Contador extends StatelessWidget {
  const Contador({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors. blueGrey),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'AAA'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
//Criando as funções aqui, no caso essa a de incrementar número!
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  //Criando as funções aqui, no caso essa a de reduzir o número!
  void _decrementCounter() {
    setState(() {

      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {

    //COnfigurando a parte de cima do APP!
    return Scaffold(
      appBar: AppBar(


        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text('Contador'),
      ),

      //Definindo que tudo que estiver dentro do Body, estará no centro!
      body: Center(

        //Definindo como coluna os text fields, para ficar um baixo do outro!
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            //Definindo como linha os botões, para ficarem um no lado do outro
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                //Criando o botão de adição!
                ElevatedButton(
                    onPressed: _incrementCounter,
                    child: const Icon(Icons.add)),

                //Criando o botão de remover!
                ElevatedButton(
                    onPressed: _decrementCounter,
                    child: const Icon(Icons.remove))
              ],
            )
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),*/
    );
  }
}
