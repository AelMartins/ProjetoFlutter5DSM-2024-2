import 'package:flutter/material.dart';
import '../models/contact.dart';
import '../widgets/editor.dart';
import '../theme/app_colors.dart';

class ContactForm extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();

  ContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Contact"),
        backgroundColor: AppColors.contactsPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Editor(
              controller: _nameController,
              label: 'Name',
              hint: 'John Doe',
            ),
            const SizedBox(height: 16),
            Editor(
              controller: _addressController,
              label: 'Address',
              hint: '123 Main St',
            ),
            const SizedBox(height: 16),
            Editor(
              controller: _phoneController,
              label: 'Phone',
              hint: '(99) 99999-9999',
            ),
            const SizedBox(height: 16),
            Editor(
              controller: _emailController,
              label: 'Email',
              hint: 'example@example.com',
            ),
            const SizedBox(height: 16),
            Editor(
              controller: _cpfController,
              label: 'CPF',
              hint: '123.456.789-00',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _createContact(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.contactsButtonColor,
              ),
              child: const Text('Save', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  void _createContact(BuildContext context) {
    final String name = _nameController.text;
    final String address = _addressController.text;
    final String phone = _phoneController.text;
    final String email = _emailController.text;
    final String cpf = _cpfController.text;

    if (name.isNotEmpty && address.isNotEmpty && phone.isNotEmpty && email.isNotEmpty && cpf.isNotEmpty) {
      final newContact = Contact(name, address, phone, email, cpf);
      Navigator.pop(context, newContact);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('All fields are required!')),
      );
    }
  }
}