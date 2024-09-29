import 'package:flutter/material.dart';
import 'contact_list.dart';
import 'transfer_list.dart';
import '../theme/app_colors.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        backgroundColor: AppColors.standardBarColor,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        children: [
          _MenuButton(
            icon: Icons.attach_money,
            label: 'Transferência',
            color: AppColors.transferPrimaryColor,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TransferList()),
              );
            },
          ),
          _MenuButton(
            icon: Icons.contacts,
            label: 'Contatos',
            color: AppColors.contactsPrimaryColor,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactList()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _MenuButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: color.withOpacity(0.8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 60, color: Colors.white),
              const SizedBox(height: 16),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}