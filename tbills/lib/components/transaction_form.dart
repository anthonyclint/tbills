import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String title, double value) onSubmit;

  TransactionForm({super.key, required this.onSubmit});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final costController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final cost = double.tryParse(costController.text) ?? 0.0; //tentará converter para double, caso não consiga considerará 0

    if (title.isEmpty || cost <= 0) {
      return; //encerra o método
    }

    widget.onSubmit(title, cost);
  }

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
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: costController,
              onSubmitted: (_) => _submitForm(), //submeter o formulário se os campos estiverem preenchidos clicando no checkin do teclado sem pressionar o botão
              decoration: const InputDecoration(
                labelText: 'Valor (R\$)',
              ),
              keyboardType: const TextInputType.numberWithOptions(
                  decimal:true), //opção para que o mesmo comportamento de mudança de teclado ocorra em IOS
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _submitForm();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                    ),
                    child: const Text(
                      'Nova transação',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
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
