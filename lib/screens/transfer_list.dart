import 'package:flutter/material.dart';
import '../models/transfer.dart';
import 'transfer_form.dart';
import '../widgets/transfer_item.dart';

class TransferList extends StatefulWidget {
  final List<Transfer> _transfers = [];

  TransferList({super.key});

  @override
  State<TransferList> createState() => TransferListState();
}

class TransferListState extends State<TransferList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transfers"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: widget._transfers.length,
        itemBuilder: (context, index) {
          final transfer = widget._transfers[index];
          return TransferItem(transfer);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Transfer? receivedTransfer = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TransferForm()),
          );
          if (receivedTransfer != null) {
            setState(() {
              widget._transfers.add(receivedTransfer);
            });
          }
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add_circle_rounded, size: 35),
      ),
    );
  }
}