import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final costController = TextEditingController();

  final void Function(String title, double value) onSubmit;

  TransactionForm({super.key, required this.onSubmit});

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
                      final title = titleController.text;
                      final cost = double.tryParse(costController.text) ??
                          0.0; //tentará converter para double, caso não consiga considerará 0
                      onSubmit(title, cost);
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
