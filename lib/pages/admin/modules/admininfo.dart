import 'package:flutter/material.dart';
import 'package:flutter_lab1/providers/user_provider.dart';
import 'package:provider/provider.dart';

class UserInfoTab extends StatelessWidget {
  const UserInfoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Access Token"),
        const SizedBox(height: 16),
        Consumer<UserProvider>(
          builder: (context, userProvider, child) => Text(
            userProvider.accessToken,
            style: const TextStyle(color: Colors.blue, fontSize: 10),
          ),
        ),
        const SizedBox(height: 16),
        const Text("Refresh Token"),
        const SizedBox(height: 16),
        Consumer<UserProvider>(
          builder: (context, userProvider, child) => Text(
            userProvider.refreshToken,
            style: const TextStyle(color: Colors.blue, fontSize: 10),
          ),
        ),
      ],
    );
  }
}
