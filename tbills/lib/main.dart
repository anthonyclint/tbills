import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    final ColorScheme colorScheme1 = ColorScheme.fromSeed(
      seedColor: Colors.purple,
      brightness: Brightness.dark,
    );

    final ColorScheme colorScheme2 = ColorScheme.fromSwatch(
      primarySwatch: Colors.deepPurple, brightness: Brightness.dark).copyWith(
        secondary: Colors.amber
    );

    const AppBarTheme appBarTheme = AppBarTheme(
      titleTextStyle: TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 20,
        fontWeight: FontWeight.bold,
      )
    );

    const TextTheme textTheme = TextTheme(
          displayLarge: TextStyle(
            fontSize: 18,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            //color: Colors.black,
          ),
        );

    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme2,
        textTheme: textTheme,
        appBarTheme: appBarTheme,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = [
   /* Transaction(
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
    )*/
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
      builder: (_) {// o underline é para indicar que o contexto não é necessário
        return TransactionForm(onSubmit: _addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        backgroundColor: Colors.deepPurple,
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
                color: Colors.blue[700],
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
