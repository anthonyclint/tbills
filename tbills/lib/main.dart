import 'package:flutter/material.dart';
import 'package:tbills/components/transaction_user.dart';
import 'package:tbills/models/transaction.dart';


//método que executa o app
main() => runApp(TbillsApp());

class TbillsApp extends StatelessWidget {
  const TbillsApp({super.key});

  //método que chama a tela inicial do app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  //construtor
  //HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              
            },
          ),
        ],
      ),
      body: SingleChildScrollView( //tornando scrollavel
        child: Column(
          children: [
            Container(
              width: double.infinity, //largura infinita
              child: Card(
                child: Text('Gráfico'),
                elevation: 5,
              ),
            ),
            TransactionUser(),
          ],
        ),
      ),
    );
  }
}
