import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
        backgroundColor: Colors.yellow, // ตั้งค่าสีเหลืองให้กับ AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text("AdminPage "),
            )
          ],
        ),
      ),
      backgroundColor: Colors.grey[200], // ตั้งค่าพื้นหลังของหน้าเป็นสีเทาอ่อน
    );
  }
}
