import 'package:flutter/material.dart';
import 'package:tbills/components/transaction_form.dart';
import 'package:tbills/components/transaction_list.dart';
import 'package:tbills/models/transaction.dart';

class TransactionUser extends StatefulWidget {
  
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {

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
    return Column(
      children: [
        TransactionList(transaction: _transactions),
        TransactionForm(),
      ],
    );
  }
}