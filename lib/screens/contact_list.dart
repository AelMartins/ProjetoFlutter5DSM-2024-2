import 'package:flutter/material.dart';
import '../models/contact.dart';
import '../screens/contact_form.dart';
import '../theme/app_colors.dart';

class ContactList extends StatefulWidget {
  final List<Contact> _contacts = [];

  ContactList({super.key});

  @override
  State<StatefulWidget> createState() {
    return ContactListState();
  }
}

class ContactListState extends State<ContactList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
        backgroundColor: AppColors.contactsPrimaryColor,
      ),
      body: ListView.builder(
        itemCount: widget._contacts.length,
        itemBuilder: (context, index) {
          final contact = widget._contacts[index];
          return ListTile(
            title: Text('Nome: ${contact.name}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('CPF: ${contact.cpf}'),
                Text('Telefone: ${contact.phone}'),
                Text('E-mail: ${contact.email}'),
                Text('Endereço: ${contact.address}'),
              ],
            ),
            onTap: () {
              // Implementar ação ao tocar em um contato, futuramente.
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Contact?> future = Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ContactForm();
          }));
          future.then((contactReceived) {
            if (contactReceived != null) {
              setState(() {
                widget._contacts.add(contactReceived);
              });
            }
          });
        },
        backgroundColor: AppColors.contactsButtonColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}