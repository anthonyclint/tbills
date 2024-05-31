class Transaction {
  //propriedades da classe
  final String id;
  final String title;
  final double value;
  final DateTime date;
 
  //construtor
  Transaction({
    required this.id,
    required this.title,
    required this.value,
    required this.date,
  });
}