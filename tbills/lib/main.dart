import 'package:flutter/material.dart';
import 'package:tbills/models/transaction.dart';
import 'package:intl/intl.dart'; //importanto o pacote intl para manipular data

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
  HomePage({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity, //largura infinita
            child: Card(
              child: Text('Gráfico'),
              elevation: 5,
            ),
          ),
          Column(
            children: _transactions.map((tr) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple[50]!,
                          width: 2,
                        ),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'R\$ ${tr.value.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tr.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat('d MMM y').format(tr.date),
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
