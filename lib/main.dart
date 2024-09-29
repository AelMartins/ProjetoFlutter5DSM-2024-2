import 'package:flutter/material.dart';
import 'screens/transfer_list.dart';

void main() => runApp(const BankApp());

class BankApp extends StatelessWidget {
  const BankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank Transfer',
      home: TransferList(),
    );
  }
}