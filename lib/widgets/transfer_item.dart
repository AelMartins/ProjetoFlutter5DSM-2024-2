import 'package:flutter/material.dart';
import '../models/transfer.dart';

class TransferItem extends StatelessWidget {
  final Transfer transfer;

  const TransferItem(this.transfer, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on, color: Colors.green),
        title: Text(transfer.amount.toStringAsFixed(2)),
        subtitle: Text('Account: ${transfer.accountNumber}'),
      ),
    );
  }
}