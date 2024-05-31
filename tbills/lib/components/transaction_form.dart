import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  
  TransactionForm({super.key});

  final titleController = TextEditingController();
  final costController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      labelText: 'Título',
                    ),
                  ),
                  TextField(
                    controller: costController,
                    decoration: InputDecoration(
                      labelText: 'Valor (R\$)',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            print(titleController.text);
                            print(costController.text);
                          },
                          child: Text('Nova transação'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}