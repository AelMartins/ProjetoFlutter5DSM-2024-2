import 'package:flutter/material.dart';
import '../models/transfer.dart';
import '../screens/transfer_form.dart';
import '../theme/app_colors.dart';

class TransferList extends StatefulWidget {
  const TransferList({super.key});

  @override
  State<StatefulWidget> createState() {
    return TransferListState();
  }
}

class TransferListState extends State<TransferList> {
  final List<Transfer> _transfers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transfers"),
        backgroundColor: AppColors.transferPrimaryColor,
      ),
      body: _transfers.isEmpty 
          ? const Center(child: Text("No transfers available."))
          : ListView.separated(
              itemCount: _transfers.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final transfer = _transfers[index];
                return ListTile(
                  title: Text(formatToCurrency(transfer.amount)),
                  subtitle: Text(transfer.accountNumber.toString()),
                  onTap: () {
                    // Ação ao tocar no item da lista, adicionar futuramente
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final receivedTransfer = await Navigator.push<Transfer?>(
            context,
            MaterialPageRoute(builder: (context) => TransferForm()),
          );
          if (receivedTransfer != null) {
            setState(() {
              _transfers.add(receivedTransfer);
            });
          }
        },
        backgroundColor: AppColors.transferButtonColor,
        child: const Icon(Icons.add),
      ),
    );
  }

  String formatToCurrency(double value) {
    // Formata a moeda para real
    return "R\$ ${value.toStringAsFixed(2).replaceAll('.', ',')}";
  }
}