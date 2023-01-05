import 'package:calendz_app/presentation/app/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Home"),
        const SizedBox(height: 20),
        ElevatedButton(
            onPressed: () {
              context.read<AuthBloc>().add(LogOutRequested());
            },
            child: Text("Logout"))
      ],
    );
  }
}
