import 'package:flutter/material.dart';
import 'package:tbills/models/transaction.dart';
import 'package:intl/intl.dart'; //importanto o pacote intl para manipular data

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
//color: Theme.of(context).colorScheme.primary,
  TransactionList({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      //limitando o scrollamento
      height: 500, //300,
      child: ListView.builder(
        itemCount: transaction.length, //restringindo a renderização dos elementos da lista
        itemBuilder: (newContext, index) { //constrói os elementos da lista sob demanda
          
          final tr = transaction[index];

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
                      color: Colors.amber[400]!,
                      width: 2,
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'R\$ ${tr.value.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.amber,
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
        },
      ),
    );
  }
}
