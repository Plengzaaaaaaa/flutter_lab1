import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'RegisterPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Colors.yellow, // ตั้งค่าสีเหลืองให้กับ AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow, // ตั้งค่าสีเหลืองให้กับปุ่ม
                foregroundColor: Colors.black, // ตั้งค่าสีตัวอักษรเป็นสีดำ
                padding: EdgeInsets.symmetric(
                    horizontal: 30, vertical: 15), // ปรับขนาดปุ่ม
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // ปรับขอบมนของปุ่ม
                ),
              ),
              child: Text('Login Page'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey, // ตั้งค่าสีเทาให้กับปุ่ม
                foregroundColor: Colors.white, // ตั้งค่าสีตัวอักษรเป็นสีขาว
                padding: EdgeInsets.symmetric(
                    horizontal: 30, vertical: 15), // ปรับขนาดปุ่ม
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // ปรับขอบมนของปุ่ม
                ),
              ),
              child: Text('Register Page'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[200], // ตั้งค่าพื้นหลังของหน้าเป็นสีเทาอ่อน
    );
  }
}
