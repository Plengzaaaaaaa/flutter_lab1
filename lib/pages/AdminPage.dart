import 'package:flutter/material.dart';
import 'package:flutter_lab1/providers/user_provider.dart';
import 'package:provider/provider.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Page'),
        backgroundColor: Colors.yellow, // ตั้งค่าสีเหลืองให้กับ AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: const Text(" accessToken "),
            ),
            // Text(
            //   userProvider.accessToken,
            //   style: const TextStyle(color: Colors.green),
            // ),
            const SizedBox(height: 16),
            // Text(
            //   context.watch<UserProvider>().accessToken,
            //   style: const TextStyle(color: Colors.red),
            // ),
            const SizedBox(height: 16),
            Consumer(
              builder: (context, value, child) => Text(
                userProvider.accessToken,
                style: const TextStyle(color: Colors.blue),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      backgroundColor: Colors.grey[200], // ตั้งค่าพื้นหลังของหน้าเป็นสีเทาอ่อน
    );
  }
}
