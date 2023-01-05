import 'package:calendz_app/presentation/feature/account/view/account_view.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comptes Associés'),
      ),
      body: const AccountView(),
    );
  }
}
