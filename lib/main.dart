import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: const ListaTransferencia(),
          appBar: AppBar(
            //cololocar cor no texto Transferência
            title: const Text(
              "Transferência",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.blue,
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.blue,
              child: const Icon(
                Icons.add,
                size: 35,
                color: Colors.white,
              )),
        ),
      ),
    );

class ListaTransferencia extends StatelessWidget {
  const ListaTransferencia({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ItemTransferencia(value: '100.00', accountNumber: '1234-5'),
      ],
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final String value;
  final String accountNumber;

  const ItemTransferencia({
    required this.value,
    required this.accountNumber,
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on, color: Colors.green),
        title: Text(value),
        subtitle: Text(accountNumber),
      ),
    );
  }
}
