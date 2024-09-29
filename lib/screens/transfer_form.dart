import 'package:flutter/material.dart';
import '../models/transfer.dart';
import '../widgets/editor.dart';

class TransferForm extends StatelessWidget {
  final TextEditingController _accountNumberController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  TransferForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Transfer"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Editor(
              controller: _accountNumberController,
              label: 'Account Number',
              hint: '0000',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            Editor(
              controller: _amountController,
              label: 'Amount',
              hint: '0.00',
              icon: Icons.monetization_on,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _createTransfer(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text('Confirm', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  void _createTransfer(BuildContext context) {
    final int? accountNumber = int.tryParse(_accountNumberController.text);
    final double? amount = double.tryParse(_amountController.text);

    if (accountNumber != null && amount != null) {
      final createdTransfer = Transfer(amount, accountNumber);
      Navigator.pop(context, createdTransfer);
    } else {
      // Display an error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid input!')),
      );
    }
  }
}