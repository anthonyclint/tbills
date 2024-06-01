import 'package:flutter/material.dart';

import 'dart:math'; //importado para utilizar a função Random

import 'package:tbills/components/transaction_form.dart';
import 'package:tbills/components/transaction_list.dart';
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

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Tênis de corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      value: 211.30,
      date: DateTime.now(),
    )
  ];

  _addTransaction(String title, double costValue) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: costValue,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop(); //fechando o modal
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        // o underline é para indicar que o contexto não é necessário
        return TransactionForm(onSubmit: _addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        //tornando scrollavel
        child: Column(
          children: [
            Container(
              width: double.infinity, //largura infinita
              child: Card(
                child: Text('Gráfico'),
                elevation: 5,
              ),
            ),
            TransactionList(transaction: _transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, //serve para centralizar o botão
    );
  }
}
